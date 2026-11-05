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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _45;
    float _73 = _71 * _51;
    float _75 = _71 * _57;
    float _77 = _71 * _63;
    float _79 = _71 * _69;
    float2 _388 = float2(_73, _75);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_388, float2(0.0), isnan(_388))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_388, float2(0.0), isnan(_388))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _405 = float2(_73, _75);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_405, float2(0.0), isnan(_405))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_405, float2(0.0), isnan(_405))).x;
    float2 _413 = float2(_77, _79);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_413, float2(0.0), isnan(_413))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    bool _106 = _73 >= (*spvDescriptorSet0.fp_c3)._m0[35].x;
    bool _108 = isnan(_73);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.fp_c3)._m0[35].x);
    bool _114 = _110 || _112;
    float _116 = precise::min(_87, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _118 = precise::min(_85, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _120 = precise::min(_89, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _122 = _116 * 0.715200006961822509765625;
    float _124 = fma(_118, 0.2125999927520751953125, _122);
    float _126 = fma(_120, 0.072200000286102294921875, _124);
    float _128 = 1.0 / _126;
    float _130 = _128 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _120 * _134;
    float _146 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _148 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _150 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _152 = -_91;
    float _154 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _156 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[11].x, _146);
    float _158 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[11].z, _148);
    float _160 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[11].w, _150);
    float _162 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = 1.0 / _154;
    float _168 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[12].x, _156);
    float _174 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[12].z, _158);
    float _176 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[12].w, _160);
    float _178 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[13].x, _172);
    float _184 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[13].z, _174);
    float _186 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[13].w, _176);
    float _188 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[14].x, _182);
    float _190 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[14].z, _184);
    float _192 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[14].w, _186);
    float _198 = _126 * _134;
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[15].x, _188);
    float _202 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[15].z, _190);
    float _204 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _206 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[0].w, _204);
    float _208 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[15].w, _196);
    float _210 = -_200;
    float _212 = _198 + _210;
    float _214 = _202;
    if (!_114)
    {
        float _216 = _202 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _214 = _216;
    }
    float _218 = _214;
    float _220 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _208 * _212;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _218 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _230 = _222 * _222;
    float _232 = -_228;
    float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _236 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[28].z, _226);
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[34].z, _228);
    float _242 = -_226;
    float _244 = _242 + _238;
    float _246 = _118 * _134;
    float _248 = _116 * _134;
    float _250 = _240 * _244;
    float _252 = _240 * _238;
    float _254 = _246 * _250;
    float _256 = _248 * _250;
    float _258 = _144 * _250;
    float _260 = precise::max(_254, _256);
    float _262 = _246 * _252;
    float _264 = _144 * _252;
    float _266 = precise::max(_258, _260);
    float _268 = _248 * _252;
    float _270 = precise::min(_262, _266);
    float _272 = precise::min(_268, _266);
    float _274 = precise::min(_264, _266);
    float _276 = -_270;
    float _278 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[31].w, _262);
    float _280 = -_272;
    float _282 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[31].w, _268);
    float _284 = -_274;
    float _286 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[31].w, _264);
    float _288 = _278 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _290 = _282 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _292 = _286 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _294 = _96 * _102;
    float _296 = precise::min(_288, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _298 = precise::min(_290, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _300 = _98 * _102;
    float _302 = precise::min(_292, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _304 = _100 * _102;
    float _306 = precise::max(0.0, _296);
    float _308 = precise::max(0.0, _298);
    float _310 = precise::max(0.0, _302);
    float _312 = _306 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _314 = _308 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _316 = _310 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _318 = fma(_294, _312, _262);
    float _320 = fma(_300, _314, _268);
    float _322 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _324 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _326 = fma(_304, _316, _264);
    float _328 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _330 = fma(_294, _322, _318);
    float _332 = fma(_300, _324, _320);
    float _334 = fma(_304, _328, _326);
    out.m_38.x = _330;
    out.m_38.y = _332;
    out.m_38.z = _334;
    out.m_38.w = _266;
    return out;
}

