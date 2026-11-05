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
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
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
    float2 _446 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_446, float2(0.0), isnan(_446)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _463 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_463, float2(0.0), isnan(_463))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _86;
    float _96 = 1.0 / _90;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _92 * _98;
    float _102 = _68 * _100;
    float _104 = _72 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _94 * _106;
    float _110 = -_102;
    float _112 = fma(_108, _70, _110);
    float _114 = -_104;
    float _116 = fma(_108, _76, _114);
    float _118 = -_100;
    float _120 = _118 + _108;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _96 * _122;
    float _126 = _112 * _112;
    float _128 = -_102;
    float _130 = fma(_124, _74, _128);
    float _132 = -_104;
    float _134 = fma(_124, _78, _132);
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
    float _174 = _158 * _164;
    float _176 = -_168;
    float _178 = fma(_158, _160, _176);
    float _180 = _172 * _172;
    float _182 = -_174;
    float _184 = fma(_154, _162, _182);
    float _186 = fma(_178, _178, _180);
    float _188 = fma(_184, _184, _186);
    float _190 = rsqrt(_188);
    float _192 = _172 * _190;
    float _194 = _178 * _190;
    float _196 = _184 * _190;
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].x, _198);
    float _202 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[35].z, _200);
    float _204 = abs(_202);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = abs(_210);
    float _214 = log2(_212);
    float _216 = -_66;
    float _218 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _220 = 1.0 / _218;
    float _222 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _224 = exp2(_222);
    float _226 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _228 = _220 * _226;
    float _230 = _228 * _68;
    float _232 = _228 * _72;
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _236 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[13].x, _234);
    float _238 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _240 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[13].z, _236);
    float _242 = fma(_192, _238, _230);
    float _244 = fma(_194, _238, _232);
    float _246 = fma(_196, _238, _228);
    float _248 = _230 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _252 = _240 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _254 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[15].x, _248);
    float _256 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].x, _250);
    float _258 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[3].z, _256);
    float _260 = _258 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _262 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[15].z, _254);
    float _264 = _230 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _266 = _262 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _268 = 1.0 / _260;
    float _270 = _242 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _272 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[12].x, _264);
    float _274 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].x, _270);
    float _276 = _242 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _278 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _280 = 1.0 / _266;
    float _282 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[2].z, _274);
    float _284 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].x, _276);
    float _286 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].x, _278);
    float _288 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[12].z, _272);
    float _290 = _282 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _292 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, _284);
    float _294 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[1].z, _286);
    float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _298 = _290 * _268;
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = _292 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _304 = _294 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _306 = rint(_300);
    float _308 = precise::max(_306, 0.0);
    uint _311 = uint(_308);
    uint _313 = clamp(_311, 0u, 65535u);
    float _315 = _302 * _268;
    float _317 = _304 * _268;
    float _319 = _296 * _280;
    float _321 = _252 * _280;
    float _323 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _317);
    float _325 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _327 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _325, _315);
    float _329 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _315);
    float _331 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _333 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _331, _317);
    float3 _927 = float3(_315, _323, float(int(_313)));
    float3 _931 = select(_927, float3(0.0), isnan(_927));
    float _335 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _931.xy, uint(rint(_931.z)), 1.0);
    float3 _939 = float3(_329, _323, float(int(_313)));
    float3 _941 = select(_939, float3(0.0), isnan(_939));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _941.xy, uint(rint(_941.z)), 1.0);
    float3 _949 = float3(_327, _323, float(int(_313)));
    float3 _951 = select(_949, float3(0.0), isnan(_949));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _951.xy, uint(rint(_951.z)), 1.0);
    float3 _959 = float3(_329, _317, float(int(_313)));
    float3 _961 = select(_959, float3(0.0), isnan(_959));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _961.xy, uint(rint(_961.z)), 1.0);
    float3 _969 = float3(_315, _317, float(int(_313)));
    float3 _971 = select(_969, float3(0.0), isnan(_969));
    float _343 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _971.xy, uint(rint(_971.z)), 1.0);
    float2 _976 = float2(_319, _321);
    float2 _347 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_976, float2(0.0), isnan(_976))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_976, float2(0.0), isnan(_976))).xy;
    float _349 = _347.x;
    float _351 = _347.y;
    float3 _991 = float3(_327, _317, float(int(_313)));
    float3 _993 = select(_991, float3(0.0), isnan(_991));
    float _353 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _993.xy, uint(rint(_993.z)), 1.0);
    float3 _1001 = float3(_329, _333, float(int(_313)));
    float3 _1003 = select(_1001, float3(0.0), isnan(_1001));
    float _355 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1003.xy, uint(rint(_1003.z)), 1.0);
    float3 _1011 = float3(_315, _333, float(int(_313)));
    float3 _1013 = select(_1011, float3(0.0), isnan(_1011));
    float _357 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1013.xy, uint(rint(_1013.z)), 1.0);
    float3 _1021 = float3(_327, _333, float(int(_313)));
    float3 _1023 = select(_1021, float3(0.0), isnan(_1021));
    float _359 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1023.xy, uint(rint(_1023.z)), 1.0);
    float2 _1028 = float2(_52, _54);
    float _361 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1028, float2(0.0), isnan(_1028))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1028, float2(0.0), isnan(_1028))).x;
    float _363 = _230 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _365 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[14].x, _363);
    float _367 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[14].z, _365);
    float _369 = _367 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _371 = precise::min(_369, 1.0);
    float _373 = -_228;
    float _375 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _377 = _373 + _375;
    float _379 = -_228;
    float _381 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _383 = _379 + _381;
    float _385 = _377 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = _383 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = _337 + _335;
    float _395 = _393 + _339;
    float _397 = -_349;
    float _399 = fma(_397, _349, _351);
    float _401 = -_349;
    float _403 = _371 + _401;
    float _405 = _395 + _341;
    float _407 = fma(_403, _403, _399);
    float _409 = _405 + _343;
    bool _413 = _403 <= 0.001000000047497451305389404296875;
    float _415 = float(_413);
    float _417 = _409 + _353;
    float _419 = 1.0 / _407;
    float _421 = _417 + _355;
    float _423 = _421 + _357;
    float _425 = _423 + _359;
    float _427 = fma(_425, 0.111111111938953399658203125, _387);
    float _429 = _399 * _419;
    float _431 = precise::max(_429, _415);
    float _433 = precise::min(_431, 1.0);
    float _435 = _391 + _433;
    out.m_45.x = _361;
    out.m_45.y = _427;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _435;
    return out;
}

