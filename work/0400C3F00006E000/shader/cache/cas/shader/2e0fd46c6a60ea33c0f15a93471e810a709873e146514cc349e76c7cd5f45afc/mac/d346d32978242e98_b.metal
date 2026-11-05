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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0), center_no_perspective]];
    float4 m_39 [[user(locn1), center_no_perspective]];
    float4 m_35 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _49 = in.m_35.x;
    float _51 = in.m_35.y;
    float2 _367 = float2(_49, _51);
    float _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_367, float2(0.0), isnan(_367))).x;
    float2 _378 = float2(_49, _51);
    float4 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_378, float2(0.0), isnan(_378))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_378, float2(0.0), isnan(_378))).xyzw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float _64 = _56.w;
    float _66 = in.m_37.w;
    float _68 = in.m_37.x;
    float _70 = in.m_37.y;
    float _72 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _74 = -_72;
    float _76 = fma(_74, _66, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _78 = -_72;
    float _80 = fma(_78, _68, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _82 = -_72;
    float _84 = fma(_82, _70, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _86 = 1.0 / _76;
    float _88 = fma(_80, _86, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _90 = fma(_84, _86, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _92 = _88 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _94 = _90 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _456 = float2(_64, 0.0);
    float2 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_456, float2(0.0), isnan(_456))).xy;
    float _100 = _98.x;
    float _102 = _98.y;
    float2 _468 = float2(_92, _94);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_468, float2(0.0), isnan(_468))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_468, float2(0.0), isnan(_468))).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = in.m_39.y;
    float _116 = in.m_37.z;
    float _118 = in.m_39.x;
    float _120 = in.m_39.z;
    float _122 = fma(_60, 2.0, -1.0);
    float _124 = fma(_58, 2.0, -1.0);
    float _126 = fma(_62, 2.0, -1.0);
    float _128 = _114 * _114;
    float _130 = -_72;
    float _132 = fma(_130, _116, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _134 = fma(_118, _118, _128);
    float _136 = fma(_132, -0.5, 0.5);
    float _138 = _134 + 1.0;
    bool _142 = _136 <= 1.0;
    bool _144 = isnan(_136);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = float(_150);
    float _154 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _156 = rsqrt(_138);
    float _158 = _136 * _152;
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _154);
    float _164 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _162);
    float _166 = abs(_160);
    float _168 = log2(_166);
    float _170 = rsqrt(_164);
    float _172 = _114 * _156;
    float _174 = _118 * _156;
    float _176 = _156 * _120;
    float _178 = precise::min(_80, _84);
    float _180 = precise::max(_80, _84);
    float _182 = _168 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    bool _184 = _178 >= 0.0;
    bool _186 = isnan(_178);
    bool _188 = _184 || _186;
    bool _190 = isnan(0.0);
    bool _192 = _188 || _190;
    float _194 = exp2(_182);
    bool _196 = _76 >= _180;
    bool _198 = isnan(_76);
    bool _200 = _196 || _198;
    bool _202 = isnan(_180);
    bool _204 = _200 || _202;
    bool _206 = _204 && _192;
    float _208 = float(_206);
    float _210 = _170 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _212 = _170 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _214 = _170 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _216 = -_172;
    float _218 = _210 + _216;
    float _220 = -_174;
    float _222 = _212 + _220;
    float _224 = -_176;
    float _226 = _214 + _224;
    float _228 = _124 * _212;
    float _230 = _218 * _218;
    float _232 = _122 * _218;
    float _234 = -_218;
    float _236 = _172 * _234;
    float _238 = -_172;
    float _240 = _122 * _238;
    float _242 = fma(_222, _222, _230);
    float _244 = -_124;
    float _246 = -_232;
    float _248 = fma(_244, _222, _246);
    float _250 = -_174;
    float _252 = fma(_250, _222, _236);
    float _254 = -_240;
    float _256 = fma(_124, _174, _254);
    float _258 = fma(_226, _226, _242);
    float _260 = -_126;
    float _262 = fma(_260, _226, _248);
    float _264 = -_210;
    float _266 = -_228;
    float _268 = fma(_122, _264, _266);
    float _270 = -_176;
    float _272 = fma(_270, _226, _252);
    float _274 = _122 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _276 = fma(_126, _176, _256);
    float _278 = rsqrt(_258);
    float _280 = -_214;
    float _282 = fma(_126, _280, _268);
    float _284 = fma(_124, (*spvDescriptorSet0.fp_c4)._m0[15].x, _274);
    float _286 = _208 * _194;
    float _288 = precise::min(_276, _282);
    float _290 = fma(_126, (*spvDescriptorSet0.fp_c4)._m0[15].z, _284);
    float _292 = 1.0 / _272;
    float _294 = _286 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _296 = -_170;
    float _298 = fma(_296, _290, 0.0);
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = _278 * _262;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = abs(_304);
    float _308 = log2(_306);
    float _310 = _304 * _288;
    float _312 = _310 * 2.0;
    float _314 = _312 * _292;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = _100 * _308;
    float _320 = _294 * _300;
    float _322 = exp2(_318);
    float _324 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _326 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _328 = _324 * 0.586610972881317138671875;
    float _330 = _112 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _332 = fma(_326, 0.298911988735198974609375, _328);
    float _334 = _108 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _336 = _330 * _320;
    float _338 = _334 * _320;
    float _340 = _294 * _322;
    float _342 = _112 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _344 = _316 * _340;
    float _346 = _110 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _348 = fma(_342, 0.114477999508380889892578125, _332);
    float _350 = _102 * _344;
    float _352 = _346 * _320;
    float _354 = _350 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _356 = _348 * _354;
    out.m_42.x = _338;
    out.m_42.y = _352;
    out.m_42.z = _336;
    out.m_42.w = _356;
    return out;
}

