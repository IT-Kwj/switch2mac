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
    float2 _293 = float2(_45, _47);
    float4 _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_293, float2(0.0), isnan(_293))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_293, float2(0.0), isnan(_293))).xyzw;
    float _52 = _50.x;
    float _54 = _50.y;
    float _56 = _50.z;
    float _58 = _50.w;
    float2 _313 = float2(_45, _47);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_313, float2(0.0), isnan(_313))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_313, float2(0.0), isnan(_313))).x;
    float2 _320 = float2(_58, 0.0);
    float2 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_320, float2(0.0), isnan(_320))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_320, float2(0.0), isnan(_320))).xy;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = in.m_35.y;
    float _72 = in.m_35.x;
    float _74 = in.m_35.z;
    float _76 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _78 = _70 * _70;
    float _80 = -_76;
    float _82 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _84 = fma(_80, _70, _82);
    float _86 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _88 = _70 + _86;
    float _90 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _92 = _72 + _90;
    float _94 = fma(_72, _72, _78);
    float _96 = _84 * _84;
    float _98 = _88 * _88;
    float _100 = _94 + 1.0;
    float _102 = -_76;
    float _104 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _106 = fma(_102, _72, _104);
    float _108 = -_76;
    float _110 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _112 = fma(_108, _74, _110);
    float _114 = fma(_92, _92, _98);
    float _116 = fma(_106, _106, _96);
    float _118 = rsqrt(_100);
    float _120 = fma(_112, _112, _116);
    float _122 = rsqrt(_120);
    float _124 = _70 * _118;
    float _126 = _72 * _118;
    float _128 = _74 * _118;
    float _130 = sqrt(_120);
    float _132 = -_124;
    float _134 = fma(_84, _122, _132);
    float _136 = _112 * _122;
    float _138 = -_126;
    float _140 = fma(_106, _122, _138);
    float _142 = _134 * _134;
    float _144 = -_128;
    float _146 = _136 + _144;
    float _148 = 0.0 + _136;
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = fma(_140, _140, _142);
    float _154 = fma(_54, 2.0, -1.0);
    float _156 = fma(_52, 2.0, -1.0);
    float _158 = fma(_56, 2.0, -1.0);
    float _160 = fma(_146, _146, _152);
    float _162 = _154 * _134;
    float _164 = -_130;
    float _166 = fma(_164, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _168 = precise::clamp(_166, 0.0, 1.0);
    float _170 = -_156;
    float _172 = -_162;
    float _174 = fma(_170, _140, _172);
    float _176 = rsqrt(_160);
    float _178 = -_158;
    float _180 = fma(_178, _146, _174);
    float _182 = -_134;
    float _184 = _124 * _182;
    float _186 = -_124;
    float _188 = _154 * _186;
    float _190 = abs(_168);
    float _192 = log2(_190);
    float _194 = -_126;
    float _196 = fma(_194, _140, _184);
    float _198 = _154 * _84;
    float _200 = -_128;
    float _202 = fma(_200, _146, _196);
    float _204 = fma(_156, _106, _198);
    float _206 = -_188;
    float _208 = fma(_156, _126, _206);
    float _210 = _176 * _180;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = 1.0 / _202;
    float _216 = fma(_158, _112, _204);
    float _218 = fma(_158, _128, _208);
    float _220 = -_168;
    float _222 = _220 + 1.0;
    float _224 = -_114;
    float _226 = fma(_224, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = -_216;
    float _232 = _122 * _230;
    float _234 = _192 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _236 = abs(_212);
    float _238 = log2(_236);
    float _240 = fma(_222, _150, _168);
    float _242 = precise::min(_232, _218);
    float _244 = _228 * _240;
    float _246 = 0.0 + _232;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _212 * _242;
    float _252 = _250 * 2.0;
    float _254 = exp2(_234);
    float _256 = _252 * _214;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _258 * _244;
    float _262 = _66 * _238;
    float _264 = _68 * _260;
    float _266 = _254 * _248;
    float _268 = exp2(_262);
    float _270 = _266 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _272 = _270 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _274 = _268 * _264;
    float _276 = _270 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _278 = _270 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _280 = _274 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _282 = _280 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    out.m_38.x = _272;
    out.m_38.y = _276;
    out.m_38.z = _278;
    out.m_38.w = _282;
    return out;
}

