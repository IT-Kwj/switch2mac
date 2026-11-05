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
    float4 m_40 [[color(0)]];
    float4 m_42 [[color(1)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0), center_no_perspective]];
    float4 m_35 [[user(locn1), center_no_perspective]];
    float4 m_33 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _49 = in.m_33.x;
    float _51 = in.m_33.y;
    float2 _329 = float2(_49, _51);
    float4 _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_329, float2(0.0), isnan(_329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_329, float2(0.0), isnan(_329))).xyzw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float _62 = _54.w;
    float2 _348 = float2(_49, _51);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_348, float2(0.0), isnan(_348))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_348, float2(0.0), isnan(_348))).x;
    float2 _355 = float2(_62, 0.0);
    float2 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_355, float2(0.0), isnan(_355))).xy;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = in.m_35.y;
    float _76 = in.m_35.x;
    float _78 = in.m_35.z;
    float _80 = in.m_37.z;
    float _82 = _74 * _74;
    float _84 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _86 = fma(_58, 2.0, -1.0);
    float _88 = in.m_37.x;
    float _90 = fma(_76, _76, _82);
    float _92 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _94 = -_84;
    float _96 = fma(_94, _80, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _98 = fma(_56, 2.0, -1.0);
    float _100 = _90 + 1.0;
    float _102 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _92);
    float _104 = fma(_60, 2.0, -1.0);
    float _106 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _102);
    float _108 = rsqrt(_100);
    float _110 = rsqrt(_106);
    float _112 = _74 * _108;
    float _114 = _76 * _108;
    float _116 = _108 * _78;
    float _118 = -_84;
    float _120 = fma(_118, _88, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _122 = _110 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _124 = _110 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _126 = _110 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _128 = fma(_96, -0.5, 0.5);
    float _130 = -_112;
    float _132 = _122 + _130;
    float _134 = -_114;
    float _136 = _124 + _134;
    float _138 = -_116;
    float _140 = _126 + _138;
    float _142 = in.m_37.y;
    float _144 = _132 * _132;
    float _146 = -_132;
    float _148 = _112 * _146;
    float _150 = _86 * _132;
    bool _154 = _128 <= 1.0;
    bool _156 = isnan(_128);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = float(_162);
    float _166 = fma(_136, _136, _144);
    float _168 = -_114;
    float _170 = fma(_168, _136, _148);
    float _172 = -_98;
    float _174 = -_150;
    float _176 = fma(_172, _136, _174);
    float _178 = -_112;
    float _180 = _86 * _178;
    float _182 = fma(_140, _140, _166);
    float _184 = _128 * _164;
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = in.m_37.w;
    float _190 = -_104;
    float _192 = fma(_190, _140, _176);
    float _194 = -_180;
    float _196 = fma(_98, _114, _194);
    float _198 = -_116;
    float _200 = fma(_198, _140, _170);
    float _202 = rsqrt(_182);
    float _204 = _98 * _124;
    float _206 = fma(_104, _116, _196);
    float _208 = -_122;
    float _210 = -_204;
    float _212 = fma(_86, _208, _210);
    float _214 = _86 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _216 = abs(_186);
    float _218 = log2(_216);
    float _220 = -_126;
    float _222 = fma(_104, _220, _212);
    float _224 = fma(_98, (*spvDescriptorSet0.fp_c4)._m0[15].x, _214);
    float _226 = precise::min(_206, _222);
    float _228 = fma(_104, (*spvDescriptorSet0.fp_c4)._m0[15].z, _224);
    float _230 = _202 * _192;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = -_84;
    float _236 = fma(_234, _142, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _238 = 1.0 / _200;
    float _240 = _232 * _226;
    float _242 = _240 * 2.0;
    float _244 = precise::min(_120, _236);
    float _246 = _218 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _248 = precise::max(_120, _236);
    float _250 = abs(_232);
    float _252 = log2(_250);
    bool _254 = _244 >= 0.0;
    bool _256 = isnan(_244);
    bool _258 = _254 || _256;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    float _264 = -_84;
    float _266 = fma(_264, _188, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    bool _268 = _266 >= _248;
    bool _270 = isnan(_266);
    bool _272 = _268 || _270;
    bool _274 = isnan(_248);
    bool _276 = _272 || _274;
    bool _278 = _276 && _262;
    float _280 = float(_278);
    float _282 = exp2(_246);
    float _284 = _242 * _238;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = _280 * _282;
    float _290 = _70 * _252;
    float _292 = exp2(_290);
    float _294 = _288 * _292;
    float _296 = -_110;
    float _298 = fma(_296, _228, 0.0);
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = _286 * _294;
    float _304 = _288 * _300;
    float _306 = _72 * _302;
    float _308 = _304 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _310 = _304 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _312 = _304 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _314 = _306 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _316 = _306 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _318 = _306 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    out.m_40.x = _308;
    out.m_40.y = _310;
    out.m_40.z = _312;
    out.m_42.x = _314;
    out.m_42.y = _316;
    out.m_42.z = _318;
    return out;
}

