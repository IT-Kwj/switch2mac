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
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
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
    float2 _373 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_373, float2(0.0), isnan(_373)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _391 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_391, float2(0.0), isnan(_391))).x;
    float2 _399 = float2(_52, _54);
    float2 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_399, float2(0.0), isnan(_399))).xy;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = in.m_38.y;
    float _78 = in.m_38.x;
    float _80 = in.m_40.y;
    float _82 = in.m_42.y;
    float _84 = in.m_40.x;
    float _86 = in.m_42.x;
    float _88 = -_60;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_62;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = _76 * _92;
    float _108 = _78 * _92;
    float _110 = -_106;
    float _112 = fma(_98, _80, _110);
    float _114 = -_106;
    float _116 = fma(_104, _82, _114);
    float _118 = -_108;
    float _120 = fma(_98, _84, _118);
    float _122 = -_108;
    float _124 = fma(_104, _86, _122);
    float _126 = _112 * _112;
    float _128 = _116 * _116;
    float _130 = -_92;
    float _132 = _130 + _98;
    float _134 = -_92;
    float _136 = _134 + _104;
    float _138 = fma(_120, _120, _126);
    float _140 = fma(_124, _124, _128);
    float _142 = -_66;
    float _144 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _146 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[46].z, _144);
    float _148 = fma(_132, _132, _138);
    float _150 = fma(_136, _136, _140);
    float _152 = rsqrt(_148);
    float _154 = rsqrt(_150);
    float _156 = _120 * _152;
    float _158 = _132 * _152;
    float _160 = _112 * _152;
    float _162 = _136 * _154;
    float _164 = _116 * _154;
    float _166 = _124 * _154;
    float _168 = _156 * _162;
    float _170 = _158 * _164;
    float _172 = -_168;
    float _174 = fma(_158, _166, _172);
    float _176 = _160 * _166;
    float _178 = -_170;
    float _180 = fma(_160, _162, _178);
    float _182 = _174 * _174;
    float _184 = -_176;
    float _186 = fma(_156, _164, _184);
    float _188 = fma(_72, 2.0, -1.0);
    float _190 = fma(_180, _180, _182);
    float _192 = fma(_186, _186, _190);
    float _194 = rsqrt(_192);
    float _196 = _174 * _194;
    float _198 = _180 * _194;
    float _200 = _186 * _194;
    float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _204 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[35].x, _202);
    float _206 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[35].z, _204);
    float _208 = abs(_206);
    float _210 = -_208;
    float _212 = _210 + 1.0;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = abs(_214);
    float _218 = log2(_216);
    float _220 = _218 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _222 = exp2(_220);
    float _224 = _222 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _226 = _196 * _224;
    float _228 = _198 * _224;
    float _230 = fma(_200, _224, _146);
    float _232 = fma(_146, _76, _226);
    float _234 = fma(_146, _78, _228);
    float _236 = _232 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _240 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[3].x, _236);
    float _242 = _232 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _244 = _232 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _246 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[1].x, _238);
    float _248 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[3].z, _240);
    float _250 = _188 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _252 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[1].z, _246);
    float _254 = _248 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _256 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[0].x, _242);
    float _258 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[2].x, _244);
    float _260 = fma(_74, 2.0, -1.0);
    float _262 = _252 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _264 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[0].z, _256);
    float _266 = 1.0 / _254;
    float _268 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[2].z, _258);
    float _270 = _264 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _272 = _260 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _274 = _268 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _276 = fma(_250, 2.0, _52);
    float _278 = fma(_272, 2.0, _54);
    float _280 = _270 * _266;
    float _282 = _262 * _266;
    float _284 = _274 * _266;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _290 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _292 = fma(_286, _288, _280);
    float _294 = -_288;
    float _296 = fma(_286, _294, _280);
    float _298 = fma(_286, _290, _282);
    float _300 = -_290;
    float _302 = fma(_286, _300, _282);
    float3 _797 = float3(_292, _298, float(0));
    float3 _801 = select(_797, float3(0.0), isnan(_797));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _801.xy, uint(rint(_801.z)), _286);
    float3 _808 = float3(_280, _298, float(0));
    float3 _810 = select(_808, float3(0.0), isnan(_808));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _810.xy, uint(rint(_810.z)), _286);
    float3 _817 = float3(_296, _298, float(0));
    float3 _819 = select(_817, float3(0.0), isnan(_817));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _819.xy, uint(rint(_819.z)), _286);
    float3 _826 = float3(_292, _282, float(0));
    float3 _828 = select(_826, float3(0.0), isnan(_826));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _828.xy, uint(rint(_828.z)), _286);
    float3 _835 = float3(_280, _282, float(0));
    float3 _837 = select(_835, float3(0.0), isnan(_835));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _837.xy, uint(rint(_837.z)), _286);
    float3 _844 = float3(_296, _282, float(0));
    float3 _846 = select(_844, float3(0.0), isnan(_844));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _846.xy, uint(rint(_846.z)), _286);
    float3 _853 = float3(_292, _302, float(0));
    float3 _855 = select(_853, float3(0.0), isnan(_853));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _855.xy, uint(rint(_855.z)), _286);
    float3 _862 = float3(_280, _302, float(0));
    float3 _864 = select(_862, float3(0.0), isnan(_862));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _864.xy, uint(rint(_864.z)), _286);
    float3 _871 = float3(_296, _302, float(0));
    float3 _873 = select(_871, float3(0.0), isnan(_871));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _873.xy, uint(rint(_873.z)), _286);
    float2 _879 = float2(_276, _278);
    float _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_879, float2(0.0), isnan(_879))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_879, float2(0.0), isnan(_879))).x;
    float _324 = -_146;
    float _326 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _328 = _324 + _326;
    float _330 = _328 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _304 + _306;
    float _336 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[48].w, _332);
    float _338 = -_146;
    float _340 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _342 = _338 + _340;
    float _344 = _334 + _308;
    float _346 = _342 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    float _350 = _344 + _310;
    float _352 = _350 + _312;
    float _354 = _352 + _314;
    float _356 = _354 + _316;
    float _358 = _356 + _318;
    float _360 = _358 + _320;
    float _362 = fma(_360, 0.111111111938953399658203125, _348);
    out.m_45.x = _322;
    out.m_45.y = _362;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _336;
    return out;
}

