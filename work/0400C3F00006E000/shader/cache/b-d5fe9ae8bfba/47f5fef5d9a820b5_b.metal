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
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0), center_no_perspective]];
    float4 m_33 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _45 = in.m_33.x;
    float _47 = in.m_33.y;
    float2 _323 = float2(_45, _47);
    float4 _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_323, float2(0.0), isnan(_323))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_323, float2(0.0), isnan(_323))).xyzw;
    float _52 = _50.x;
    float _54 = _50.y;
    float _56 = _50.z;
    float _58 = _50.w;
    float2 _343 = float2(_45, _47);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_343, float2(0.0), isnan(_343))).x;
    float2 _350 = float2(_58, 0.0);
    float2 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_350, float2(0.0), isnan(_350))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_350, float2(0.0), isnan(_350))).xy;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = in.m_35.y;
    float _72 = in.m_35.x;
    float _74 = in.m_35.z;
    float _76 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _78 = fma(_56, 2.0, -1.0);
    float _80 = -_76;
    float _82 = -(*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _84 = fma(_80, _70, _82);
    float _86 = _70 * _70;
    float _88 = -_76;
    float _90 = -(*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _92 = fma(_88, _72, _90);
    float _94 = -_76;
    float _96 = -(*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _98 = fma(_94, _74, _96);
    float _100 = _84 * _84;
    float _102 = fma(_72, _72, _86);
    float _104 = -(*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _106 = _70 + _104;
    float _108 = -(*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _110 = _72 + _108;
    float _112 = fma(_92, _92, _100);
    float _114 = _102 + 1.0;
    float _116 = _106 * _106;
    float _118 = _84 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _120 = fma(_98, _98, _112);
    float _122 = rsqrt(_114);
    float _124 = fma(_110, _110, _116);
    float _126 = fma(_92, (*spvDescriptorSet0.fp_c4)._m0[11].x, _118);
    float _128 = fma(_98, (*spvDescriptorSet0.fp_c4)._m0[11].z, _126);
    float _130 = rsqrt(_120);
    float _132 = _70 * _122;
    float _134 = _72 * _122;
    float _136 = _74 * _122;
    float _138 = sqrt(_120);
    float _140 = _84 * _130;
    float _142 = _92 * _130;
    float _144 = _98 * _130;
    float _146 = _130 * _128;
    float _148 = -_132;
    float _150 = _148 + _140;
    float _152 = -_134;
    float _154 = _152 + _142;
    float _156 = -_136;
    float _158 = _156 + _144;
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _162 = fma(_146, (*spvDescriptorSet0.fp_c4)._m0[13].y, _160);
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = _150 * _150;
    float _168 = fma(_54, 2.0, -1.0);
    float _170 = fma(_52, 2.0, -1.0);
    float _172 = -_138;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c4)._m0[8].w, 1.0);
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = fma(_154, _154, _166);
    float _180 = _168 * _150;
    float _182 = abs(_164);
    float _184 = log2(_182);
    float _186 = _168 * _84;
    float _188 = fma(_158, _158, _178);
    float _190 = -_170;
    float _192 = -_180;
    float _194 = fma(_190, _154, _192);
    float _196 = fma(_170, _92, _186);
    float _198 = -_78;
    float _200 = fma(_198, _158, _194);
    float _202 = rsqrt(_188);
    float _204 = fma(_78, _98, _196);
    float _206 = abs(_176);
    float _208 = log2(_206);
    float _210 = _202 * _200;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = -_150;
    float _216 = _132 * _214;
    float _218 = _184 * (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _220 = -_132;
    float _222 = _168 * _220;
    float _224 = abs(_212);
    float _226 = log2(_224);
    float _228 = -_134;
    float _230 = fma(_228, _154, _216);
    float _232 = _168 * _140;
    float _234 = -_222;
    float _236 = fma(_170, _134, _234);
    float _238 = _208 * (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _240 = -_136;
    float _242 = fma(_240, _158, _230);
    float _244 = -_142;
    float _246 = -_232;
    float _248 = fma(_170, _244, _246);
    float _250 = fma(_78, _136, _236);
    float _252 = exp2(_218);
    float _254 = -_144;
    float _256 = fma(_78, _254, _248);
    float _258 = precise::min(_250, _256);
    float _260 = 1.0 / _242;
    float _262 = _212 * _258;
    float _264 = _262 * 2.0;
    float _266 = exp2(_238);
    float _268 = _264 * _260;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _266 * _252;
    float _274 = _272 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _276 = _66 * _226;
    float _278 = exp2(_276);
    float _280 = -_124;
    float _282 = fma(_280, (*spvDescriptorSet0.fp_c4)._m0[12].z, 1.0);
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = _252 * _284;
    float _288 = _278 * _286;
    float _290 = _270 * _288;
    float _292 = -_130;
    float _294 = fma(_292, _204, 0.0);
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = _68 * _290;
    float _300 = _296 * _274;
    float _302 = _176 * _298;
    float _304 = _300 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _306 = _300 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _308 = _300 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _310 = _302 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _312 = _310 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    out.m_38.x = _304;
    out.m_38.y = _306;
    out.m_38.z = _308;
    out.m_38.w = _312;
    return out;
}

