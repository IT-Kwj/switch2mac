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
    float2 _405 = float2(_48, _50);
    float3 _54 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_405, float2(0.0), isnan(_405)), int2(0), component::x).xyw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float2 _423 = float2(_48, _50);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_423, float2(0.0), isnan(_423))).x;
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
    float _110 = -_102;
    float _112 = fma(_108, _68, _110);
    float _114 = -_104;
    float _116 = fma(_108, _72, _114);
    float _118 = -_100;
    float _120 = _118 + _108;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _96 * _122;
    float _126 = _112 * _112;
    float _128 = -_102;
    float _130 = fma(_124, _70, _128);
    float _132 = -_104;
    float _134 = fma(_124, _74, _132);
    float _136 = fma(_116, _116, _126);
    float _138 = -_100;
    float _140 = _138 + _124;
    float _142 = _130 * _130;
    float _144 = fma(_120, _120, _136);
    float _146 = fma(_134, _134, _142);
    float _148 = fma(_140, _140, _146);
    float _150 = rsqrt(_144);
    float _152 = rsqrt(_148);
    float _154 = _116 * _150;
    float _156 = _120 * _150;
    float _158 = _112 * _150;
    float _160 = _140 * _152;
    float _162 = _130 * _152;
    float _164 = _134 * _152;
    float _166 = _154 * _160;
    float _168 = _156 * _162;
    float _170 = -_166;
    float _172 = fma(_156, _164, _170);
    float _174 = -_168;
    float _176 = fma(_158, _160, _174);
    float _178 = _158 * _164;
    float _180 = _172 * _172;
    float _182 = -_178;
    float _184 = fma(_154, _162, _182);
    float _186 = fma(_176, _176, _180);
    float _188 = fma(_184, _184, _186);
    float _190 = rsqrt(_188);
    float _192 = _172 * _190;
    float _194 = _176 * _190;
    float _196 = _184 * _190;
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _200 = 1.0 / _94;
    float _202 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].x, _198);
    float _204 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[35].z, _202);
    float _206 = abs(_204);
    float _208 = -_206;
    float _210 = _208 + 1.0;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _216 = _200 * _214;
    float _218 = abs(_212);
    float _220 = log2(_218);
    float _222 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _224 = exp2(_222);
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _228 = _192 * _226;
    float _230 = _194 * _226;
    float _232 = fma(_196, _226, _216);
    float _234 = fma(_216, _64, _228);
    float _236 = fma(_216, _66, _230);
    float _238 = _234 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _240 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[3].x, _238);
    float _242 = _234 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _244 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[3].z, _240);
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _248 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[2].x, _242);
    float _250 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _252 = _234 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _254 = 1.0 / _246;
    float _256 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[2].z, _248);
    float _258 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].x, _250);
    float _260 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[1].x, _252);
    float _262 = _256 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _264 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[0].z, _258);
    float _266 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[1].z, _260);
    float _268 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _270 = _264 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _272 = _266 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _274 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _276 = _262 * _254;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _270 * _254;
    float _282 = _272 * _254;
    float _284 = rint(_278);
    float _286 = precise::max(_284, 0.0);
    uint _289 = uint(_286);
    uint _291 = clamp(_289, 0u, 65535u);
    float _293 = fma(_268, 1.5, _280);
    float _295 = fma(_274, 1.5, _282);
    float _297 = fma(_268, 0.5, _280);
    float _299 = fma(_268, -0.5, _280);
    float _301 = fma(_268, -1.5, _280);
    float _303 = fma(_274, 0.5, _282);
    float _305 = fma(_274, -0.5, _282);
    float3 _829 = float3(_293, _295, float(int(_291)));
    float3 _833 = select(_829, float3(0.0), isnan(_829));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _833.xy, uint(rint(_833.z)), 1.0);
    float3 _841 = float3(_297, _295, float(int(_291)));
    float3 _843 = select(_841, float3(0.0), isnan(_841));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _843.xy, uint(rint(_843.z)), 1.0);
    float3 _851 = float3(_299, _295, float(int(_291)));
    float3 _853 = select(_851, float3(0.0), isnan(_851));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _853.xy, uint(rint(_853.z)), 1.0);
    float3 _861 = float3(_301, _295, float(int(_291)));
    float3 _863 = select(_861, float3(0.0), isnan(_861));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _863.xy, uint(rint(_863.z)), 1.0);
    float3 _871 = float3(_293, _303, float(int(_291)));
    float3 _873 = select(_871, float3(0.0), isnan(_871));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _873.xy, uint(rint(_873.z)), 1.0);
    float3 _881 = float3(_297, _303, float(int(_291)));
    float3 _883 = select(_881, float3(0.0), isnan(_881));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _883.xy, uint(rint(_883.z)), 1.0);
    float3 _891 = float3(_299, _303, float(int(_291)));
    float3 _893 = select(_891, float3(0.0), isnan(_891));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _893.xy, uint(rint(_893.z)), 1.0);
    float3 _901 = float3(_301, _303, float(int(_291)));
    float3 _903 = select(_901, float3(0.0), isnan(_901));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _903.xy, uint(rint(_903.z)), 1.0);
    float3 _911 = float3(_293, _305, float(int(_291)));
    float3 _913 = select(_911, float3(0.0), isnan(_911));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _913.xy, uint(rint(_913.z)), 1.0);
    float3 _921 = float3(_297, _305, float(int(_291)));
    float3 _923 = select(_921, float3(0.0), isnan(_921));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _923.xy, uint(rint(_923.z)), 1.0);
    float _327 = fma(_274, -1.5, _282);
    float3 _934 = float3(_299, _305, float(int(_291)));
    float3 _936 = select(_934, float3(0.0), isnan(_934));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _936.xy, uint(rint(_936.z)), 1.0);
    float3 _944 = float3(_301, _305, float(int(_291)));
    float3 _946 = select(_944, float3(0.0), isnan(_944));
    float _331 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _946.xy, uint(rint(_946.z)), 1.0);
    float3 _954 = float3(_293, _327, float(int(_291)));
    float3 _956 = select(_954, float3(0.0), isnan(_954));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _956.xy, uint(rint(_956.z)), 1.0);
    float3 _964 = float3(_297, _327, float(int(_291)));
    float3 _966 = select(_964, float3(0.0), isnan(_964));
    float _335 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _966.xy, uint(rint(_966.z)), 1.0);
    float3 _974 = float3(_299, _327, float(int(_291)));
    float3 _976 = select(_974, float3(0.0), isnan(_974));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _976.xy, uint(rint(_976.z)), 1.0);
    float3 _984 = float3(_301, _327, float(int(_291)));
    float3 _986 = select(_984, float3(0.0), isnan(_984));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _986.xy, uint(rint(_986.z)), 1.0);
    float _341 = -_216;
    float _343 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _345 = _341 + _343;
    float _347 = _345 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[48].w, _349);
    float _353 = _307 + _309;
    float _355 = _353 + _311;
    float _357 = _355 + _313;
    float _359 = _357 + _315;
    float _361 = _359 + _317;
    float _363 = _361 + _319;
    float _365 = _363 + _321;
    float _367 = _365 + _323;
    float _369 = _367 + _325;
    float _371 = _369 + _329;
    float _373 = _371 + _331;
    float _375 = _373 + _333;
    float _377 = _375 + _335;
    float _379 = -_216;
    float _381 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _383 = _379 + _381;
    float _385 = _377 + _337;
    float _387 = _383 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = _385 + _339;
    float _393 = fma(_391, 0.0625, _389);
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _393;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _351;
    return out;
}

