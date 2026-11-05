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
    float2 _333 = float2(_49, _51);
    float _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_333, float2(0.0), isnan(_333))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_333, float2(0.0), isnan(_333))).x;
    float2 _344 = float2(_49, _51);
    float4 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_344, float2(0.0), isnan(_344))).xyzw;
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
    float _88 = _80 * _86;
    float _90 = _84 * _86;
    float2 _408 = float2(_64, 0.0);
    float2 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_408, float2(0.0), isnan(_408))).xy;
    float _96 = _94.x;
    float _98 = _94.y;
    float2 _420 = float2(_88, _90);
    float3 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_420, float2(0.0), isnan(_420))).xyz;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = in.m_39.y;
    float _112 = in.m_39.x;
    float _114 = in.m_39.z;
    float _116 = in.m_37.z;
    float _118 = fma(_60, 2.0, -1.0);
    float _120 = fma(_62, 2.0, -1.0);
    float _122 = _110 * _110;
    float _124 = fma(_112, _112, _122);
    float _126 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _128 = -_72;
    float _130 = fma(_128, _116, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _132 = _124 + 1.0;
    float _134 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _126);
    float _136 = fma(_130, -0.5, 0.5);
    float _138 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _134);
    float _140 = rsqrt(_132);
    float _142 = rsqrt(_138);
    float _144 = _110 * _140;
    float _146 = _140 * _114;
    float _148 = _112 * _140;
    float _150 = _142 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _152 = _142 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _154 = _142 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _156 = -_144;
    float _158 = _150 + _156;
    float _160 = -_148;
    float _162 = _152 + _160;
    float _164 = -_146;
    float _166 = _154 + _164;
    float _168 = _158 * _158;
    float _170 = _118 * _158;
    float _172 = -_158;
    float _174 = _144 * _172;
    float _176 = fma(_162, _162, _168);
    bool _180 = _136 <= 1.0;
    bool _182 = isnan(_136);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = float(_188);
    float _192 = -_148;
    float _194 = fma(_192, _162, _174);
    float _196 = fma(_166, _166, _176);
    float _198 = _136 * _190;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = fma(_58, 2.0, -1.0);
    float _204 = -_146;
    float _206 = fma(_204, _166, _194);
    float _208 = rsqrt(_196);
    float _210 = -_202;
    float _212 = -_170;
    float _214 = fma(_210, _162, _212);
    float _216 = -_144;
    float _218 = _118 * _216;
    float _220 = _202 * _152;
    float _222 = -_120;
    float _224 = fma(_222, _166, _214);
    float _226 = -_218;
    float _228 = fma(_202, _148, _226);
    float _230 = -_150;
    float _232 = -_220;
    float _234 = fma(_118, _230, _232);
    float _236 = abs(_200);
    float _238 = log2(_236);
    float _240 = _118 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _242 = fma(_120, _146, _228);
    float _244 = -_154;
    float _246 = fma(_120, _244, _234);
    float _248 = fma(_202, (*spvDescriptorSet0.fp_c4)._m0[15].x, _240);
    float _250 = _208 * _224;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = fma(_120, (*spvDescriptorSet0.fp_c4)._m0[15].z, _248);
    float _256 = 1.0 / _206;
    float _258 = precise::min(_242, _246);
    float _260 = -_142;
    float _262 = fma(_260, _254, 0.0);
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _238 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _268 = _252 * _258;
    float _270 = _268 * 2.0;
    float _272 = abs(_252);
    float _274 = log2(_272);
    float _276 = exp2(_266);
    float _278 = _270 * _256;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _276 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _284 = _282 * _264;
    float _286 = _96 * _274;
    float _288 = exp2(_286);
    float _290 = _106 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _292 = _104 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _294 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _296 = _290 * 0.586610972881317138671875;
    float _298 = fma(_292, 0.298911988735198974609375, _296);
    float _300 = _104 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _302 = fma(_294, 0.114477999508380889892578125, _298);
    float _304 = _106 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _306 = _300 * _284;
    float _308 = _282 * _288;
    float _310 = _304 * _284;
    float _312 = _280 * _308;
    float _314 = _98 * _312;
    float _316 = _108 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _318 = _314 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _320 = _316 * _284;
    float _322 = _302 * _318;
    out.m_42.x = _306;
    out.m_42.y = _310;
    out.m_42.z = _320;
    out.m_42.w = _322;
    return out;
}

