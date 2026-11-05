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
    float2 _331 = float2(_45, _47);
    float4 _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_331, float2(0.0), isnan(_331))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_331, float2(0.0), isnan(_331))).xyzw;
    float _52 = _50.x;
    float _54 = _50.y;
    float _56 = _50.z;
    float _58 = _50.w;
    float2 _351 = float2(_45, _47);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_351, float2(0.0), isnan(_351))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_351, float2(0.0), isnan(_351))).x;
    float2 _358 = float2(_58, 0.0);
    float2 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_358, float2(0.0), isnan(_358))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_358, float2(0.0), isnan(_358))).xy;
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
    float _130 = _122 * (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = -_124;
    float _136 = fma(_84, _122, _134);
    float _138 = -_126;
    float _140 = fma(_106, _122, _138);
    float _142 = -_132;
    float _144 = fma(_142, _132, 1.0);
    float _146 = _112 * _122;
    float _148 = _136 * _136;
    float _150 = -_128;
    float _152 = _146 + _150;
    float _154 = sqrt(_144);
    float _156 = fma(_140, _140, _148);
    float _158 = 0.0 + _146;
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = fma(_152, _152, _156);
    float _164 = fma(_54, 2.0, -1.0);
    float _166 = fma(_56, 2.0, -1.0);
    float _168 = rsqrt(_162);
    float _170 = 0.0 + _154;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = fma(_172, 0.5, 0.5);
    float _176 = fma(_52, 2.0, -1.0);
    float _178 = _164 * _136;
    float _180 = sqrt(_174);
    float _182 = -_176;
    float _184 = -_178;
    float _186 = fma(_182, _140, _184);
    float _188 = -_166;
    float _190 = fma(_188, _152, _186);
    float _192 = sqrt(_120);
    float _194 = -_136;
    float _196 = _124 * _194;
    float _198 = _168 * _190;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = -_124;
    float _204 = _164 * _202;
    float _206 = -_200;
    float _208 = fma(_206, _200, 1.0);
    float _210 = precise::max(_200, _180);
    float _212 = -_126;
    float _214 = fma(_212, _140, _196);
    float _216 = _164 * _84;
    float _218 = -_204;
    float _220 = fma(_176, _126, _218);
    float _222 = sqrt(_208);
    float _224 = -_210;
    float _226 = fma(_224, _210, 1.0);
    float _228 = fma(_176, _106, _216);
    float _230 = -_128;
    float _232 = fma(_230, _152, _214);
    float _234 = -_192;
    float _236 = fma(_234, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = fma(_166, _128, _220);
    float _242 = fma(_166, _112, _228);
    float _244 = sqrt(_226);
    float _246 = -_238;
    float _248 = _246 + 1.0;
    float _250 = -_242;
    float _252 = _122 * _250;
    float _254 = -_114;
    float _256 = fma(_254, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = fma(_248, _160, _238);
    float _262 = precise::min(_252, _240);
    float _264 = abs(_238);
    float _266 = log2(_264);
    float _268 = _258 * _260;
    float _270 = 0.0 + _252;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _200 * _262;
    float _276 = _274 * 2.0;
    float _278 = _222 * _244;
    float _280 = 1.0 / _232;
    float _282 = fma(_200, _210, _278);
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = _266 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _288 = abs(_284);
    float _290 = log2(_288);
    float _292 = _276 * _280;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = exp2(_286);
    float _298 = _294 * _268;
    float _300 = _66 * _290;
    float _302 = _68 * _298;
    float _304 = _296 * _272;
    float _306 = exp2(_300);
    float _308 = _304 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _310 = _308 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _312 = _306 * _302;
    float _314 = _308 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _316 = _308 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _318 = _312 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _320 = _318 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    out.m_38.x = _310;
    out.m_38.y = _314;
    out.m_38.z = _316;
    out.m_38.w = _320;
    return out;
}

