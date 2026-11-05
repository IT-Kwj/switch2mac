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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _327 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_327, float2(0.0), isnan(_327))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_327, float2(0.0), isnan(_327))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _62 = -_54;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _56;
    float _74 = _70 * _58;
    float _76 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _82 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _86 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _88 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _90 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _92 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _94 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _86);
    float _96 = 1.0 / _88;
    float _98 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _90);
    float _100 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _92);
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _104 = _98 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _106 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _100);
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _110 = _104 * _96;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = _72 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _116 = _102 * _96;
    float _118 = _108 * _96;
    float _120 = _112 * _60;
    float _122 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _124 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[15].x, _114);
    float _126 = fma(_120, 1.5, _116);
    float _128 = _112 * _122;
    float _130 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].z, _124);
    float _132 = fma(_120, 0.5, _116);
    float _134 = fma(_120, -0.5, _116);
    float _136 = fma(_128, 1.5, _118);
    float _138 = fma(_120, -1.5, _116);
    float _140 = fma(_128, 0.5, _118);
    float3 _510 = float3(_126, _136, float(0));
    float3 _514 = select(_510, float3(0.0), isnan(_510));
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _514.xy, uint(rint(_514.z)), _112);
    float3 _521 = float3(_132, _136, float(0));
    float3 _523 = select(_521, float3(0.0), isnan(_521));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _523.xy, uint(rint(_523.z)), _112);
    float3 _530 = float3(_134, _136, float(0));
    float3 _532 = select(_530, float3(0.0), isnan(_530));
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _532.xy, uint(rint(_532.z)), _112);
    float3 _539 = float3(_138, _136, float(0));
    float3 _541 = select(_539, float3(0.0), isnan(_539));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _541.xy, uint(rint(_541.z)), _112);
    float3 _548 = float3(_126, _140, float(0));
    float3 _550 = select(_548, float3(0.0), isnan(_548));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _550.xy, uint(rint(_550.z)), _112);
    float3 _557 = float3(_132, _140, float(0));
    float3 _559 = select(_557, float3(0.0), isnan(_557));
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _559.xy, uint(rint(_559.z)), _112);
    float3 _566 = float3(_134, _140, float(0));
    float3 _568 = select(_566, float3(0.0), isnan(_566));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _568.xy, uint(rint(_568.z)), _112);
    float _156 = _130 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _158 = fma(_128, -0.5, _118);
    float _160 = fma(_128, -1.5, _118);
    float _162 = _72 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _164 = 1.0 / _156;
    float _166 = _72 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _168 = _142 + _144;
    float _170 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[12].x, _162);
    float _172 = _168 + _146;
    float _174 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[13].x, _166);
    float _176 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].z, _170);
    float _178 = _172 + _148;
    float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].z, _174);
    float _182 = _176 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _184 = _178 + _150;
    float _186 = _180 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _637 = float3(_138, _140, float(0));
    float3 _639 = select(_637, float3(0.0), isnan(_637));
    float _188 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _639.xy, uint(rint(_639.z)), _112);
    float2 _645 = float2(_50, _52);
    float2 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_645, float2(0.0), isnan(_645))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_645, float2(0.0), isnan(_645))).xy;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _182 * _164;
    float _200 = _184 + _152;
    float _202 = _186 * _164;
    float3 _667 = float3(_126, _158, float(0));
    float3 _669 = select(_667, float3(0.0), isnan(_667));
    float _204 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _669.xy, uint(rint(_669.z)), _112);
    float3 _676 = float3(_132, _158, float(0));
    float3 _678 = select(_676, float3(0.0), isnan(_676));
    float _206 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _678.xy, uint(rint(_678.z)), _112);
    float3 _685 = float3(_134, _158, float(0));
    float3 _687 = select(_685, float3(0.0), isnan(_685));
    float _208 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _687.xy, uint(rint(_687.z)), _112);
    float2 _693 = float2(_198, _202);
    float2 _210 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_693, float2(0.0), isnan(_693))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_693, float2(0.0), isnan(_693))).xy;
    float _212 = _210.x;
    float _214 = _210.y;
    float _216 = _200 + _154;
    float _218 = _216 + _188;
    float _220 = fma(_196, 2.0, -1.0);
    float _222 = fma(_194, 2.0, -1.0);
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _723 = float3(_138, _158, float(0));
    float3 _725 = select(_723, float3(0.0), isnan(_723));
    float _226 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _725.xy, uint(rint(_725.z)), _112);
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _230 = fma(_224, 2.0, _52);
    float _232 = fma(_228, 2.0, _50);
    float3 _742 = float3(_126, _160, float(0));
    float3 _744 = select(_742, float3(0.0), isnan(_742));
    float _234 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _744.xy, uint(rint(_744.z)), _112);
    float3 _751 = float3(_132, _160, float(0));
    float3 _753 = select(_751, float3(0.0), isnan(_751));
    float _236 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _753.xy, uint(rint(_753.z)), _112);
    float3 _760 = float3(_134, _160, float(0));
    float3 _762 = select(_760, float3(0.0), isnan(_760));
    float _238 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _762.xy, uint(rint(_762.z)), _112);
    float3 _769 = float3(_138, _160, float(0));
    float3 _771 = select(_769, float3(0.0), isnan(_769));
    float _240 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _771.xy, uint(rint(_771.z)), _112);
    float2 _777 = float2(_232, _230);
    float _242 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_777, float2(0.0), isnan(_777))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_777, float2(0.0), isnan(_777))).x;
    float _244 = _72 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _246 = -_212;
    float _248 = fma(_246, _212, _214);
    float _250 = _218 + _204;
    float _252 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[14].x, _244);
    float _254 = _250 + _206;
    float _256 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].z, _252);
    float _258 = _254 + _208;
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _262 = precise::min(_260, 1.0);
    float _264 = -_212;
    float _266 = _262 + _264;
    float _268 = fma(_266, _266, _248);
    bool _272 = _266 <= 0.001000000047497451305389404296875;
    float _274 = float(_272);
    float _276 = 1.0 / _268;
    float _278 = -_70;
    float _280 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _282 = _278 + _280;
    float _284 = _282 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = _248 * _276;
    float _290 = precise::max(_288, _274);
    float _292 = precise::min(_290, 1.0);
    float _294 = _258 + _226;
    float _296 = _294 + _234;
    float _298 = _296 + _236;
    float _300 = _298 + _238;
    float _302 = -_70;
    float _304 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _306 = _302 + _304;
    float _308 = _300 + _240;
    float _310 = _306 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = fma(_308, 0.0625, _286);
    float _316 = _312 + _292;
    out.m_43.x = _242;
    out.m_43.y = _314;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _316;
    return out;
}

