#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _386 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_386, float2(0.0), isnan(_386)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _403 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_403, float2(0.0), isnan(_403))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_403, float2(0.0), isnan(_403))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_98;
    float _104 = fma(_90, _72, _102);
    float _106 = -_98;
    float _108 = fma(_96, _74, _106);
    float _110 = -_100;
    float _112 = fma(_90, _76, _110);
    float _114 = -_100;
    float _116 = fma(_96, _78, _114);
    float _118 = _104 * _104;
    float _120 = _108 * _108;
    float _122 = -_84;
    float _124 = _122 + _90;
    float _126 = -_84;
    float _128 = _126 + _96;
    float _130 = fma(_112, _112, _118);
    float _132 = fma(_116, _116, _120);
    float _134 = fma(_124, _124, _130);
    float _136 = fma(_128, _128, _132);
    float _138 = rsqrt(_134);
    float _140 = rsqrt(_136);
    float _142 = _112 * _138;
    float _144 = _124 * _138;
    float _146 = _104 * _138;
    float _148 = _128 * _140;
    float _150 = _108 * _140;
    float _152 = _116 * _140;
    float _154 = _142 * _148;
    float _156 = _144 * _150;
    float _158 = -_154;
    float _160 = fma(_144, _152, _158);
    float _162 = -_156;
    float _164 = fma(_146, _148, _162);
    float _166 = _146 * _152;
    float _168 = _160 * _160;
    float _170 = -_166;
    float _172 = fma(_142, _150, _170);
    float _174 = fma(_164, _164, _168);
    float _176 = fma(_172, _172, _174);
    float _178 = rsqrt(_176);
    float _180 = _160 * _178;
    float _182 = _164 * _178;
    float _184 = _172 * _178;
    float _186 = _180 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _188 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[35].x, _186);
    float _190 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[35].z, _188);
    float _192 = abs(_190);
    float _194 = -_192;
    float _196 = _194 + 1.0;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = abs(_198);
    float _202 = log2(_200);
    float _204 = -_66;
    float _206 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _208 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[46].z, _206);
    float _210 = _208 * _68;
    float _212 = _208 * _70;
    float _214 = _210 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _216 = _210 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _218 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[15].x, _214);
    float _220 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[12].x, _216);
    float _222 = _202 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _224 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[15].z, _218);
    float _226 = _210 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _228 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[12].z, _220);
    float _230 = _224 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _232 = exp2(_222);
    float _234 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[13].x, _226);
    float _236 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[13].z, _234);
    float _238 = 1.0 / _230;
    float _240 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _242 = fma(_180, _240, _210);
    float _244 = fma(_182, _240, _212);
    float _246 = fma(_184, _240, _208);
    float _248 = _242 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _252 = _242 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _254 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].x, _248);
    float _256 = _242 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _258 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].x, _250);
    float _260 = _228 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _262 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[3].z, _254);
    float _264 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[1].z, _258);
    float _266 = _260 * _238;
    float _268 = _262 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _270 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].x, _256);
    float _272 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].x, _252);
    float _274 = _264 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _276 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, _270);
    float _278 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[2].z, _272);
    float _280 = _236 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _282 = 1.0 / _268;
    float _284 = _276 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _286 = _278 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _288 = _280 * _238;
    float2 _797 = float2(_266, _288);
    float2 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_797, float2(0.0), isnan(_797))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_797, float2(0.0), isnan(_797))).xy;
    float _294 = _292.x;
    float _296 = _292.y;
    float _298 = _286 * _282;
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = _274 * _282;
    float _304 = _284 * _282;
    float _306 = rint(_300);
    float _308 = precise::max(_306, 0.0);
    uint _311 = uint(_308);
    uint _313 = clamp(_311, 0u, 65535u);
    float3 _833 = float3(_304, _302, float(int(_313)));
    float3 _837 = select(_833, float3(0.0), isnan(_833));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _837.xy, uint(rint(_837.z)), 1.0);
    float2 _842 = float2(_52, _54);
    float _317 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_842, float2(0.0), isnan(_842))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_842, float2(0.0), isnan(_842))).x;
    float _319 = _210 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _321 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[14].x, _319);
    float _323 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[14].z, _321);
    float _325 = _323 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _327 = precise::min(_325, 1.0);
    float _329 = -_208;
    float _331 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _333 = _329 + _331;
    float _335 = -_208;
    float _337 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _339 = _335 + _337;
    float _341 = _333 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = _339 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = -_294;
    float _351 = fma(_349, _294, _296);
    float _353 = -_294;
    float _355 = _327 + _353;
    float _357 = fma(_355, _355, _351);
    bool _361 = _355 <= 0.001000000047497451305389404296875;
    float _363 = float(_361);
    float _365 = 1.0 / _357;
    float _367 = _351 * _365;
    float _369 = _343 + _315;
    float _371 = precise::max(_367, _363);
    float _373 = precise::min(_371, 1.0);
    float _375 = _347 + _373;
    out.m_45.x = _317;
    out.m_45.y = _369;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _375;
    return out;
}

