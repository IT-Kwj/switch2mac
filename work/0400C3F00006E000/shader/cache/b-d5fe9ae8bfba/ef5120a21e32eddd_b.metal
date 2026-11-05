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
    float4 m_44 [[color(1)]];
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
    float _51 = in.m_35.x;
    float _53 = in.m_35.y;
    float2 _363 = float2(_51, _53);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_363, float2(0.0), isnan(_363))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_363, float2(0.0), isnan(_363))).x;
    float2 _374 = float2(_51, _53);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_374, float2(0.0), isnan(_374))).xyzw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = _58.w;
    float _68 = in.m_37.w;
    float _70 = in.m_37.x;
    float _72 = in.m_37.y;
    float _74 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _76 = -_74;
    float _78 = fma(_76, _68, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _80 = -_74;
    float _82 = fma(_80, _70, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _84 = -_74;
    float _86 = fma(_84, _72, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _88 = 1.0 / _78;
    float _90 = fma(_82, _88, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _92 = fma(_86, _88, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _94 = _90 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _96 = _92 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _452 = float2(_66, 0.0);
    float2 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_452, float2(0.0), isnan(_452))).xy;
    float _102 = _100.x;
    float _104 = _100.y;
    float2 _464 = float2(_94, _96);
    float3 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_464, float2(0.0), isnan(_464))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_464, float2(0.0), isnan(_464))).xyz;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = in.m_39.y;
    float _118 = in.m_37.z;
    float _120 = in.m_39.x;
    float _122 = in.m_39.z;
    float _124 = fma(_62, 2.0, -1.0);
    float _126 = fma(_60, 2.0, -1.0);
    float _128 = fma(_64, 2.0, -1.0);
    float _130 = _116 * _116;
    float _132 = -_74;
    float _134 = fma(_132, _118, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _136 = fma(_120, _120, _130);
    float _138 = fma(_134, -0.5, 0.5);
    float _140 = _136 + 1.0;
    bool _144 = _138 <= 1.0;
    bool _146 = isnan(_138);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = float(_152);
    float _156 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _158 = rsqrt(_140);
    float _160 = _138 * _154;
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _156);
    float _166 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _164);
    float _168 = abs(_162);
    float _170 = log2(_168);
    float _172 = rsqrt(_166);
    float _174 = _116 * _158;
    float _176 = _120 * _158;
    float _178 = _158 * _122;
    float _180 = precise::min(_82, _86);
    float _182 = precise::max(_82, _86);
    float _184 = _170 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    bool _186 = _180 >= 0.0;
    bool _188 = isnan(_180);
    bool _190 = _186 || _188;
    bool _192 = isnan(0.0);
    bool _194 = _190 || _192;
    float _196 = exp2(_184);
    bool _198 = _78 >= _182;
    bool _200 = isnan(_78);
    bool _202 = _198 || _200;
    bool _204 = isnan(_182);
    bool _206 = _202 || _204;
    bool _208 = _206 && _194;
    float _210 = float(_208);
    float _212 = _172 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _214 = _172 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _216 = _172 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _218 = -_174;
    float _220 = _212 + _218;
    float _222 = -_176;
    float _224 = _214 + _222;
    float _226 = -_178;
    float _228 = _216 + _226;
    float _230 = _126 * _214;
    float _232 = _220 * _220;
    float _234 = _124 * _220;
    float _236 = -_220;
    float _238 = _174 * _236;
    float _240 = -_174;
    float _242 = _124 * _240;
    float _244 = fma(_224, _224, _232);
    float _246 = -_126;
    float _248 = -_234;
    float _250 = fma(_246, _224, _248);
    float _252 = -_176;
    float _254 = fma(_252, _224, _238);
    float _256 = -_242;
    float _258 = fma(_126, _176, _256);
    float _260 = fma(_228, _228, _244);
    float _262 = -_128;
    float _264 = fma(_262, _228, _250);
    float _266 = -_212;
    float _268 = -_230;
    float _270 = fma(_124, _266, _268);
    float _272 = _124 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _274 = -_178;
    float _276 = fma(_274, _228, _254);
    float _278 = fma(_128, _178, _258);
    float _280 = rsqrt(_260);
    float _282 = fma(_126, (*spvDescriptorSet0.fp_c4)._m0[15].x, _272);
    float _284 = -_216;
    float _286 = fma(_128, _284, _270);
    float _288 = _210 * _196;
    float _290 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[15].z, _282);
    float _292 = precise::min(_278, _286);
    float _294 = 1.0 / _276;
    float _296 = -_172;
    float _298 = fma(_296, _290, 0.0);
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = _280 * _264;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = abs(_304);
    float _308 = log2(_306);
    float _310 = _304 * _292;
    float _312 = _310 * 2.0;
    float _314 = _312 * _294;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = _102 * _308;
    float _320 = _288 * _300;
    float _322 = exp2(_318);
    float _324 = _110 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _326 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _328 = _114 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _330 = _114 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _332 = _324 * _320;
    float _334 = _328 * _320;
    float _336 = _288 * _322;
    float _338 = _316 * _336;
    float _340 = _112 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _342 = _112 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _344 = _104 * _338;
    float _346 = _340 * _320;
    float _348 = _326 * _344;
    float _350 = _342 * _344;
    float _352 = _330 * _344;
    out.m_42.x = _332;
    out.m_42.y = _346;
    out.m_42.z = _334;
    out.m_44.x = _348;
    out.m_44.y = _350;
    out.m_44.z = _352;
    return out;
}

