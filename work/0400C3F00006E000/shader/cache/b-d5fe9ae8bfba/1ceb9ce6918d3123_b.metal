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
    float2 _377 = float2(_51, _53);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).x;
    float2 _388 = float2(_51, _53);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_388, float2(0.0), isnan(_388))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_388, float2(0.0), isnan(_388))).xyzw;
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
    float2 _466 = float2(_66, 0.0);
    float2 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_466, float2(0.0), isnan(_466))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_466, float2(0.0), isnan(_466))).xy;
    float _102 = _100.x;
    float _104 = _100.y;
    float2 _478 = float2(_94, _96);
    float3 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_478, float2(0.0), isnan(_478))).xyz;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = in.m_39.y;
    float _118 = in.m_39.x;
    float _120 = in.m_39.z;
    float _122 = fma(_64, 2.0, -1.0);
    float _124 = _116 * _116;
    float _126 = -_74;
    float _128 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _130 = fma(_126, _116, _128);
    float _132 = -_74;
    float _134 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _136 = fma(_132, _118, _134);
    float _138 = fma(_118, _118, _124);
    float _140 = _138 + 1.0;
    float _142 = _130 * _130;
    float _144 = -_74;
    float _146 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _148 = fma(_144, _120, _146);
    float _150 = fma(_136, _136, _142);
    float _152 = rsqrt(_140);
    float _154 = -_78;
    float _156 = fma(_154, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _158 = fma(_148, _148, _150);
    bool _162 = _156 <= 1.0;
    bool _164 = isnan(_156);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = float(_170);
    float _174 = rsqrt(_158);
    float _176 = _156 * _172;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _116 * _152;
    float _182 = _118 * _152;
    float _184 = _120 * _152;
    float _186 = abs(_178);
    float _188 = log2(_186);
    float _190 = _130 * _174;
    float _192 = _136 * _174;
    float _194 = _148 * _174;
    float _196 = -_180;
    float _198 = _190 + _196;
    float _200 = -_182;
    float _202 = _192 + _200;
    float _204 = -_184;
    float _206 = _194 + _204;
    float _208 = _198 * _198;
    float _210 = -_198;
    float _212 = _180 * _210;
    float _214 = _188 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _216 = fma(_60, 2.0, -1.0);
    float _218 = fma(_202, _202, _208);
    float _220 = fma(_62, 2.0, -1.0);
    float _222 = exp2(_214);
    float _224 = _216 * _192;
    float _226 = fma(_206, _206, _218);
    float _228 = _220 * _198;
    float _230 = -_182;
    float _232 = fma(_230, _202, _212);
    float _234 = -_180;
    float _236 = _220 * _234;
    float _238 = -_190;
    float _240 = -_224;
    float _242 = fma(_220, _238, _240);
    float _244 = -_216;
    float _246 = -_228;
    float _248 = fma(_244, _202, _246);
    float _250 = rsqrt(_226);
    float _252 = -_184;
    float _254 = fma(_252, _206, _232);
    float _256 = -_236;
    float _258 = fma(_216, _182, _256);
    float _260 = -_122;
    float _262 = fma(_260, _206, _248);
    float _264 = precise::min(_82, _86);
    float _266 = _220 * _130;
    float _268 = fma(_122, _184, _258);
    float _270 = -_194;
    float _272 = fma(_122, _270, _242);
    float _274 = 1.0 / _254;
    float _276 = precise::max(_82, _86);
    float _278 = fma(_216, _136, _266);
    bool _280 = _264 >= 0.0;
    bool _282 = isnan(_264);
    bool _284 = _280 || _282;
    bool _286 = isnan(0.0);
    bool _288 = _284 || _286;
    float _290 = precise::min(_268, _272);
    float _292 = fma(_122, _148, _278);
    bool _294 = _78 >= _276;
    bool _296 = isnan(_78);
    bool _298 = _294 || _296;
    bool _300 = isnan(_276);
    bool _302 = _298 || _300;
    bool _304 = _302 && _288;
    float _306 = float(_304);
    float _308 = _250 * _262;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = -_174;
    float _314 = fma(_312, _292, 0.0);
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = abs(_310);
    float _320 = log2(_318);
    float _322 = _306 * _222;
    float _324 = _310 * _290;
    float _326 = _324 * 2.0;
    float _328 = _322 * _316;
    float _330 = _326 * _274;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _102 * _320;
    float _336 = exp2(_334);
    float _338 = _110 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _340 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _342 = _338 * _328;
    float _344 = _322 * _336;
    float _346 = _114 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _348 = _332 * _344;
    float _350 = _112 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _352 = _112 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _354 = _104 * _348;
    float _356 = _114 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _358 = _350 * _328;
    float _360 = _340 * _354;
    float _362 = _356 * _328;
    float _364 = _352 * _354;
    float _366 = _346 * _354;
    out.m_42.x = _342;
    out.m_42.y = _358;
    out.m_42.z = _362;
    out.m_44.x = _360;
    out.m_44.y = _364;
    out.m_44.z = _366;
    return out;
}

