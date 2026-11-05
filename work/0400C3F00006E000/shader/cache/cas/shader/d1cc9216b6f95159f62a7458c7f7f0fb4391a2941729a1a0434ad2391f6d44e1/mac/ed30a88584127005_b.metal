#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _43;
    float _71 = _69 * _49;
    float _73 = _69 * _55;
    float _75 = _69 * _61;
    float _77 = _69 * _67;
    float2 _368 = float2(_73, _71);
    float3 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_368, float2(0.0), isnan(_368))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_368, float2(0.0), isnan(_368))).xyz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float2 _385 = float2(_77, _75);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_385, float2(0.0), isnan(_385))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    bool _102 = _73 >= (*spvDescriptorSet0.fp_c3)._m0[35].x;
    bool _104 = isnan(_73);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.fp_c3)._m0[35].x);
    bool _110 = _106 || _108;
    float _112 = precise::min(_85, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _114 = precise::min(_83, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _116 = precise::min(_87, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _118 = _112 * 0.715200006961822509765625;
    float _120 = fma(_114, 0.2125999927520751953125, _118);
    float _122 = fma(_116, 0.072200000286102294921875, _120);
    float _124 = 1.0 / _122;
    float _126 = _124 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _132 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float _136 = _114 * _130;
    float _138 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _144 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _146 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _148 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _150 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[11].x, _142);
    float _152 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[11].y, _144);
    float _154 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[11].z, _146);
    float _156 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[11].w, _148);
    float _158 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[12].z, _154);
    float _168 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[12].x, _150);
    float _170 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[12].y, _152);
    float _172 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[12].w, _156);
    float _174 = _122 * _130;
    float _176 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[13].z, _166);
    float _182 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[13].x, _168);
    float _184 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = 1.0 / _174;
    float _190 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].z, _180);
    float _192 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[13].y, _170);
    float _194 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[13].w, _172);
    float _196 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].x, _182);
    float _198 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[15].z, _190);
    float _200 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].y, _192);
    float _202 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].w, _194);
    float _204 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[15].x, _196);
    float _206 = _198;
    if (!_110)
    {
        float _208 = _198 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _206 = _208;
    }
    float _210 = _206;
    float _212 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[15].y, _200);
    float _214 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[15].w, _202);
    float _216 = -_204;
    float _218 = _174 + _216;
    float _220 = _210 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _222 = _116 * _130;
    float _224 = _112 * _130;
    float _226 = _214 * _218;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = _212 * _188;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = -_220;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _238 = _228 * _232;
    float _240 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[34].z, _220);
    float _242 = _240 * _238;
    float _244 = _92 * _98;
    float _246 = _94 * _98;
    float _248 = _96 * _98;
    float _250 = _136 * _242;
    float _252 = _222 * _242;
    float _254 = _224 * _242;
    float _256 = precise::min(0.0, _250);
    float _258 = precise::min(0.0, _252);
    float _260 = precise::min(0.0, _254);
    float _262 = -_256;
    float _264 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[31].w, _250);
    float _266 = -_258;
    float _268 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[31].w, _252);
    float _270 = -_260;
    float _272 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[31].w, _254);
    float _274 = _264 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _276 = _268 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _278 = _272 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _280 = precise::min(_274, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _282 = precise::min(_276, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _284 = precise::min(_278, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _286 = precise::max(0.0, _280);
    float _288 = precise::max(0.0, _282);
    float _290 = precise::max(0.0, _284);
    float _292 = _286 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _294 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _300 = fma(_244, _292, _250);
    float _302 = fma(_248, _296, _252);
    float _304 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _306 = fma(_246, _298, _254);
    float _308 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _310 = fma(_244, _294, _300);
    float _312 = fma(_246, _304, _306);
    float _314 = fma(_248, _308, _302);
    out.m_36.x = _310;
    out.m_36.y = _312;
    out.m_36.z = _314;
    out.m_36.w = 0.0;
    return out;
}

