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
    float2 _384 = float2(_48, _50);
    float3 _54 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_384, float2(0.0), isnan(_384)), int2(0), component::x).xyw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float2 _402 = float2(_48, _50);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_402, float2(0.0), isnan(_402))).x;
    float _64 = in.m_34.y;
    float _66 = in.m_34.x;
    float _68 = in.m_36.y;
    float _70 = in.m_38.y;
    float _72 = in.m_36.x;
    float _74 = in.m_38.x;
    float _76 = -_56;
    float _78 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _80 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[46].z, _78);
    float _82 = -_58;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_60;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_62;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _64 * _80;
    float _102 = _66 * _80;
    float _104 = -_100;
    float _106 = fma(_86, _68, _104);
    float _108 = -_100;
    float _110 = fma(_92, _70, _108);
    float _112 = -_102;
    float _114 = fma(_86, _72, _112);
    float _116 = -_102;
    float _118 = fma(_92, _74, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_80;
    float _126 = _124 + _86;
    float _128 = -_80;
    float _130 = _128 + _92;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = rsqrt(_136);
    float _142 = rsqrt(_138);
    float _144 = _114 * _140;
    float _146 = _126 * _140;
    float _148 = _106 * _140;
    float _150 = _130 * _142;
    float _152 = _118 * _142;
    float _154 = _110 * _142;
    float _156 = _144 * _150;
    float _158 = _148 * _152;
    float _160 = _146 * _154;
    float _162 = -_156;
    float _164 = fma(_146, _152, _162);
    float _166 = -_158;
    float _168 = fma(_144, _154, _166);
    float _170 = -_160;
    float _172 = fma(_148, _150, _170);
    float _174 = _164 * _164;
    float _176 = fma(_172, _172, _174);
    float _178 = fma(_168, _168, _176);
    float _180 = rsqrt(_178);
    float _182 = _164 * _180;
    float _184 = _172 * _180;
    float _186 = _168 * _180;
    float _188 = _182 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _190 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[35].x, _188);
    float _192 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[35].z, _190);
    float _194 = abs(_192);
    float _196 = -_194;
    float _198 = _196 + 1.0;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = abs(_200);
    float _204 = log2(_202);
    float _206 = _204 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _208 = exp2(_206);
    float _210 = _208 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _212 = _182 * _210;
    float _214 = _184 * _210;
    float _216 = fma(_186, _210, _98);
    float _218 = fma(_98, _64, _212);
    float _220 = fma(_98, _66, _214);
    float _222 = _218 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _226 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[3].x, _222);
    float _228 = _218 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _230 = _218 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _232 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[1].x, _224);
    float _234 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[3].z, _226);
    float _236 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[1].z, _232);
    float _238 = _234 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _240 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[0].x, _228);
    float _242 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[2].x, _230);
    float _244 = _236 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _246 = 1.0 / _238;
    float _248 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[0].z, _240);
    float _250 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[2].z, _242);
    float _252 = _248 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _254 = _250 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _256 = _252 * _246;
    float _258 = _244 * _246;
    float _260 = _254 * _246;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _266 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _268 = _262 * _264;
    float _270 = _262 * _266;
    float _272 = fma(_268, 1.5, _256);
    float _274 = fma(_268, 0.5, _256);
    float _276 = fma(_270, 0.5, _258);
    float _278 = fma(_270, 1.5, _258);
    float3 _775 = float3(_272, _278, float(0));
    float3 _779 = select(_775, float3(0.0), isnan(_775));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _779.xy, uint(rint(_779.z)), _262);
    float3 _786 = float3(_274, _278, float(0));
    float3 _788 = select(_786, float3(0.0), isnan(_786));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _788.xy, uint(rint(_788.z)), _262);
    float3 _795 = float3(_272, _276, float(0));
    float3 _797 = select(_795, float3(0.0), isnan(_795));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _797.xy, uint(rint(_797.z)), _262);
    float3 _804 = float3(_274, _276, float(0));
    float3 _806 = select(_804, float3(0.0), isnan(_804));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _806.xy, uint(rint(_806.z)), _262);
    float _288 = fma(_268, -0.5, _256);
    float _290 = fma(_268, -1.5, _256);
    float3 _821 = float3(_288, _278, float(0));
    float3 _823 = select(_821, float3(0.0), isnan(_821));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _823.xy, uint(rint(_823.z)), _262);
    float3 _830 = float3(_290, _278, float(0));
    float3 _832 = select(_830, float3(0.0), isnan(_830));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _832.xy, uint(rint(_832.z)), _262);
    float3 _839 = float3(_288, _276, float(0));
    float3 _841 = select(_839, float3(0.0), isnan(_839));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _841.xy, uint(rint(_841.z)), _262);
    float _298 = fma(_270, -0.5, _258);
    float3 _851 = float3(_290, _276, float(0));
    float3 _853 = select(_851, float3(0.0), isnan(_851));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _853.xy, uint(rint(_853.z)), _262);
    float3 _860 = float3(_272, _298, float(0));
    float3 _862 = select(_860, float3(0.0), isnan(_860));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _862.xy, uint(rint(_862.z)), _262);
    float3 _869 = float3(_274, _298, float(0));
    float3 _871 = select(_869, float3(0.0), isnan(_869));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _871.xy, uint(rint(_871.z)), _262);
    float _306 = fma(_270, -1.5, _258);
    float3 _881 = float3(_288, _298, float(0));
    float3 _883 = select(_881, float3(0.0), isnan(_881));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _883.xy, uint(rint(_883.z)), _262);
    float3 _890 = float3(_290, _298, float(0));
    float3 _892 = select(_890, float3(0.0), isnan(_890));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _892.xy, uint(rint(_892.z)), _262);
    float3 _899 = float3(_272, _306, float(0));
    float3 _901 = select(_899, float3(0.0), isnan(_899));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _901.xy, uint(rint(_901.z)), _262);
    float3 _908 = float3(_274, _306, float(0));
    float3 _910 = select(_908, float3(0.0), isnan(_908));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _910.xy, uint(rint(_910.z)), _262);
    float3 _917 = float3(_288, _306, float(0));
    float3 _919 = select(_917, float3(0.0), isnan(_917));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _919.xy, uint(rint(_919.z)), _262);
    float3 _926 = float3(_290, _306, float(0));
    float3 _928 = select(_926, float3(0.0), isnan(_926));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _928.xy, uint(rint(_928.z)), _262);
    float _320 = _280 + _282;
    float _322 = -_98;
    float _324 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _326 = _322 + _324;
    float _328 = _320 + _292;
    float _330 = _328 + _294;
    float _332 = -_98;
    float _334 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _336 = _332 + _334;
    float _338 = _326 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = _330 + _284;
    float _344 = _336 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _346 = precise::clamp(_344, 0.0, 1.0);
    float _348 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[48].w, _340);
    float _350 = _342 + _286;
    float _352 = _350 + _296;
    float _354 = _352 + _300;
    float _356 = _354 + _302;
    float _358 = _356 + _304;
    float _360 = _358 + _308;
    float _362 = _360 + _310;
    float _364 = _362 + _312;
    float _366 = _364 + _314;
    float _368 = _366 + _316;
    float _370 = _368 + _318;
    float _372 = fma(_370, 0.0625, _346);
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _372;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _348;
    return out;
}

