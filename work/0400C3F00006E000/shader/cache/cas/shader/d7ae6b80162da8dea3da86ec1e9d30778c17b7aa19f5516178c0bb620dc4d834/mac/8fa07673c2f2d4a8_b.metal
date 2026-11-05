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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
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
    float2 _422 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _439 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439))).x;
    float2 _447 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_447, float2(0.0), isnan(_447))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_40.x;
    float _82 = in.m_42.y;
    float _84 = in.m_44.y;
    float _86 = in.m_42.x;
    float _88 = in.m_44.x;
    float _90 = -_62;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = -_66;
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _102 = 1.0 / _92;
    float _104 = 1.0 / _96;
    float _106 = 1.0 / _100;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _102 * _108;
    float _112 = _78 * _110;
    float _114 = _80 * _110;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _118 = _104 * _116;
    float _120 = -_112;
    float _122 = fma(_118, _82, _120);
    float _124 = -_114;
    float _126 = fma(_118, _86, _124);
    float _128 = -_110;
    float _130 = _128 + _118;
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _134 = _106 * _132;
    float _136 = _122 * _122;
    float _138 = -_112;
    float _140 = fma(_134, _84, _138);
    float _142 = -_114;
    float _144 = fma(_134, _88, _142);
    float _146 = fma(_126, _126, _136);
    float _148 = -_110;
    float _150 = _148 + _134;
    float _152 = _140 * _140;
    float _154 = fma(_130, _130, _146);
    float _156 = fma(_144, _144, _152);
    float _158 = fma(_150, _150, _156);
    float _160 = rsqrt(_154);
    float _162 = rsqrt(_158);
    float _164 = _126 * _160;
    float _166 = _130 * _160;
    float _168 = _122 * _160;
    float _170 = _150 * _162;
    float _172 = _144 * _162;
    float _174 = _140 * _162;
    float _176 = -_68;
    float _178 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _180 = _164 * _170;
    float _182 = _166 * _174;
    float _184 = -_180;
    float _186 = fma(_166, _172, _184);
    float _188 = _168 * _172;
    float _190 = -_182;
    float _192 = fma(_168, _170, _190);
    float _194 = 1.0 / _178;
    float _196 = _186 * _186;
    float _198 = -_188;
    float _200 = fma(_164, _174, _198);
    float _202 = fma(_192, _192, _196);
    float _204 = fma(_200, _200, _202);
    float _206 = rsqrt(_204);
    float _208 = _186 * _206;
    float _210 = _192 * _206;
    float _212 = _200 * _206;
    float _214 = _208 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _216 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].x, _214);
    float _218 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].z, _216);
    float _220 = abs(_218);
    float _222 = -_220;
    float _224 = _222 + 1.0;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _230 = _194 * _228;
    float _232 = _230 * _78;
    float _234 = abs(_226);
    float _236 = log2(_234);
    float _238 = _230 * _80;
    float _240 = _232 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _242 = _232 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _244 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[15].x, _240);
    float _246 = _232 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _248 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[13].x, _242);
    float _250 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[15].z, _244);
    float _252 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[13].z, _248);
    float _254 = _236 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _256 = _250 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _258 = _252 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _260 = exp2(_254);
    float _262 = 1.0 / _256;
    float _264 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _266 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[12].x, _246);
    float _268 = fma(_208, _264, _232);
    float _270 = fma(_210, _264, _238);
    float _272 = fma(_212, _264, _230);
    float _274 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[12].z, _266);
    float _276 = _268 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _278 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _280 = _268 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _282 = _274 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _284 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].x, _276);
    float _286 = _268 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _288 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].z, _284);
    float _290 = _288 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _292 = _282 * _262;
    float _294 = _258 * _262;
    float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
    float _298 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].x, _278);
    float _300 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].x, _280);
    float _302 = fma(_74, 2.0, -1.0);
    float _304 = fma(_76, 2.0, -1.0);
    float _306 = 1.0 / _290;
    float _308 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
    float _310 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
    float _312 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].z, _300);
    float _314 = _304 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _320 = fma(_314, 2.0, _56);
    float _322 = _302 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _324 = _312 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _326 = fma(_322, 2.0, _54);
    float2 _882 = float2(_292, _294);
    float2 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_882, float2(0.0), isnan(_882))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_882, float2(0.0), isnan(_882))).xy;
    float _330 = _328.x;
    float _332 = _328.y;
    float _334 = _318 * _306;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = _324 * _306;
    float _340 = _316 * _306;
    float _342 = rint(_336);
    float _344 = precise::max(_342, 0.0);
    uint _347 = uint(_344);
    uint _349 = clamp(_347, 0u, 65535u);
    float3 _918 = float3(_340, _338, float(int(_349)));
    float3 _922 = select(_918, float3(0.0), isnan(_918));
    float _351 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _922.xy, uint(rint(_922.z)), 1.0);
    float2 _927 = float2(_326, _320);
    float _353 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_927, float2(0.0), isnan(_927))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_927, float2(0.0), isnan(_927))).x;
    float _355 = _232 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _357 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[14].x, _355);
    float _359 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[14].z, _357);
    float _361 = _359 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _363 = precise::min(_361, 1.0);
    float _365 = -_230;
    float _367 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _369 = _365 + _367;
    float _371 = -_230;
    float _373 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _375 = _371 + _373;
    float _377 = _369 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = _375 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = -_330;
    float _387 = fma(_385, _330, _332);
    float _389 = -_330;
    float _391 = _363 + _389;
    float _393 = fma(_391, _391, _387);
    bool _397 = _391 <= 0.001000000047497451305389404296875;
    float _399 = float(_397);
    float _401 = 1.0 / _393;
    float _403 = _379 + _351;
    float _405 = _387 * _401;
    float _407 = precise::max(_405, _399);
    float _409 = precise::min(_407, 1.0);
    float _411 = _383 + _409;
    out.m_47.x = _353;
    out.m_47.y = _403;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _411;
    return out;
}

