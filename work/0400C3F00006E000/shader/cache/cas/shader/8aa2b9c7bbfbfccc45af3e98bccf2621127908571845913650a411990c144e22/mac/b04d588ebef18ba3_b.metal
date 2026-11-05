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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
    float4 m_36 [[user(locn2), center_no_perspective]];
    float4 m_32 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_32.x;
    float _50 = in.m_32.y;
    float2 _364 = float2(_48, _50);
    float3 _54 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364)), int2(0), component::x).xyw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float2 _382 = float2(_48, _50);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_382, float2(0.0), isnan(_382))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_382, float2(0.0), isnan(_382))).x;
    float _64 = in.m_34.y;
    float _66 = in.m_34.x;
    float _68 = in.m_36.y;
    float _70 = in.m_38.y;
    float _72 = in.m_36.x;
    float _74 = in.m_38.x;
    float _76 = -_56;
    float _78 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_58;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = 1.0 / _78;
    float _90 = 1.0 / _86;
    float _92 = -_62;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _82;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _88 * _98;
    float _102 = _64 * _100;
    float _104 = _66 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _90 * _106;
    float _110 = 1.0 / _94;
    float _112 = -_102;
    float _114 = fma(_108, _68, _112);
    float _116 = -_104;
    float _118 = fma(_108, _72, _116);
    float _120 = -_100;
    float _122 = _120 + _108;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _96 * _124;
    float _128 = _114 * _114;
    float _130 = -_102;
    float _132 = fma(_126, _70, _130);
    float _134 = -_104;
    float _136 = fma(_126, _74, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_100;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = fma(_122, _122, _138);
    float _148 = fma(_136, _136, _144);
    float _150 = fma(_142, _142, _148);
    float _152 = rsqrt(_146);
    float _154 = rsqrt(_150);
    float _156 = _118 * _152;
    float _158 = _122 * _152;
    float _160 = _114 * _152;
    float _162 = _142 * _154;
    float _164 = _132 * _154;
    float _166 = _136 * _154;
    float _168 = _156 * _162;
    float _170 = _158 * _164;
    float _172 = -_168;
    float _174 = fma(_158, _166, _172);
    float _176 = -_170;
    float _178 = fma(_160, _162, _176);
    float _180 = _160 * _166;
    float _182 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _184 = _110 * _182;
    float _186 = _174 * _174;
    float _188 = -_180;
    float _190 = fma(_156, _164, _188);
    float _192 = fma(_178, _178, _186);
    float _194 = fma(_190, _190, _192);
    float _196 = rsqrt(_194);
    float _198 = _174 * _196;
    float _200 = _178 * _196;
    float _202 = _190 * _196;
    float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _206 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[35].x, _204);
    float _208 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[35].z, _206);
    float _210 = abs(_208);
    float _212 = -_210;
    float _214 = _212 + 1.0;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = abs(_216);
    float _220 = log2(_218);
    float _222 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _224 = exp2(_222);
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _228 = _198 * _226;
    float _230 = _200 * _226;
    float _232 = fma(_202, _226, _184);
    float _234 = fma(_184, _64, _228);
    float _236 = fma(_184, _66, _230);
    float _238 = _234 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _240 = _234 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _242 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[3].x, _238);
    float _244 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _246 = _234 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _248 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[1].x, _240);
    float _250 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[3].z, _242);
    float _252 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[1].z, _248);
    float _254 = _250 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _256 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].x, _244);
    float _258 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[2].x, _246);
    float _260 = 1.0 / _254;
    float _262 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[0].z, _256);
    float _264 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[2].z, _258);
    float _266 = _252 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _268 = _262 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _270 = _264 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _272 = _268 * _260;
    float _274 = _266 * _260;
    float _276 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _278 = _270 * _260;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _284 = fma(_280, _276, _272);
    float _286 = fma(_280, _282, _274);
    float _288 = -_276;
    float _290 = fma(_280, _288, _272);
    float _292 = -_282;
    float _294 = fma(_280, _292, _274);
    float3 _771 = float3(_284, _286, float(0));
    float3 _775 = select(_771, float3(0.0), isnan(_771));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _775.xy, uint(rint(_775.z)), _280);
    float3 _782 = float3(_272, _286, float(0));
    float3 _784 = select(_782, float3(0.0), isnan(_782));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _784.xy, uint(rint(_784.z)), _280);
    float3 _791 = float3(_290, _286, float(0));
    float3 _793 = select(_791, float3(0.0), isnan(_791));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _793.xy, uint(rint(_793.z)), _280);
    float3 _800 = float3(_284, _274, float(0));
    float3 _802 = select(_800, float3(0.0), isnan(_800));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _802.xy, uint(rint(_802.z)), _280);
    float3 _809 = float3(_272, _274, float(0));
    float3 _811 = select(_809, float3(0.0), isnan(_809));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _811.xy, uint(rint(_811.z)), _280);
    float3 _818 = float3(_290, _274, float(0));
    float3 _820 = select(_818, float3(0.0), isnan(_818));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _820.xy, uint(rint(_820.z)), _280);
    float3 _827 = float3(_284, _294, float(0));
    float3 _829 = select(_827, float3(0.0), isnan(_827));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _829.xy, uint(rint(_829.z)), _280);
    float3 _836 = float3(_272, _294, float(0));
    float3 _838 = select(_836, float3(0.0), isnan(_836));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _838.xy, uint(rint(_838.z)), _280);
    float3 _845 = float3(_290, _294, float(0));
    float3 _847 = select(_845, float3(0.0), isnan(_845));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _847.xy, uint(rint(_847.z)), _280);
    float _314 = -_184;
    float _316 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _318 = _314 + _316;
    float _320 = -_184;
    float _322 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _324 = _320 + _322;
    float _326 = _318 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[48].w, _328);
    float _332 = _324 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _296 + _298;
    float _338 = _336 + _300;
    float _340 = _338 + _302;
    float _342 = _340 + _304;
    float _344 = _342 + _306;
    float _346 = _344 + _308;
    float _348 = _346 + _310;
    float _350 = _348 + _312;
    float _352 = fma(_350, 0.111111111938953399658203125, _334);
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _352;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _330;
    return out;
}

