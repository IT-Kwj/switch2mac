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
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
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
    float2 _445 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_445, float2(0.0), isnan(_445)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _462 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_462, float2(0.0), isnan(_462))).x;
    float2 _470 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_470, float2(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_470, float2(0.0), isnan(_470))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_40.x;
    float _82 = in.m_42.y;
    float _84 = in.m_44.y;
    float _86 = in.m_42.x;
    float _88 = in.m_44.x;
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_64;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = _78 * _94;
    float _110 = _80 * _94;
    float _112 = -_108;
    float _114 = fma(_100, _82, _112);
    float _116 = -_108;
    float _118 = fma(_106, _84, _116);
    float _120 = -_110;
    float _122 = fma(_100, _86, _120);
    float _124 = -_110;
    float _126 = fma(_106, _88, _124);
    float _128 = _114 * _114;
    float _130 = _118 * _118;
    float _132 = -_94;
    float _134 = _132 + _100;
    float _136 = -_94;
    float _138 = _136 + _106;
    float _140 = fma(_122, _122, _128);
    float _142 = fma(_126, _126, _130);
    float _144 = fma(_134, _134, _140);
    float _146 = fma(_138, _138, _142);
    float _148 = rsqrt(_144);
    float _150 = rsqrt(_146);
    float _152 = _122 * _148;
    float _154 = _134 * _148;
    float _156 = _114 * _148;
    float _158 = _138 * _150;
    float _160 = _118 * _150;
    float _162 = _126 * _150;
    float _164 = _152 * _158;
    float _166 = _154 * _160;
    float _168 = -_164;
    float _170 = fma(_154, _162, _168);
    float _172 = -_166;
    float _174 = fma(_156, _158, _172);
    float _176 = _156 * _162;
    float _178 = _170 * _170;
    float _180 = -_176;
    float _182 = fma(_152, _160, _180);
    float _184 = fma(_174, _174, _178);
    float _186 = fma(_182, _182, _184);
    float _188 = rsqrt(_186);
    float _190 = _170 * _188;
    float _192 = _174 * _188;
    float _194 = _182 * _188;
    float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _198 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].x, _196);
    float _200 = -_68;
    float _202 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _204 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[46].z, _202);
    float _206 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].z, _198);
    float _208 = _204 * _78;
    float _210 = _204 * _80;
    float _212 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _214 = abs(_206);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = _208 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _224 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _226 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[15].x, _222);
    float _228 = abs(_220);
    float _230 = log2(_228);
    float _232 = _208 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _234 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[15].z, _226);
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _238 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[13].x, _232);
    float _240 = 1.0 / _236;
    float _242 = _230 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _244 = exp2(_242);
    float _246 = _244 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _248 = _208 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _250 = fma(_190, _246, _208);
    float _252 = fma(_192, _246, _210);
    float _254 = fma(_194, _246, _204);
    float _256 = _250 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _258 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[3].x, _256);
    float _260 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[12].x, _248);
    float _262 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[13].z, _238);
    float _264 = _250 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _266 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[3].z, _258);
    float _268 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[12].z, _260);
    float _270 = _262 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _272 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[1].x, _264);
    float _274 = _266 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _276 = _268 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _278 = _250 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _280 = _250 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _282 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[1].z, _272);
    float _284 = _276 * _240;
    float _286 = 1.0 / _274;
    float _288 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[0].x, _278);
    float _290 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[2].x, _280);
    float _292 = _282 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _294 = _270 * _240;
    float _296 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, _288);
    float _298 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[2].z, _290);
    float _300 = _296 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _302 = _298 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _304 = _300 * _286;
    float _306 = _292 * _286;
    float _308 = _302 * _286;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = fma(_76, 2.0, -1.0);
    float _314 = fma(_74, 2.0, -1.0);
    float _316 = fma(_310, _212, _304);
    float _318 = fma(_310, _224, _306);
    float _320 = _312 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _322 = _314 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _915 = float3(_316, _318, float(0));
    float3 _919 = select(_915, float3(0.0), isnan(_915));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _919.xy, uint(rint(_919.z)), _310);
    float _326 = -_224;
    float _328 = fma(_310, _326, _306);
    float _330 = fma(_320, 2.0, _56);
    float _332 = fma(_322, 2.0, _54);
    float _334 = -_212;
    float _336 = fma(_310, _334, _304);
    float3 _944 = float3(_304, _318, float(0));
    float3 _946 = select(_944, float3(0.0), isnan(_944));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _946.xy, uint(rint(_946.z)), _310);
    float3 _953 = float3(_336, _318, float(0));
    float3 _955 = select(_953, float3(0.0), isnan(_953));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _955.xy, uint(rint(_955.z)), _310);
    float3 _962 = float3(_316, _306, float(0));
    float3 _964 = select(_962, float3(0.0), isnan(_962));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _964.xy, uint(rint(_964.z)), _310);
    float3 _971 = float3(_304, _306, float(0));
    float3 _973 = select(_971, float3(0.0), isnan(_971));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _973.xy, uint(rint(_973.z)), _310);
    float2 _979 = float2(_284, _294);
    float2 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_979, float2(0.0), isnan(_979))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_979, float2(0.0), isnan(_979))).xy;
    float _348 = _346.x;
    float _350 = _346.y;
    float3 _992 = float3(_336, _306, float(0));
    float3 _994 = select(_992, float3(0.0), isnan(_992));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _994.xy, uint(rint(_994.z)), _310);
    float3 _1001 = float3(_316, _328, float(0));
    float3 _1003 = select(_1001, float3(0.0), isnan(_1001));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1003.xy, uint(rint(_1003.z)), _310);
    float3 _1010 = float3(_304, _328, float(0));
    float3 _1012 = select(_1010, float3(0.0), isnan(_1010));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1012.xy, uint(rint(_1012.z)), _310);
    float3 _1019 = float3(_336, _328, float(0));
    float3 _1021 = select(_1019, float3(0.0), isnan(_1019));
    float _358 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1021.xy, uint(rint(_1021.z)), _310);
    float2 _1027 = float2(_332, _330);
    float _360 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1027, float2(0.0), isnan(_1027))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1027, float2(0.0), isnan(_1027))).x;
    float _362 = _208 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _364 = -_204;
    float _366 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _368 = _364 + _366;
    float _370 = -_204;
    float _372 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _374 = _370 + _372;
    float _376 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[14].x, _362);
    float _378 = _368 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = _374 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    float _386 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[14].z, _376);
    float _388 = _386 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _390 = precise::min(_388, 1.0);
    float _392 = _324 + _338;
    float _394 = -_348;
    float _396 = fma(_394, _348, _350);
    float _398 = -_348;
    float _400 = _390 + _398;
    float _402 = _392 + _340;
    float _404 = fma(_400, _400, _396);
    float _406 = _402 + _342;
    bool _410 = _400 <= 0.001000000047497451305389404296875;
    float _412 = float(_410);
    float _414 = 1.0 / _404;
    float _416 = _406 + _344;
    float _418 = _416 + _352;
    float _420 = _418 + _354;
    float _422 = _396 * _414;
    float _424 = _420 + _356;
    float _426 = precise::max(_422, _412);
    float _428 = _424 + _358;
    float _430 = precise::min(_426, 1.0);
    float _432 = fma(_428, 0.111111111938953399658203125, _380);
    float _434 = _384 + _430;
    out.m_47.x = _360;
    out.m_47.y = _432;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _434;
    return out;
}

