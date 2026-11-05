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
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0), center_no_perspective]];
    float4 m_33 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _47 = in.m_33.x;
    float _49 = in.m_33.y;
    float2 _333 = float2(_47, _49);
    float4 _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_333, float2(0.0), isnan(_333))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_333, float2(0.0), isnan(_333))).xyzw;
    float _54 = _52.x;
    float _56 = _52.y;
    float _58 = _52.z;
    float _60 = _52.w;
    float2 _353 = float2(_47, _49);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_353, float2(0.0), isnan(_353))).x;
    float2 _360 = float2(_60, 0.0);
    float2 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_360, float2(0.0), isnan(_360))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_360, float2(0.0), isnan(_360))).xy;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = in.m_35.y;
    float _74 = in.m_35.x;
    float _76 = in.m_35.z;
    float _78 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _80 = _72 * _72;
    float _82 = -_78;
    float _84 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _86 = fma(_82, _72, _84);
    float _88 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _90 = _72 + _88;
    float _92 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _94 = _74 + _92;
    float _96 = fma(_74, _74, _80);
    float _98 = _86 * _86;
    float _100 = _90 * _90;
    float _102 = _96 + 1.0;
    float _104 = -_78;
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _108 = fma(_104, _74, _106);
    float _110 = -_78;
    float _112 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _114 = fma(_110, _76, _112);
    float _116 = fma(_94, _94, _100);
    float _118 = fma(_108, _108, _98);
    float _120 = rsqrt(_102);
    float _122 = fma(_114, _114, _118);
    float _124 = rsqrt(_122);
    float _126 = _72 * _120;
    float _128 = _74 * _120;
    float _130 = _76 * _120;
    float _132 = _124 * (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float _136 = -_126;
    float _138 = fma(_86, _124, _136);
    float _140 = -_128;
    float _142 = fma(_108, _124, _140);
    float _144 = -_134;
    float _146 = fma(_144, _134, 1.0);
    float _148 = _114 * _124;
    float _150 = _138 * _138;
    float _152 = -_130;
    float _154 = _148 + _152;
    float _156 = sqrt(_146);
    float _158 = fma(_142, _142, _150);
    float _160 = 0.0 + _148;
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = fma(_154, _154, _158);
    float _166 = fma(_56, 2.0, -1.0);
    float _168 = fma(_58, 2.0, -1.0);
    float _170 = rsqrt(_164);
    float _172 = 0.0 + _156;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = fma(_174, 0.5, 0.5);
    float _178 = fma(_54, 2.0, -1.0);
    float _180 = _166 * _138;
    float _182 = sqrt(_176);
    float _184 = -_178;
    float _186 = -_180;
    float _188 = fma(_184, _142, _186);
    float _190 = -_168;
    float _192 = fma(_190, _154, _188);
    float _194 = sqrt(_122);
    float _196 = -_138;
    float _198 = _126 * _196;
    float _200 = _170 * _192;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = -_126;
    float _206 = _166 * _204;
    float _208 = -_202;
    float _210 = fma(_208, _202, 1.0);
    float _212 = precise::max(_202, _182);
    float _214 = -_128;
    float _216 = fma(_214, _142, _198);
    float _218 = _166 * _86;
    float _220 = -_206;
    float _222 = fma(_178, _128, _220);
    float _224 = sqrt(_210);
    float _226 = -_212;
    float _228 = fma(_226, _212, 1.0);
    float _230 = fma(_178, _108, _218);
    float _232 = -_130;
    float _234 = fma(_232, _154, _216);
    float _236 = -_194;
    float _238 = fma(_236, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = fma(_168, _130, _222);
    float _244 = fma(_168, _114, _230);
    float _246 = sqrt(_228);
    float _248 = -_240;
    float _250 = _248 + 1.0;
    float _252 = -_244;
    float _254 = _124 * _252;
    float _256 = -_116;
    float _258 = fma(_256, (*spvDescriptorSet0.fp_c4)._m0[4].z, 1.0);
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = fma(_250, _162, _240);
    float _264 = precise::min(_254, _242);
    float _266 = abs(_240);
    float _268 = log2(_266);
    float _270 = _260 * _262;
    float _272 = 0.0 + _254;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _202 * _264;
    float _278 = _276 * 2.0;
    float _280 = _224 * _246;
    float _282 = 1.0 / _234;
    float _284 = fma(_202, _212, _280);
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = _268 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _290 = abs(_286);
    float _292 = log2(_290);
    float _294 = _278 * _282;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = exp2(_288);
    float _300 = _296 * _270;
    float _302 = _298 * _274;
    float _304 = _68 * _292;
    float _306 = _70 * _300;
    float _308 = _302 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _310 = _302 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _312 = _302 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _314 = exp2(_304);
    float _316 = _314 * _306;
    float _318 = _316 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _320 = _316 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _322 = _316 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    out.m_38.x = _308;
    out.m_38.y = _310;
    out.m_38.z = _312;
    out.m_40.x = _318;
    out.m_40.y = _320;
    out.m_40.z = _322;
    return out;
}

