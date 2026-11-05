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
    float2 _323 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_323, float2(0.0), isnan(_323))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_323, float2(0.0), isnan(_323))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _62 = -_54;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _56;
    float _70 = _66 * _58;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _78 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _82 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _84 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _88 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _78);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _92 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _82);
    float _94 = 1.0 / _86;
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _88);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _100 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _92);
    float _102 = _96 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _104 = _100 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _106 = _98 * _94;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _68 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _112 = _102 * _94;
    float _114 = _104 * _94;
    float _116 = _108 * _60;
    float _118 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _120 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _110);
    float _122 = fma(_116, 1.5, _112);
    float _124 = _108 * _118;
    float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _120);
    float _128 = fma(_116, 0.5, _112);
    float _130 = fma(_116, -0.5, _112);
    float _132 = fma(_124, 1.5, _114);
    float _134 = fma(_116, -1.5, _112);
    float _136 = fma(_124, 0.5, _114);
    float3 _502 = float3(_122, _132, float(0));
    float3 _506 = select(_502, float3(0.0), isnan(_502));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _506.xy, uint(rint(_506.z)), _108);
    float3 _513 = float3(_128, _132, float(0));
    float3 _515 = select(_513, float3(0.0), isnan(_513));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _515.xy, uint(rint(_515.z)), _108);
    float3 _522 = float3(_130, _132, float(0));
    float3 _524 = select(_522, float3(0.0), isnan(_522));
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _524.xy, uint(rint(_524.z)), _108);
    float3 _531 = float3(_134, _132, float(0));
    float3 _533 = select(_531, float3(0.0), isnan(_531));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _533.xy, uint(rint(_533.z)), _108);
    float3 _540 = float3(_122, _136, float(0));
    float3 _542 = select(_540, float3(0.0), isnan(_540));
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _542.xy, uint(rint(_542.z)), _108);
    float3 _549 = float3(_128, _136, float(0));
    float3 _551 = select(_549, float3(0.0), isnan(_549));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _551.xy, uint(rint(_551.z)), _108);
    float3 _558 = float3(_130, _136, float(0));
    float3 _560 = select(_558, float3(0.0), isnan(_558));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _560.xy, uint(rint(_560.z)), _108);
    float _152 = _126 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _154 = fma(_124, -0.5, _114);
    float _156 = fma(_124, -1.5, _114);
    float _158 = _68 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _160 = 1.0 / _152;
    float _162 = _68 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _164 = _138 + _140;
    float _166 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _158);
    float _168 = _164 + _142;
    float _170 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _162);
    float _172 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _166);
    float _174 = _168 + _144;
    float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _170);
    float _178 = _172 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _180 = _174 + _146;
    float _182 = _176 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _629 = float3(_134, _136, float(0));
    float3 _631 = select(_629, float3(0.0), isnan(_629));
    float _184 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _631.xy, uint(rint(_631.z)), _108);
    float2 _637 = float2(_50, _52);
    float2 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_637, float2(0.0), isnan(_637))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_637, float2(0.0), isnan(_637))).xy;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _178 * _160;
    float _196 = _180 + _148;
    float _198 = _182 * _160;
    float3 _659 = float3(_122, _154, float(0));
    float3 _661 = select(_659, float3(0.0), isnan(_659));
    float _200 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _661.xy, uint(rint(_661.z)), _108);
    float3 _668 = float3(_128, _154, float(0));
    float3 _670 = select(_668, float3(0.0), isnan(_668));
    float _202 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _670.xy, uint(rint(_670.z)), _108);
    float3 _677 = float3(_130, _154, float(0));
    float3 _679 = select(_677, float3(0.0), isnan(_677));
    float _204 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _679.xy, uint(rint(_679.z)), _108);
    float2 _685 = float2(_194, _198);
    float2 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_685, float2(0.0), isnan(_685))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_685, float2(0.0), isnan(_685))).xy;
    float _208 = _206.x;
    float _210 = _206.y;
    float _212 = _196 + _150;
    float _214 = _212 + _184;
    float _216 = fma(_192, 2.0, -1.0);
    float _218 = fma(_190, 2.0, -1.0);
    float _220 = _216 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _715 = float3(_134, _154, float(0));
    float3 _717 = select(_715, float3(0.0), isnan(_715));
    float _222 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _717.xy, uint(rint(_717.z)), _108);
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _226 = fma(_220, 2.0, _52);
    float _228 = fma(_224, 2.0, _50);
    float3 _734 = float3(_122, _156, float(0));
    float3 _736 = select(_734, float3(0.0), isnan(_734));
    float _230 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _736.xy, uint(rint(_736.z)), _108);
    float3 _743 = float3(_128, _156, float(0));
    float3 _745 = select(_743, float3(0.0), isnan(_743));
    float _232 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _745.xy, uint(rint(_745.z)), _108);
    float3 _752 = float3(_130, _156, float(0));
    float3 _754 = select(_752, float3(0.0), isnan(_752));
    float _234 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _754.xy, uint(rint(_754.z)), _108);
    float3 _761 = float3(_134, _156, float(0));
    float3 _763 = select(_761, float3(0.0), isnan(_761));
    float _236 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _763.xy, uint(rint(_763.z)), _108);
    float2 _769 = float2(_228, _226);
    float _238 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_769, float2(0.0), isnan(_769))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_769, float2(0.0), isnan(_769))).x;
    float _240 = _68 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _242 = -_208;
    float _244 = fma(_242, _208, _210);
    float _246 = _214 + _200;
    float _248 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _240);
    float _250 = _246 + _202;
    float _252 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _248);
    float _254 = _250 + _204;
    float _256 = _252 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _258 = precise::min(_256, 1.0);
    float _260 = -_208;
    float _262 = _258 + _260;
    float _264 = fma(_262, _262, _244);
    bool _268 = _262 <= 0.001000000047497451305389404296875;
    float _270 = float(_268);
    float _272 = 1.0 / _264;
    float _274 = -_66;
    float _276 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _278 = _274 + _276;
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _244 * _272;
    float _286 = precise::max(_284, _270);
    float _288 = precise::min(_286, 1.0);
    float _290 = _254 + _222;
    float _292 = _290 + _230;
    float _294 = _292 + _232;
    float _296 = _294 + _234;
    float _298 = -_66;
    float _300 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _302 = _298 + _300;
    float _304 = _296 + _236;
    float _306 = _302 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = fma(_304, 0.0625, _282);
    float _312 = _308 + _288;
    out.m_43.x = _238;
    out.m_43.y = _310;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _312;
    return out;
}

