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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _308 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_308, float2(0.0), isnan(_308))).x;
    float _60 = in.m_40.w;
    float _62 = in.m_42.w;
    float _64 = in.m_42.y;
    float _66 = in.m_40.x;
    float _68 = in.m_42.x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.z;
    float _74 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _76 = -_74;
    float _78 = fma(_76, _60, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _80 = -_74;
    float _82 = fma(_80, _62, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _84 = -_74;
    float _86 = fma(_84, _64, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _88 = -_74;
    float _90 = fma(_88, _66, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _92 = 1.0 / _78;
    float _94 = -_74;
    float _96 = fma(_94, _68, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _98 = fma(_82, (*spvDescriptorSet0.fp_c4)._m0[17].y, _86);
    float _100 = -_74;
    float _102 = fma(_100, _70, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _104 = -_74;
    float _106 = fma(_104, _72, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _108 = -_82;
    float _110 = fma(_108, (*spvDescriptorSet0.fp_c4)._m0[17].x, _96);
    float _112 = fma(_82, (*spvDescriptorSet0.fp_c4)._m0[17].x, _96);
    float _114 = -_82;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c4)._m0[17].y, _86);
    float _118 = 1.0 / _82;
    float _120 = fma(_90, _92, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _122 = fma(_102, _92, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _124 = _120 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _126 = _122 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float _128 = _98 * _118;
    float _130 = _110 * _118;
    float _132 = _106 * _118;
    float _134 = _112 * _118;
    float2 _460 = float2(_54, _56);
    float3 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_460, float2(0.0), isnan(_460))).xyz;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = _116 * _118;
    float2 _477 = float2(_134, _128);
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477)), _132);
    float2 _485 = float2(_130, _128);
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_485, float2(0.0), isnan(_485)), _132);
    float2 _493 = float2(_134, _146);
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_493, float2(0.0), isnan(_493)), _132);
    float2 _501 = float2(_130, _146);
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_501, float2(0.0), isnan(_501)), _132);
    float2 _509 = float2(_124, _126);
    float3 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_509, float2(0.0), isnan(_509))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_509, float2(0.0), isnan(_509))).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = -_78;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _172 = in.m_44.x;
    bool _176 = _170 <= 1.0;
    bool _178 = isnan(_170);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = float(_184);
    float _188 = _170 * _186;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = abs(_190);
    float _194 = log2(_192);
    float _196 = precise::min(_90, _102);
    float _198 = precise::max(_90, _102);
    bool _200 = _196 >= 0.0;
    bool _202 = isnan(_196);
    bool _204 = _200 || _202;
    bool _206 = isnan(0.0);
    bool _208 = _204 || _206;
    bool _210 = _78 >= _198;
    bool _212 = isnan(_78);
    bool _214 = _210 || _212;
    bool _216 = isnan(_198);
    bool _218 = _214 || _216;
    bool _220 = _218 && _208;
    float _222 = float(_220);
    float _224 = -_74;
    float _226 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _228 = fma(_224, _164, _226);
    float _230 = _228 * _228;
    float _232 = _194 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _234 = -_74;
    float _236 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _238 = fma(_234, _172, _236);
    float _240 = -_74;
    float _242 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _244 = fma(_240, _166, _242);
    float _246 = fma(_238, _238, _230);
    float _248 = exp2(_232);
    float _250 = fma(_244, _244, _246);
    float _252 = rsqrt(_250);
    float _254 = _222 * _248;
    float _256 = fma(_142, 2.0, -1.0);
    float _258 = fma(_140, 2.0, -1.0);
    float _260 = fma(_144, 2.0, -1.0);
    float _262 = _256 * _228;
    float _264 = _148 + _150;
    float _266 = fma(_258, _238, _262);
    float _268 = _264 + _152;
    float _270 = fma(_260, _244, _266);
    float _272 = _268 + _154;
    float _274 = -_252;
    float _276 = fma(_274, _270, 0.0);
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _272 * _254;
    float _282 = _280 * 0.25;
    float _284 = _158 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _286 = _160 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _288 = _282 * _278;
    float _290 = _162 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _292 = _284 * _288;
    float _294 = _286 * _288;
    float _296 = _290 * _288;
    out.m_47.x = _292;
    out.m_47.y = _294;
    out.m_47.z = _296;
    return out;
}

