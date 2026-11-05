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
    float2 _408 = float2(_73, _75);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_408, float2(0.0), isnan(_408))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _425 = float2(_73, _75);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_425, float2(0.0), isnan(_425))).x;
    float2 _433 = float2(_77, _79);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_433, float2(0.0), isnan(_433))).xyzw;
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
    float _118 = -_91;
    float _120 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _122 = precise::min(_85, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _124 = precise::min(_89, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _126 = _116 * 0.715200006961822509765625;
    float _128 = 1.0 / _120;
    float _130 = fma(_122, 0.2125999927520751953125, _126);
    float _132 = fma(_124, 0.072200000286102294921875, _130);
    float _134 = 1.0 / _132;
    float _136 = _134 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _142 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _124 * _140;
    float _148 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _154 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _156 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _158 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _160 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[11].x, _152);
    float _162 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[11].y, _154);
    float _164 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[11].z, _156);
    float _166 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[11].w, _158);
    float _168 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[12].x, _160);
    float _174 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[12].y, _162);
    float _176 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[12].z, _164);
    float _178 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[12].w, _166);
    float _180 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = _132 * _140;
    float _186 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].x, _172);
    float _192 = 1.0 / _184;
    float _194 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].y, _174);
    float _196 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].z, _176);
    float _198 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].w, _178);
    float _200 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[14].x, _190);
    float _206 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[14].y, _194);
    float _208 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[14].z, _196);
    float _210 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[15].x, _204);
    float _212 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[14].w, _198);
    float _214 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[15].y, _206);
    float _216 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[15].z, _208);
    float _218 = -_210;
    float _220 = _184 + _218;
    float _222 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[15].w, _212);
    float _224 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _226 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[0].w, _224);
    float _228 = _214 * _192;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = _216;
    if (!_114)
    {
        float _234 = _216 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _232 = _234;
    }
    float _236 = _232;
    float _238 = _222 * _220;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _236 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _248 = _240 * _230;
    float _250 = _244 * _244;
    float _252 = -_246;
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _256 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[28].z, _248);
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[34].z, _246);
    float _262 = _122 * _140;
    float _264 = -_248;
    float _266 = _264 + _258;
    float _268 = _116 * _140;
    float _270 = _260 * _266;
    float _272 = _260 * _258;
    float _274 = _262 * _270;
    float _276 = _268 * _270;
    float _278 = _146 * _270;
    float _280 = precise::max(_274, _276);
    float _282 = _262 * _272;
    float _284 = _146 * _272;
    float _286 = precise::max(_278, _280);
    float _288 = _268 * _272;
    float _290 = precise::min(_282, _286);
    float _292 = precise::min(_288, _286);
    float _294 = precise::min(_284, _286);
    float _296 = -_290;
    float _298 = fma(_296, (*spvDescriptorSet0.fp_c3)._m0[31].w, _282);
    float _300 = -_292;
    float _302 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[31].w, _288);
    float _304 = -_294;
    float _306 = fma(_304, (*spvDescriptorSet0.fp_c3)._m0[31].w, _284);
    float _308 = _298 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _310 = _302 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _312 = _306 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _314 = _96 * _102;
    float _316 = precise::min(_308, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _318 = precise::min(_310, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _320 = _98 * _102;
    float _322 = precise::min(_312, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _324 = _100 * _102;
    float _326 = precise::max(0.0, _316);
    float _328 = precise::max(0.0, _318);
    float _330 = precise::max(0.0, _322);
    float _332 = _326 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _334 = _328 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _336 = _330 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _338 = fma(_314, _332, _282);
    float _340 = fma(_320, _334, _288);
    float _342 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _344 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _346 = fma(_324, _336, _284);
    float _348 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _350 = fma(_314, _342, _338);
    float _352 = fma(_320, _344, _340);
    float _354 = fma(_324, _348, _346);
    out.m_38.x = _350;
    out.m_38.y = _352;
    out.m_38.z = _354;
    out.m_38.w = _286;
    return out;
}

