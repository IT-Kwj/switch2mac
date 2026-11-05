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
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
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
    float2 _800 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_800, float2(0.0), isnan(_800)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _817 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_817, float2(0.0), isnan(_817))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_817, float2(0.0), isnan(_817))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_100;
    float _106 = fma(_92, _74, _104);
    float _108 = -_100;
    float _110 = fma(_98, _76, _108);
    float _112 = -_102;
    float _114 = fma(_92, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_86;
    float _126 = _124 + _92;
    float _128 = -_86;
    float _130 = _128 + _98;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = rsqrt(_136);
    float _142 = rsqrt(_138);
    float _144 = _114 * _140;
    float _146 = _126 * _140;
    float _148 = _106 * _140;
    float _150 = -_68;
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _154 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[46].z, _152);
    float _156 = _154 * _70;
    float _158 = _130 * _142;
    float _160 = _110 * _142;
    float _162 = _118 * _142;
    float _164 = _154 * _72;
    float _166 = _144 * _158;
    float _168 = _146 * _160;
    float _170 = -_166;
    float _172 = fma(_146, _162, _170);
    float _174 = -_168;
    float _176 = fma(_148, _158, _174);
    float _178 = _148 * _162;
    float _180 = _172 * _172;
    float _182 = -_178;
    float _184 = fma(_144, _160, _182);
    float _186 = fma(_176, _176, _180);
    float _188 = fma(_184, _184, _186);
    float _190 = rsqrt(_188);
    float _192 = _172 * _190;
    float _194 = _176 * _190;
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
    float _216 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _218 = exp2(_216);
    float _220 = _218 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _222 = fma(_192, _220, _156);
    float _224 = fma(_194, _220, _164);
    float _226 = fma(_196, _220, _154);
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _232 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].x, _228);
    float _234 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].x, _230);
    float _236 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[3].z, _232);
    float _238 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].z, _234);
    float _240 = _236 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _242 = _222 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _244 = _222 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _246 = _238 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _248 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _242);
    float _250 = 1.0 / _240;
    float _252 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].x, _244);
    float _254 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].z, _248);
    float _256 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[2].z, _252);
    float _258 = _254 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _262 = _246 * _250;
    float _264 = _258 * _250;
    float _266 = _260 * _250;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _272 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _274 = fma(_268, _270, _262);
    float _276 = -_270;
    float _278 = fma(_268, _276, _262);
    float _280 = fma(_268, _272, _264);
    float _282 = -_272;
    float _284 = fma(_268, _282, _264);
    float3 _1190 = float3(_274, _280, float(0));
    float3 _1194 = select(_1190, float3(0.0), isnan(_1190));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1194.xy, uint(rint(_1194.z)), _268);
    float3 _1201 = float3(_262, _280, float(0));
    float3 _1203 = select(_1201, float3(0.0), isnan(_1201));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1203.xy, uint(rint(_1203.z)), _268);
    float3 _1210 = float3(_278, _280, float(0));
    float3 _1212 = select(_1210, float3(0.0), isnan(_1210));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1212.xy, uint(rint(_1212.z)), _268);
    float3 _1219 = float3(_274, _264, float(0));
    float3 _1221 = select(_1219, float3(0.0), isnan(_1219));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1221.xy, uint(rint(_1221.z)), _268);
    float3 _1228 = float3(_262, _264, float(0));
    float3 _1230 = select(_1228, float3(0.0), isnan(_1228));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1230.xy, uint(rint(_1230.z)), _268);
    float3 _1237 = float3(_278, _264, float(0));
    float3 _1239 = select(_1237, float3(0.0), isnan(_1237));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1239.xy, uint(rint(_1239.z)), _268);
    float3 _1246 = float3(_274, _284, float(0));
    float3 _1248 = select(_1246, float3(0.0), isnan(_1246));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1248.xy, uint(rint(_1248.z)), _268);
    float3 _1255 = float3(_262, _284, float(0));
    float3 _1257 = select(_1255, float3(0.0), isnan(_1255));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1257.xy, uint(rint(_1257.z)), _268);
    float3 _1264 = float3(_278, _284, float(0));
    float3 _1266 = select(_1264, float3(0.0), isnan(_1264));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1266.xy, uint(rint(_1266.z)), _268);
    float _304 = -_156;
    float _306 = _304 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _308 = -_156;
    float _310 = _308 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _312 = -_164;
    float _314 = _312 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _316 = -_164;
    float _318 = _316 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _320 = _306 * _306;
    float _322 = _310 * _310;
    float _324 = -_154;
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _328 = fma(_314, _314, _320);
    float _330 = fma(_318, _318, _322);
    float _332 = _156 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _334 = _156 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _336 = fma(_326, _326, _328);
    float _338 = -_154;
    float _340 = _338 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _342 = _156 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _344 = _156 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _346 = _156 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _348 = fma(_340, _340, _330);
    float _350 = sqrt(_336);
    float _352 = _156 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _354 = _156 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _356 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[19].x, _344);
    float _358 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[20].x, _332);
    float _360 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[21].x, _334);
    float _362 = _156 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _364 = sqrt(_348);
    float _366 = _156 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _368 = _156 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _370 = _156 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _372 = _156 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _374 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[22].x, _346);
    float _376 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[24].x, _352);
    float _378 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[16].x, _354);
    bool _382 = _350 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _384 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[21].z, _360);
    bool _386 = _350 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _388 = _156 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _390 = !_382;
    int _393 = _390 ? 0 : 1;
    float _395 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[19].z, _356);
    float _397 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[20].z, _358);
    float _399 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[24].z, _376);
    bool _401 = _364 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _403 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[22].z, _374);
    bool _405 = _364 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _407 = _156 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _409 = !_401;
    int _411 = _409 ? 0 : 1;
    float _413 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[16].z, _378);
    int _415 = 2;
    int _417 = 2;
    if (!_382)
    {
        _415 = 1;
    }
    int _419 = _415;
    float _421 = _397 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    int _423 = _419;
    float _425 = _421;
    if (!_386)
    {
        _423 = _393;
    }
    int _427 = _423;
    float _429 = _156 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _431 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[28].x, _366);
    float _433 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[29].x, _368);
    float _435 = float(_427);
    float _437 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[26].x, _407);
    if (!_401)
    {
        _417 = 1;
    }
    int _439 = _417;
    float _441 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[33].x, _372);
    float _443 = precise::min(_435, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _445 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[27].x, _362);
    int _447 = _439;
    if (!_405)
    {
        _447 = _411;
    }
    int _449 = _447;
    float _451 = _156 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    bool _453 = _443 != 1.0;
    bool _455 = isnan(_443);
    bool _457 = _453 || _455;
    bool _459 = isnan(1.0);
    bool _461 = _457 || _459;
    float _463 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[31].x, _388);
    bool _465 = _443 != 0.0;
    bool _467 = isnan(_443);
    bool _469 = _465 || _467;
    bool _471 = isnan(0.0);
    bool _473 = _469 || _471;
    float _475 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[18].x, _451);
    float _477 = float(_449);
    float _479 = rint(_443);
    float _481 = precise::max(_479, 0.0);
    uint _484 = uint(_481);
    uint _486 = clamp(_484, 0u, 65535u);
    float _488 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[28].z, _431);
    float _490 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[29].z, _433);
    float _492 = precise::min(_477, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _494 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[33].z, _441);
    float _496 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[31].z, _463);
    float _498 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[27].z, _445);
    bool _500 = _492 != 1.0;
    bool _502 = isnan(_492);
    bool _504 = _500 || _502;
    bool _506 = isnan(1.0);
    bool _508 = _504 || _506;
    float _510 = _490 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _512 = _488 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _514 = _512;
    float _516 = _510;
    if (_508)
    {
        float _518 = _496 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _514 = _518;
    }
    float _520 = _514;
    float _522 = _286 + _288;
    float _524 = _156 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _526 = _522 + _290;
    float _528 = _156 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _530 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[25].x, _524);
    float _532 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[30].x, _342);
    float _534 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[17].x, _429);
    float _536 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[23].x, _528);
    float _538 = _526 + _292;
    float _540 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[30].z, _532);
    float _542 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[17].z, _534);
    float _544 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[23].z, _536);
    float _546 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[32].x, _370);
    float _548 = _540 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _550 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[18].z, _475);
    float _552 = _384 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _554 = _395 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _556 = _538 + _294;
    float _558 = _552;
    float _560 = _554;
    float _562 = _548;
    float _564 = _520;
    if (_461)
    {
        float _566 = _399 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _558 = _566;
    }
    float _568 = _558;
    float _570 = _568;
    if (_461)
    {
        float _572 = _403 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _560 = _572;
    }
    float _574 = _560;
    float _576 = _574;
    if (_461)
    {
        float _578 = _544 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _425 = _578;
    }
    float _580 = _425;
    float _582 = _580;
    if (!_473)
    {
        float _584 = _550 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _570 = _584;
    }
    float _586 = _570;
    if (!_473)
    {
        float _588 = _413 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _576 = _588;
    }
    float _590 = _576;
    if (!_473)
    {
        float _592 = _542 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _582 = _592;
    }
    float _594 = _582;
    bool _596 = _492 != 0.0;
    bool _598 = isnan(_492);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _556 + _296;
    float _608 = 0.0 + _586;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float _612 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _614 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _616 = _606 + _298;
    float _618 = rint(_492);
    float _620 = precise::max(_618, 0.0);
    uint _622 = uint(_620);
    uint _624 = clamp(_622, 0u, 65535u);
    float _626 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[32].z, _546);
    float _628 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[26].z, _437);
    float _630 = _616 + _300;
    float _632 = fma(_610, _612, _590);
    float _634 = -_612;
    float _636 = fma(_610, _634, _590);
    float _638 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[25].z, _530);
    float _640 = fma(_610, _614, _594);
    if (_508)
    {
        float _642 = _494 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _562 = _642;
    }
    float _644 = _562;
    float _646 = _644;
    if (_508)
    {
        float _648 = _626 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _516 = _648;
    }
    float _650 = _516;
    float _652 = _650;
    if (!_604)
    {
        float _654 = _498 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _646 = _654;
    }
    float _656 = _646;
    float3 _1912 = float3(_632, _594, float(int(_486)));
    float3 _1914 = select(_1912, float3(0.0), isnan(_1912));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1914.xy, uint(rint(_1914.z)), _610);
    float3 _1923 = float3(_590, _640, float(int(_486)));
    float3 _1925 = select(_1923, float3(0.0), isnan(_1923));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1925.xy, uint(rint(_1925.z)), _610);
    float3 _1934 = float3(_636, _640, float(int(_486)));
    float3 _1936 = select(_1934, float3(0.0), isnan(_1934));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1936.xy, uint(rint(_1936.z)), _610);
    float3 _1945 = float3(_632, _640, float(int(_486)));
    float3 _1947 = select(_1945, float3(0.0), isnan(_1945));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1947.xy, uint(rint(_1947.z)), _610);
    if (!_604)
    {
        float _666 = _638 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _564 = _666;
    }
    float _668 = _564;
    float _670 = -_614;
    float _672 = fma(_610, _670, _594);
    float3 _1972 = float3(_590, _594, float(int(_486)));
    float3 _1974 = select(_1972, float3(0.0), isnan(_1972));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1974.xy, uint(rint(_1974.z)), _610);
    float3 _1983 = float3(_636, _594, float(int(_486)));
    float3 _1985 = select(_1983, float3(0.0), isnan(_1983));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1985.xy, uint(rint(_1985.z)), _610);
    float3 _1994 = float3(_632, _672, float(int(_486)));
    float3 _1996 = select(_1994, float3(0.0), isnan(_1994));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1996.xy, uint(rint(_1996.z)), _610);
    if (!_604)
    {
        float _680 = _628 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _652 = _680;
    }
    float _682 = _652;
    float _684 = _630 + _302;
    float _686 = 0.0 + _656;
    float _688 = precise::clamp(_686, 0.0, 1.0);
    float _690 = fma(_614, _688, _682);
    float _692 = fma(_612, _688, _668);
    float3 _2030 = float3(_590, _672, float(int(_486)));
    float3 _2032 = select(_2030, float3(0.0), isnan(_2030));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2032.xy, uint(rint(_2032.z)), _610);
    float _696 = -_612;
    float _698 = fma(_696, _688, _668);
    float3 _2047 = float3(_636, _672, float(int(_486)));
    float3 _2049 = select(_2047, float3(0.0), isnan(_2047));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2049.xy, uint(rint(_2049.z)), _610);
    float3 _2058 = float3(_668, _690, float(int(_624)));
    float3 _2060 = select(_2058, float3(0.0), isnan(_2058));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2060.xy, uint(rint(_2060.z)), _688);
    float3 _2069 = float3(_692, _690, float(int(_624)));
    float3 _2071 = select(_2069, float3(0.0), isnan(_2069));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2071.xy, uint(rint(_2071.z)), _688);
    float3 _2080 = float3(_698, _690, float(int(_624)));
    float3 _2082 = select(_2080, float3(0.0), isnan(_2080));
    float _706 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2082.xy, uint(rint(_2082.z)), _688);
    float3 _2091 = float3(_692, _682, float(int(_624)));
    float3 _2093 = select(_2091, float3(0.0), isnan(_2091));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2093.xy, uint(rint(_2093.z)), _688);
    float _710 = -_614;
    float _712 = fma(_710, _688, _682);
    float3 _2108 = float3(_668, _682, float(int(_624)));
    float3 _2110 = select(_2108, float3(0.0), isnan(_2108));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2110.xy, uint(rint(_2110.z)), _688);
    float3 _2119 = float3(_698, _682, float(int(_624)));
    float3 _2121 = select(_2119, float3(0.0), isnan(_2119));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2121.xy, uint(rint(_2121.z)), _688);
    float3 _2130 = float3(_692, _712, float(int(_624)));
    float3 _2132 = select(_2130, float3(0.0), isnan(_2130));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2132.xy, uint(rint(_2132.z)), _688);
    float3 _2141 = float3(_668, _712, float(int(_624)));
    float3 _2143 = select(_2141, float3(0.0), isnan(_2141));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2143.xy, uint(rint(_2143.z)), _688);
    float3 _2152 = float3(_698, _712, float(int(_624)));
    float3 _2154 = select(_2152, float3(0.0), isnan(_2152));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2154.xy, uint(rint(_2154.z)), _688);
    float2 _2160 = float2(_54, _56);
    float _724 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2160, float2(0.0), isnan(_2160))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2160, float2(0.0), isnan(_2160))).x;
    float _726 = -_154;
    float _728 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _730 = _726 + _728;
    float _732 = _730 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = -_154;
    float _738 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _740 = _736 + _738;
    float _742 = fma(_684, 0.111111111938953399658203125, _734);
    float _744 = _740 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = _664 + _660;
    float _750 = _748 + _662;
    float _752 = _750 + _658;
    float _754 = _752 + _674;
    float _756 = _754 + _676;
    float _758 = _756 + _678;
    float _760 = _758 + _694;
    float _762 = _760 + _700;
    float _764 = _704 + _702;
    float _766 = _762 * 0.111111111938953399658203125;
    float _768 = _764 + _706;
    float _770 = _768 + _708;
    float _772 = _770 + _714;
    float _774 = _772 + _716;
    float _776 = _774 + _718;
    float _778 = _776 + _720;
    float _780 = _778 + _722;
    float _782 = _780 * 0.111111111938953399658203125;
    float _784 = _782 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _786 = fma(_766, (*spvDescriptorSet0.fp_c3)._m0[49].z, _784);
    float _788 = _746 + _786;
    out.m_47.x = _724;
    out.m_47.y = _742;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _788;
    return out;
}

