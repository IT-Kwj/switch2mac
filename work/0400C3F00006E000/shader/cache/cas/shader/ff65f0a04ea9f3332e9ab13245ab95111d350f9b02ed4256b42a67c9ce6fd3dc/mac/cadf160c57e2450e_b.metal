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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_34 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _388 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_388, float2(0.0), isnan(_388)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _406 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_406, float2(0.0), isnan(_406))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_38.y;
    float _70 = in.m_36.x;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _82 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].z, _80);
    float _84 = -_60;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = _66 * _82;
    float _92 = _70 * _82;
    float _94 = -_90;
    float _96 = fma(_88, _68, _94);
    float _98 = -_62;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = -_92;
    float _106 = fma(_88, _74, _104);
    float _108 = -_82;
    float _110 = _108 + _88;
    float _112 = _96 * _96;
    float _114 = -_90;
    float _116 = fma(_102, _72, _114);
    float _118 = -_92;
    float _120 = fma(_102, _76, _118);
    float _122 = -_82;
    float _124 = _122 + _102;
    float _126 = fma(_106, _106, _112);
    float _128 = _116 * _116;
    float _130 = fma(_110, _110, _126);
    float _132 = fma(_120, _120, _128);
    float _134 = fma(_124, _124, _132);
    float _136 = rsqrt(_130);
    float _138 = rsqrt(_134);
    float _140 = _106 * _136;
    float _142 = _110 * _136;
    float _144 = _96 * _136;
    float _146 = _124 * _138;
    float _148 = _120 * _138;
    float _150 = _116 * _138;
    float _152 = _140 * _146;
    float _154 = _144 * _148;
    float _156 = _142 * _150;
    float _158 = -_152;
    float _160 = fma(_142, _148, _158);
    float _162 = -_154;
    float _164 = fma(_140, _150, _162);
    float _166 = -_156;
    float _168 = fma(_144, _146, _166);
    float _170 = -_64;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _174 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[46].z, _172);
    float _176 = _160 * _160;
    float _178 = fma(_168, _168, _176);
    float _180 = fma(_164, _164, _178);
    float _182 = rsqrt(_180);
    float _184 = _160 * _182;
    float _186 = _168 * _182;
    float _188 = _164 * _182;
    float _190 = _184 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _192 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[35].x, _190);
    float _194 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[35].z, _192);
    float _196 = abs(_194);
    float _198 = -_196;
    float _200 = _198 + 1.0;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = abs(_202);
    float _206 = log2(_204);
    float _208 = _206 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _210 = exp2(_208);
    float _212 = _210 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _214 = _184 * _212;
    float _216 = _186 * _212;
    float _218 = fma(_188, _212, _174);
    float _220 = fma(_174, _66, _214);
    float _222 = fma(_174, _70, _216);
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _228 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[3].x, _224);
    float _230 = _220 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _232 = _220 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _234 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[2].x, _226);
    float _236 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[3].z, _228);
    float _238 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[2].z, _234);
    float _240 = _236 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _242 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].x, _230);
    float _244 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[1].x, _232);
    float _246 = 1.0 / _240;
    float _248 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[0].z, _242);
    float _250 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[1].z, _244);
    float _252 = _238 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _254 = _248 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _256 = _250 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _260 = _252 * _246;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _256 * _246;
    float _266 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _268 = _254 * _246;
    float _270 = _262 * _258;
    float _272 = _262 * _266;
    float _274 = fma(_270, 1.5, _268);
    float _276 = fma(_270, 0.5, _268);
    float _278 = fma(_270, -0.5, _268);
    float _280 = fma(_270, -1.5, _268);
    float _282 = fma(_272, 1.5, _264);
    float _284 = fma(_272, 0.5, _264);
    float3 _787 = float3(_274, _282, float(0));
    float3 _791 = select(_787, float3(0.0), isnan(_787));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _791.xy, uint(rint(_791.z)), _262);
    float3 _798 = float3(_276, _282, float(0));
    float3 _800 = select(_798, float3(0.0), isnan(_798));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _800.xy, uint(rint(_800.z)), _262);
    float3 _807 = float3(_278, _282, float(0));
    float3 _809 = select(_807, float3(0.0), isnan(_807));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _809.xy, uint(rint(_809.z)), _262);
    float3 _816 = float3(_280, _282, float(0));
    float3 _818 = select(_816, float3(0.0), isnan(_816));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _818.xy, uint(rint(_818.z)), _262);
    float3 _825 = float3(_274, _284, float(0));
    float3 _827 = select(_825, float3(0.0), isnan(_825));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _827.xy, uint(rint(_827.z)), _262);
    float3 _834 = float3(_276, _284, float(0));
    float3 _836 = select(_834, float3(0.0), isnan(_834));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _836.xy, uint(rint(_836.z)), _262);
    float3 _843 = float3(_278, _284, float(0));
    float3 _845 = select(_843, float3(0.0), isnan(_843));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _845.xy, uint(rint(_845.z)), _262);
    float _300 = fma(_272, -0.5, _264);
    float3 _855 = float3(_280, _284, float(0));
    float3 _857 = select(_855, float3(0.0), isnan(_855));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _857.xy, uint(rint(_857.z)), _262);
    float3 _864 = float3(_274, _300, float(0));
    float3 _866 = select(_864, float3(0.0), isnan(_864));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _866.xy, uint(rint(_866.z)), _262);
    float3 _873 = float3(_276, _300, float(0));
    float3 _875 = select(_873, float3(0.0), isnan(_873));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _875.xy, uint(rint(_875.z)), _262);
    float3 _882 = float3(_278, _300, float(0));
    float3 _884 = select(_882, float3(0.0), isnan(_882));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _884.xy, uint(rint(_884.z)), _262);
    float3 _891 = float3(_280, _300, float(0));
    float3 _893 = select(_891, float3(0.0), isnan(_891));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _893.xy, uint(rint(_893.z)), _262);
    float _312 = fma(_272, -1.5, _264);
    float3 _903 = float3(_274, _312, float(0));
    float3 _905 = select(_903, float3(0.0), isnan(_903));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _905.xy, uint(rint(_905.z)), _262);
    float3 _912 = float3(_276, _312, float(0));
    float3 _914 = select(_912, float3(0.0), isnan(_912));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _914.xy, uint(rint(_914.z)), _262);
    float3 _921 = float3(_278, _312, float(0));
    float3 _923 = select(_921, float3(0.0), isnan(_921));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _923.xy, uint(rint(_923.z)), _262);
    float3 _930 = float3(_280, _312, float(0));
    float3 _932 = select(_930, float3(0.0), isnan(_930));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _932.xy, uint(rint(_932.z)), _262);
    float2 _938 = float2(_50, _52);
    float _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_938, float2(0.0), isnan(_938))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_938, float2(0.0), isnan(_938))).x;
    float _324 = -_174;
    float _326 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _328 = _324 + _326;
    float _330 = _328 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _286 + _288;
    float _336 = _334 + _290;
    float _338 = _336 + _292;
    float _340 = _338 + _294;
    float _342 = _340 + _296;
    float _344 = _342 + _298;
    float _346 = _344 + _302;
    float _348 = _346 + _304;
    float _350 = _348 + _306;
    float _352 = _350 + _308;
    float _354 = _352 + _310;
    float _356 = _354 + _314;
    float _358 = _356 + _316;
    float _360 = _358 + _318;
    float _362 = -_174;
    float _364 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _366 = _362 + _364;
    float _368 = _360 + _320;
    float _370 = _366 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _372 = precise::clamp(_370, 0.0, 1.0);
    float _374 = fma(_368, 0.0625, _332);
    float _376 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[48].w, _372);
    out.m_43.x = _322;
    out.m_43.y = _374;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _376;
    return out;
}

