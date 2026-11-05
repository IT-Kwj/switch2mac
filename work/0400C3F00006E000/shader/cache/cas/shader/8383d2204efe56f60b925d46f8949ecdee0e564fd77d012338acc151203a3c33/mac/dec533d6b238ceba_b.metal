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
    float2 _353 = float2(_48, _50);
    float3 _54 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_353, float2(0.0), isnan(_353)), int2(0), component::x).xyw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float2 _371 = float2(_48, _50);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_371, float2(0.0), isnan(_371))).x;
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
    float _94 = _64 * _80;
    float _96 = _66 * _80;
    float _98 = -_62;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = -_94;
    float _106 = fma(_86, _68, _104);
    float _108 = -_94;
    float _110 = fma(_92, _70, _108);
    float _112 = -_96;
    float _114 = fma(_86, _72, _112);
    float _116 = -_96;
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
    float _152 = _110 * _142;
    float _154 = _118 * _142;
    float _156 = _144 * _150;
    float _158 = _146 * _152;
    float _160 = -_156;
    float _162 = fma(_146, _154, _160);
    float _164 = -_158;
    float _166 = fma(_148, _150, _164);
    float _168 = _148 * _154;
    float _170 = _162 * _162;
    float _172 = -_168;
    float _174 = fma(_144, _152, _172);
    float _176 = fma(_166, _166, _170);
    float _178 = fma(_174, _174, _176);
    float _180 = rsqrt(_178);
    float _182 = _162 * _180;
    float _184 = _166 * _180;
    float _186 = _174 * _180;
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
    float _216 = fma(_186, _210, _102);
    float _218 = fma(_102, _64, _212);
    float _220 = fma(_102, _66, _214);
    float _222 = _218 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _224 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[3].x, _222);
    float _226 = _218 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _228 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[3].z, _224);
    float _230 = _228 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _232 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[2].x, _226);
    float _234 = _218 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _236 = _218 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _238 = 1.0 / _230;
    float _240 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[2].z, _232);
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _244 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[0].x, _234);
    float _246 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[1].x, _236);
    float _248 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[0].z, _244);
    float _250 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[1].z, _246);
    float _252 = _248 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _254 = _250 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _256 = _242 * _238;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _252 * _238;
    float _262 = _254 * _238;
    float _264 = rint(_258);
    float _266 = precise::max(_264, 0.0);
    uint _269 = uint(_266);
    uint _271 = clamp(_269, 0u, 65535u);
    float _273 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _262);
    float _275 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _260);
    float _277 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _279 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _277, _260);
    float _281 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _283 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _281, _262);
    float3 _754 = float3(_260, _273, float(int(_271)));
    float3 _758 = select(_754, float3(0.0), isnan(_754));
    float _285 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _758.xy, uint(rint(_758.z)), 1.0);
    float3 _766 = float3(_275, _273, float(int(_271)));
    float3 _768 = select(_766, float3(0.0), isnan(_766));
    float _287 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _768.xy, uint(rint(_768.z)), 1.0);
    float3 _776 = float3(_279, _273, float(int(_271)));
    float3 _778 = select(_776, float3(0.0), isnan(_776));
    float _289 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _778.xy, uint(rint(_778.z)), 1.0);
    float3 _786 = float3(_275, _262, float(int(_271)));
    float3 _788 = select(_786, float3(0.0), isnan(_786));
    float _291 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _788.xy, uint(rint(_788.z)), 1.0);
    float3 _796 = float3(_260, _262, float(int(_271)));
    float3 _798 = select(_796, float3(0.0), isnan(_796));
    float _293 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _798.xy, uint(rint(_798.z)), 1.0);
    float3 _806 = float3(_279, _262, float(int(_271)));
    float3 _808 = select(_806, float3(0.0), isnan(_806));
    float _295 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _808.xy, uint(rint(_808.z)), 1.0);
    float3 _816 = float3(_275, _283, float(int(_271)));
    float3 _818 = select(_816, float3(0.0), isnan(_816));
    float _297 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _818.xy, uint(rint(_818.z)), 1.0);
    float3 _826 = float3(_260, _283, float(int(_271)));
    float3 _828 = select(_826, float3(0.0), isnan(_826));
    float _299 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _828.xy, uint(rint(_828.z)), 1.0);
    float3 _836 = float3(_279, _283, float(int(_271)));
    float3 _838 = select(_836, float3(0.0), isnan(_836));
    float _301 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _838.xy, uint(rint(_838.z)), 1.0);
    float _303 = _287 + _285;
    float _305 = _303 + _289;
    float _307 = _305 + _291;
    float _309 = _307 + _293;
    float _311 = _309 + _295;
    float _313 = _311 + _297;
    float _315 = -_102;
    float _317 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _319 = _315 + _317;
    float _321 = -_102;
    float _323 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _325 = _321 + _323;
    float _327 = _313 + _299;
    float _329 = _319 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _325 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = _327 + _301;
    float _339 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[48].w, _331);
    float _341 = fma(_337, 0.111111111938953399658203125, _335);
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _341;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _339;
    return out;
}

