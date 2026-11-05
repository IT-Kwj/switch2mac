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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
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
    float2 _276 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_276, float2(0.0), isnan(_276))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_276, float2(0.0), isnan(_276))).x;
    float2 _287 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_287, float2(0.0), isnan(_287))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_287, float2(0.0), isnan(_287))).xy;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = in.m_40.y;
    float _66 = in.m_40.x;
    float _68 = -_54;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _72 = 1.0 / _70;
    float _74 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _76 = _72 * _74;
    float _78 = _76 * _64;
    float _80 = _76 * _66;
    float _82 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _84 = _78 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _86 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _88 = _78 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _90 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[3].x, _82);
    float _92 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[15].x, _84);
    float _94 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _96 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[1].x, _86);
    float _98 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].z, _90);
    float _100 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[15].z, _92);
    float _102 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _104 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[2].x, _94);
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _108 = _100 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _110 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].x, _102);
    float _112 = _78 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _114 = 1.0 / _106;
    float _116 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].z, _96);
    float _118 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].z, _110);
    float _120 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, _104);
    float _122 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[12].x, _88);
    float _124 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[13].x, _112);
    float _126 = _118 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _128 = _116 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _130 = 1.0 / _108;
    float _132 = _120 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _134 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[12].z, _122);
    float _136 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[13].z, _124);
    float _138 = _126 * _114;
    float _140 = _128 * _114;
    float _142 = _132 * _114;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _134 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _148 = _136 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _150 = _146 * _130;
    float _152 = _148 * _130;
    float _154 = rint(_144);
    float _156 = precise::max(_154, 0.0);
    uint _159 = uint(_156);
    uint _161 = clamp(_159, 0u, 65535u);
    float _163 = fma(_60, 2.0, -1.0);
    float _165 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _167 = fma(_62, 2.0, -1.0);
    float _169 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float2 _507 = float2(_150, _152);
    float2 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_507, float2(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_507, float2(0.0), isnan(_507))).xy;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = fma(_165, 0.5, _138);
    float _179 = _167 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _181 = fma(_165, -0.5, _138);
    float _183 = _163 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _185 = fma(_169, 0.5, _140);
    float _187 = fma(_169, -0.5, _140);
    float _189 = fma(_179, 2.0, _52);
    float _191 = fma(_183, 2.0, _50);
    float3 _552 = float3(_177, _185, float(int(_161)));
    float3 _556 = select(_552, float3(0.0), isnan(_552));
    float _193 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _556.xy, uint(rint(_556.z)), 1.0);
    float3 _564 = float3(_181, _185, float(int(_161)));
    float3 _566 = select(_564, float3(0.0), isnan(_564));
    float _195 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _566.xy, uint(rint(_566.z)), 1.0);
    float3 _574 = float3(_177, _187, float(int(_161)));
    float3 _576 = select(_574, float3(0.0), isnan(_574));
    float _197 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _576.xy, uint(rint(_576.z)), 1.0);
    float3 _584 = float3(_181, _187, float(int(_161)));
    float3 _586 = select(_584, float3(0.0), isnan(_584));
    float _199 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _586.xy, uint(rint(_586.z)), 1.0);
    float2 _591 = float2(_191, _189);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_591, float2(0.0), isnan(_591))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_591, float2(0.0), isnan(_591))).x;
    float _203 = _78 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _205 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[14].x, _203);
    float _207 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].z, _205);
    float _209 = _207 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _211 = precise::min(_209, 1.0);
    float _213 = -_76;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _217 = _213 + _215;
    float _219 = -_76;
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _223 = _219 + _221;
    float _225 = _217 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = _223 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = -_173;
    float _235 = fma(_233, _173, _175);
    float _237 = -_173;
    float _239 = _211 + _237;
    float _241 = fma(_239, _239, _235);
    bool _245 = _239 <= 0.001000000047497451305389404296875;
    float _247 = float(_245);
    float _249 = 1.0 / _241;
    float _251 = _193 + _195;
    float _253 = _235 * _249;
    float _255 = _251 + _197;
    float _257 = precise::max(_253, _247);
    float _259 = _255 + _199;
    float _261 = precise::min(_257, 1.0);
    float _263 = fma(_259, 0.25, _227);
    float _265 = _231 + _261;
    out.m_43.x = _201;
    out.m_43.y = _263;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _265;
    return out;
}

