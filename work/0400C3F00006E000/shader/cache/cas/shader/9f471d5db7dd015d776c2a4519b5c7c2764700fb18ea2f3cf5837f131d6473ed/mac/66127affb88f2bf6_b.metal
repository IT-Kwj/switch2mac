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
    float2 _409 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _427 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = _68 * _84;
    float _94 = _72 * _84;
    float _96 = -_92;
    float _98 = fma(_90, _70, _96);
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = -_94;
    float _108 = fma(_90, _76, _106);
    float _110 = -_84;
    float _112 = _110 + _90;
    float _114 = _98 * _98;
    float _116 = -_92;
    float _118 = fma(_104, _74, _116);
    float _120 = -_94;
    float _122 = fma(_104, _78, _120);
    float _124 = -_84;
    float _126 = _124 + _104;
    float _128 = fma(_108, _108, _114);
    float _130 = _118 * _118;
    float _132 = -_66;
    float _134 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _136 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[46].z, _134);
    float _138 = fma(_112, _112, _128);
    float _140 = fma(_122, _122, _130);
    float _142 = fma(_126, _126, _140);
    float _144 = rsqrt(_138);
    float _146 = rsqrt(_142);
    float _148 = _108 * _144;
    float _150 = _112 * _144;
    float _152 = _98 * _144;
    float _154 = _126 * _146;
    float _156 = _122 * _146;
    float _158 = _118 * _146;
    float _160 = _148 * _154;
    float _162 = _152 * _156;
    float _164 = _150 * _158;
    float _166 = -_160;
    float _168 = fma(_150, _156, _166);
    float _170 = -_162;
    float _172 = fma(_148, _158, _170);
    float _174 = -_164;
    float _176 = fma(_152, _154, _174);
    float _178 = _168 * _168;
    float _180 = fma(_176, _176, _178);
    float _182 = fma(_172, _172, _180);
    float _184 = rsqrt(_182);
    float _186 = _168 * _184;
    float _188 = _176 * _184;
    float _190 = _172 * _184;
    float _192 = _186 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _194 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[35].x, _192);
    float _196 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[35].z, _194);
    float _198 = abs(_196);
    float _200 = -_198;
    float _202 = _200 + 1.0;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = abs(_204);
    float _208 = log2(_206);
    float _210 = _208 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _212 = exp2(_210);
    float _214 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _216 = _186 * _214;
    float _218 = _188 * _214;
    float _220 = fma(_190, _214, _136);
    float _222 = fma(_136, _68, _216);
    float _224 = fma(_136, _72, _218);
    float _226 = _222 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _230 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].x, _226);
    float _232 = _222 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _234 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].x, _228);
    float _236 = _222 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _238 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[3].z, _230);
    float _240 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[2].z, _234);
    float _242 = _238 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _244 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].x, _232);
    float _246 = _240 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _248 = 1.0 / _242;
    float _250 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[0].z, _244);
    float _252 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _236);
    float _254 = _250 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _256 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[1].z, _252);
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _262 = _246 * _248;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _254 * _248;
    float _268 = _260 * _248;
    float _270 = _264 * _258;
    float _272 = fma(_270, 1.5, _266);
    float _274 = fma(_270, 0.5, _266);
    float _276 = fma(_270, -0.5, _266);
    float _278 = fma(_270, -1.5, _266);
    float _280 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _282 = _264 * _280;
    float _284 = fma(_282, 1.5, _268);
    float _286 = fma(_282, 0.5, _268);
    float3 _808 = float3(_272, _284, float(0));
    float3 _812 = select(_808, float3(0.0), isnan(_808));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _812.xy, uint(rint(_812.z)), _264);
    float3 _819 = float3(_274, _284, float(0));
    float3 _821 = select(_819, float3(0.0), isnan(_819));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _821.xy, uint(rint(_821.z)), _264);
    float3 _828 = float3(_276, _284, float(0));
    float3 _830 = select(_828, float3(0.0), isnan(_828));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _830.xy, uint(rint(_830.z)), _264);
    float3 _837 = float3(_278, _284, float(0));
    float3 _839 = select(_837, float3(0.0), isnan(_837));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _839.xy, uint(rint(_839.z)), _264);
    float3 _846 = float3(_272, _286, float(0));
    float3 _848 = select(_846, float3(0.0), isnan(_846));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _848.xy, uint(rint(_848.z)), _264);
    float3 _855 = float3(_274, _286, float(0));
    float3 _857 = select(_855, float3(0.0), isnan(_855));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _857.xy, uint(rint(_857.z)), _264);
    float _300 = fma(_282, -0.5, _268);
    float _302 = fma(_282, -1.5, _268);
    float3 _870 = float3(_276, _286, float(0));
    float3 _872 = select(_870, float3(0.0), isnan(_870));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _872.xy, uint(rint(_872.z)), _264);
    float2 _878 = float2(_52, _54);
    float2 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_878, float2(0.0), isnan(_878))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_878, float2(0.0), isnan(_878))).xy;
    float _310 = _308.x;
    float _312 = _308.y;
    float _314 = _288 + _290;
    float _316 = _314 + _292;
    float _318 = _316 + _294;
    float _320 = _318 + _296;
    float3 _903 = float3(_278, _286, float(0));
    float3 _905 = select(_903, float3(0.0), isnan(_903));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _905.xy, uint(rint(_905.z)), _264);
    float3 _912 = float3(_272, _300, float(0));
    float3 _914 = select(_912, float3(0.0), isnan(_912));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _914.xy, uint(rint(_914.z)), _264);
    float3 _921 = float3(_274, _300, float(0));
    float3 _923 = select(_921, float3(0.0), isnan(_921));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _923.xy, uint(rint(_923.z)), _264);
    float3 _930 = float3(_276, _300, float(0));
    float3 _932 = select(_930, float3(0.0), isnan(_930));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _932.xy, uint(rint(_932.z)), _264);
    float _330 = _320 + _298;
    float _332 = fma(_310, 2.0, -1.0);
    float _334 = fma(_312, 2.0, -1.0);
    float _336 = _330 + _304;
    float _338 = _332 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _340 = _334 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _342 = fma(_340, 2.0, _54);
    float3 _963 = float3(_278, _300, float(0));
    float3 _965 = select(_963, float3(0.0), isnan(_963));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _965.xy, uint(rint(_965.z)), _264);
    float _346 = fma(_338, 2.0, _52);
    float3 _975 = float3(_272, _302, float(0));
    float3 _977 = select(_975, float3(0.0), isnan(_975));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _977.xy, uint(rint(_977.z)), _264);
    float3 _984 = float3(_274, _302, float(0));
    float3 _986 = select(_984, float3(0.0), isnan(_984));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _986.xy, uint(rint(_986.z)), _264);
    float3 _993 = float3(_276, _302, float(0));
    float3 _995 = select(_993, float3(0.0), isnan(_993));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _995.xy, uint(rint(_995.z)), _264);
    float _354 = _336 + _322;
    float3 _1005 = float3(_278, _302, float(0));
    float3 _1007 = select(_1005, float3(0.0), isnan(_1005));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1007.xy, uint(rint(_1007.z)), _264);
    float2 _1013 = float2(_346, _342);
    float _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1013, float2(0.0), isnan(_1013))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1013, float2(0.0), isnan(_1013))).x;
    float _360 = _354 + _324;
    float _362 = _360 + _326;
    float _364 = _362 + _328;
    float _366 = _364 + _344;
    float _368 = -_136;
    float _370 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _372 = _368 + _370;
    float _374 = _366 + _348;
    float _376 = -_136;
    float _378 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _380 = _376 + _378;
    float _382 = _372 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    float _386 = _374 + _350;
    float _388 = _380 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[48].w, _384);
    float _394 = _386 + _352;
    float _396 = _394 + _356;
    float _398 = fma(_396, 0.0625, _390);
    out.m_45.x = _358;
    out.m_45.y = _398;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _392;
    return out;
}

