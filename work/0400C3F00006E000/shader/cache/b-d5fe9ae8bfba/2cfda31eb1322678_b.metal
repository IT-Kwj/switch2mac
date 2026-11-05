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
    float2 _389 = float2(_48, _50);
    float3 _54 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389)), int2(0), component::x).xyw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float2 _407 = float2(_48, _50);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_407, float2(0.0), isnan(_407))).x;
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
    float _224 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[3].x, _222);
    float _226 = _218 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _228 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[3].z, _224);
    float _230 = _228 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _232 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[2].x, _226);
    float _234 = _218 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _236 = _218 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _238 = 1.0 / _230;
    float _240 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[2].z, _232);
    float _242 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[0].x, _234);
    float _244 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[1].x, _236);
    float _246 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _248 = _240 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _250 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[0].z, _242);
    float _252 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[1].z, _244);
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _256 = _250 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _258 = _252 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _260 = _248 * _238;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _256 * _238;
    float _266 = _258 * _238;
    float _268 = rint(_262);
    float _270 = precise::max(_268, 0.0);
    uint _273 = uint(_270);
    uint _275 = clamp(_273, 0u, 65535u);
    float _277 = fma(_246, 1.5, _264);
    float _279 = fma(_254, 1.5, _266);
    float _281 = fma(_246, 0.5, _264);
    float _283 = fma(_246, -0.5, _264);
    float _285 = fma(_246, -1.5, _264);
    float _287 = fma(_254, 0.5, _266);
    float _289 = fma(_254, -0.5, _266);
    float3 _797 = float3(_277, _279, float(int(_275)));
    float3 _801 = select(_797, float3(0.0), isnan(_797));
    float _291 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _801.xy, uint(rint(_801.z)), 1.0);
    float3 _809 = float3(_281, _279, float(int(_275)));
    float3 _811 = select(_809, float3(0.0), isnan(_809));
    float _293 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _811.xy, uint(rint(_811.z)), 1.0);
    float3 _819 = float3(_283, _279, float(int(_275)));
    float3 _821 = select(_819, float3(0.0), isnan(_819));
    float _295 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _821.xy, uint(rint(_821.z)), 1.0);
    float3 _829 = float3(_285, _279, float(int(_275)));
    float3 _831 = select(_829, float3(0.0), isnan(_829));
    float _297 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _831.xy, uint(rint(_831.z)), 1.0);
    float3 _839 = float3(_277, _287, float(int(_275)));
    float3 _841 = select(_839, float3(0.0), isnan(_839));
    float _299 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _841.xy, uint(rint(_841.z)), 1.0);
    float3 _849 = float3(_281, _287, float(int(_275)));
    float3 _851 = select(_849, float3(0.0), isnan(_849));
    float _301 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _851.xy, uint(rint(_851.z)), 1.0);
    float3 _859 = float3(_283, _287, float(int(_275)));
    float3 _861 = select(_859, float3(0.0), isnan(_859));
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _861.xy, uint(rint(_861.z)), 1.0);
    float3 _869 = float3(_285, _287, float(int(_275)));
    float3 _871 = select(_869, float3(0.0), isnan(_869));
    float _305 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _871.xy, uint(rint(_871.z)), 1.0);
    float3 _879 = float3(_277, _289, float(int(_275)));
    float3 _881 = select(_879, float3(0.0), isnan(_879));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _881.xy, uint(rint(_881.z)), 1.0);
    float3 _889 = float3(_281, _289, float(int(_275)));
    float3 _891 = select(_889, float3(0.0), isnan(_889));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _891.xy, uint(rint(_891.z)), 1.0);
    float _311 = fma(_254, -1.5, _266);
    float3 _902 = float3(_283, _289, float(int(_275)));
    float3 _904 = select(_902, float3(0.0), isnan(_902));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _904.xy, uint(rint(_904.z)), 1.0);
    float3 _912 = float3(_285, _289, float(int(_275)));
    float3 _914 = select(_912, float3(0.0), isnan(_912));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _914.xy, uint(rint(_914.z)), 1.0);
    float3 _922 = float3(_277, _311, float(int(_275)));
    float3 _924 = select(_922, float3(0.0), isnan(_922));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _924.xy, uint(rint(_924.z)), 1.0);
    float3 _932 = float3(_281, _311, float(int(_275)));
    float3 _934 = select(_932, float3(0.0), isnan(_932));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _934.xy, uint(rint(_934.z)), 1.0);
    float3 _942 = float3(_283, _311, float(int(_275)));
    float3 _944 = select(_942, float3(0.0), isnan(_942));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _944.xy, uint(rint(_944.z)), 1.0);
    float3 _952 = float3(_285, _311, float(int(_275)));
    float3 _954 = select(_952, float3(0.0), isnan(_952));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _954.xy, uint(rint(_954.z)), 1.0);
    float _325 = -_98;
    float _327 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _329 = _325 + _327;
    float _331 = _329 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[48].w, _333);
    float _337 = _291 + _293;
    float _339 = _337 + _295;
    float _341 = _339 + _297;
    float _343 = _341 + _299;
    float _345 = _343 + _301;
    float _347 = _345 + _303;
    float _349 = _347 + _305;
    float _351 = _349 + _307;
    float _353 = _351 + _309;
    float _355 = _353 + _313;
    float _357 = _355 + _315;
    float _359 = _357 + _317;
    float _361 = _359 + _319;
    float _363 = -_98;
    float _365 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _367 = _363 + _365;
    float _369 = _361 + _321;
    float _371 = _367 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = _369 + _323;
    float _377 = fma(_375, 0.0625, _373);
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _377;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _335;
    return out;
}

