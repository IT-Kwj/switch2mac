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
    float2 _820 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_820, float2(0.0), isnan(_820)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _837 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_837, float2(0.0), isnan(_837))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_837, float2(0.0), isnan(_837))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = 1.0 / _92;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _94 * _100;
    float _104 = _70 * _102;
    float _106 = _72 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _74, _112);
    float _116 = -_106;
    float _118 = fma(_110, _78, _116);
    float _120 = -_102;
    float _122 = _120 + _110;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _98 * _124;
    float _128 = _114 * _114;
    float _130 = -_104;
    float _132 = fma(_126, _76, _130);
    float _134 = -_106;
    float _136 = fma(_126, _80, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_102;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = fma(_122, _122, _138);
    float _148 = fma(_136, _136, _144);
    float _150 = fma(_142, _142, _148);
    float _152 = rsqrt(_146);
    float _154 = rsqrt(_150);
    float _156 = _118 * _152;
    float _158 = _122 * _152;
    float _160 = _114 * _152;
    float _162 = _142 * _154;
    float _164 = _132 * _154;
    float _166 = _136 * _154;
    float _168 = _156 * _162;
    float _170 = _158 * _164;
    float _172 = -_168;
    float _174 = fma(_158, _166, _172);
    float _176 = -_170;
    float _178 = fma(_160, _162, _176);
    float _180 = _160 * _166;
    float _182 = -_68;
    float _184 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _186 = _174 * _174;
    float _188 = -_180;
    float _190 = fma(_156, _164, _188);
    float _192 = fma(_178, _178, _186);
    float _194 = 1.0 / _184;
    float _196 = fma(_190, _190, _192);
    float _198 = rsqrt(_196);
    float _200 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _202 = _194 * _200;
    float _204 = _202 * _70;
    float _206 = _202 * _72;
    float _208 = _174 * _198;
    float _210 = _178 * _198;
    float _212 = _190 * _198;
    float _214 = _208 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _216 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].x, _214);
    float _218 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].z, _216);
    float _220 = abs(_218);
    float _222 = -_220;
    float _224 = _222 + 1.0;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = abs(_226);
    float _230 = log2(_228);
    float _232 = _230 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _234 = exp2(_232);
    float _236 = _234 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _238 = fma(_208, _236, _204);
    float _240 = fma(_210, _236, _206);
    float _242 = fma(_212, _236, _202);
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _246 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].x, _244);
    float _248 = _238 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _250 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[3].z, _246);
    float _252 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].x, _248);
    float _254 = _238 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _256 = _238 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _258 = _250 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _260 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[2].z, _252);
    float _262 = 1.0 / _258;
    float _264 = _260 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _266 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].x, _254);
    float _268 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].x, _256);
    float _270 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[0].z, _266);
    float _272 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].z, _268);
    float _274 = _270 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _276 = _272 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _278 = _264 * _262;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _276 * _262;
    float _284 = _274 * _262;
    float _286 = rint(_280);
    float _288 = precise::max(_286, 0.0);
    uint _291 = uint(_288);
    uint _293 = clamp(_291, 0u, 65535u);
    float _295 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _282);
    float _297 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _284);
    float _299 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _301 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _299, _284);
    float _303 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _305 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _303, _282);
    float3 _1236 = float3(_284, _295, float(int(_293)));
    float3 _1240 = select(_1236, float3(0.0), isnan(_1236));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1240.xy, uint(rint(_1240.z)), 1.0);
    float3 _1248 = float3(_297, _295, float(int(_293)));
    float3 _1250 = select(_1248, float3(0.0), isnan(_1248));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1250.xy, uint(rint(_1250.z)), 1.0);
    float3 _1258 = float3(_301, _295, float(int(_293)));
    float3 _1260 = select(_1258, float3(0.0), isnan(_1258));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1260.xy, uint(rint(_1260.z)), 1.0);
    float3 _1268 = float3(_297, _282, float(int(_293)));
    float3 _1270 = select(_1268, float3(0.0), isnan(_1268));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1270.xy, uint(rint(_1270.z)), 1.0);
    float3 _1278 = float3(_284, _282, float(int(_293)));
    float3 _1280 = select(_1278, float3(0.0), isnan(_1278));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1280.xy, uint(rint(_1280.z)), 1.0);
    float3 _1288 = float3(_301, _282, float(int(_293)));
    float3 _1290 = select(_1288, float3(0.0), isnan(_1288));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1290.xy, uint(rint(_1290.z)), 1.0);
    float3 _1298 = float3(_297, _305, float(int(_293)));
    float3 _1300 = select(_1298, float3(0.0), isnan(_1298));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1300.xy, uint(rint(_1300.z)), 1.0);
    float3 _1308 = float3(_284, _305, float(int(_293)));
    float3 _1310 = select(_1308, float3(0.0), isnan(_1308));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1310.xy, uint(rint(_1310.z)), 1.0);
    float3 _1318 = float3(_301, _305, float(int(_293)));
    float3 _1320 = select(_1318, float3(0.0), isnan(_1318));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1320.xy, uint(rint(_1320.z)), 1.0);
    float _325 = -_204;
    float _327 = _325 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _329 = -_206;
    float _331 = _329 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _333 = _204 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _335 = _204 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _337 = _327 * _327;
    float _339 = _204 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _341 = -_206;
    float _343 = _341 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _345 = _204 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _347 = fma(_331, _331, _337);
    float _349 = -_202;
    float _351 = _349 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _353 = _204 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _355 = _204 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _357 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[18].x, _345);
    float _359 = fma(_351, _351, _347);
    float _361 = -_204;
    float _363 = _361 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _365 = -_202;
    float _367 = _365 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _369 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[19].x, _333);
    float _371 = _363 * _363;
    float _373 = sqrt(_359);
    float _375 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[20].x, _335);
    float _377 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[22].x, _353);
    float _379 = fma(_343, _343, _371);
    float _381 = _204 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _383 = _204 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _385 = _204 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _387 = fma(_367, _367, _379);
    float _389 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[24].x, _381);
    float _391 = _204 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _393 = _204 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _395 = _204 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _397 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[24].z, _389);
    float _399 = sqrt(_387);
    float _401 = _204 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _403 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[29].x, _355);
    bool _407 = _373 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _409 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[18].z, _357);
    bool _411 = _373 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _413 = _204 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _415 = !_407;
    int _418 = _415 ? 0 : 1;
    float _420 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[31].x, _391);
    float _422 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[19].z, _369);
    float _424 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[20].z, _375);
    float _426 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[22].z, _377);
    float _428 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[16].x, _383);
    float _430 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[25].x, _339);
    float _432 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[27].x, _393);
    float _434 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[28].x, _413);
    int _436 = 2;
    if (!_407)
    {
        _436 = 1;
    }
    int _438 = _436;
    float _440 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[32].x, _401);
    int _442 = _438;
    if (!_411)
    {
        _442 = _418;
    }
    int _444 = _442;
    float _446 = _204 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    bool _448 = _399 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _450 = _424 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    bool _452 = _399 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _454 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[21].x, _446);
    float _456 = float(_444);
    float _458 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[16].z, _428);
    bool _460 = !_448;
    int _462 = _460 ? 0 : 1;
    float _464 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[21].z, _454);
    float _466 = precise::min(_456, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _468 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[28].z, _434);
    float _470 = _464 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _472 = _466 != 1.0;
    bool _474 = isnan(_466);
    bool _476 = _472 || _474;
    bool _478 = isnan(1.0);
    bool _480 = _476 || _478;
    float _482 = _204 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _484 = 2;
    float _486 = _470;
    float _488 = _450;
    if (!_448)
    {
        _484 = 1;
    }
    int _490 = _484;
    float _492 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[31].z, _420);
    int _494 = _490;
    if (!_452)
    {
        _494 = _462;
    }
    int _496 = _494;
    float _498 = _204 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _500 = _466 != 0.0;
    bool _502 = isnan(_466);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[23].x, _482);
    float _512 = float(_496);
    float _514 = _204 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _516 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[17].x, _498);
    float _518 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[23].z, _510);
    float _520 = precise::min(_512, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    if (_480)
    {
        float _522 = _397 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _486 = _522;
    }
    float _524 = _486;
    float _526 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[30].x, _395);
    float _528 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[26].x, _385);
    float _530 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[33].x, _514);
    float _532 = _422 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _534 = _520 != 1.0;
    bool _536 = isnan(_520);
    bool _538 = _534 || _536;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    float _544 = _532;
    float _546 = _524;
    if (_480)
    {
        float _548 = _426 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _544 = _548;
    }
    float _550 = _544;
    float _552 = _550;
    if (_480)
    {
        float _554 = _518 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _488 = _554;
    }
    float _556 = _488;
    float _558 = rint(_466);
    float _560 = precise::max(_558, 0.0);
    uint _562 = uint(_560);
    uint _564 = clamp(_562, 0u, 65535u);
    bool _566 = _520 != 0.0;
    bool _568 = isnan(_520);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    float _576 = _556;
    if (!_508)
    {
        float _578 = _409 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _546 = _578;
    }
    float _580 = _546;
    float _582 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[17].z, _516);
    float _584 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[25].z, _430);
    float _586 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[30].z, _526);
    float _588 = 0.0 + _580;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    if (!_508)
    {
        float _592 = _458 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _552 = _592;
    }
    float _594 = _552;
    float _596 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[33].z, _530);
    float _598 = _468 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _600 = _598;
    if (!_508)
    {
        float _602 = _582 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _576 = _602;
    }
    float _604 = _576;
    if (_542)
    {
        float _606 = _492 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _600 = _606;
    }
    float _608 = _600;
    float _610 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[27].z, _432);
    float _612 = rint(_520);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    uint _618 = clamp(_616, 0u, 65535u);
    float _620 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[29].z, _403);
    float _622 = _608;
    if (!_574)
    {
        float _624 = _584 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _622 = _624;
    }
    float _626 = _622;
    float _628 = _586 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _630 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[32].z, _440);
    float _632 = _628;
    if (_542)
    {
        float _634 = _596 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _632 = _634;
    }
    float _636 = _632;
    float _638 = _636;
    if (!_574)
    {
        float _640 = _610 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _638 = _640;
    }
    float _642 = _638;
    float _644 = _309 + _307;
    float _646 = _620 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _648 = _646;
    if (_542)
    {
        float _650 = _630 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _648 = _650;
    }
    float _652 = _648;
    float _654 = _644 + _311;
    float _656 = _654 + _313;
    float _658 = _656 + _315;
    float _660 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].z, _528);
    float _662 = _658 + _317;
    float _664 = _662 + _319;
    float _666 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _668 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _670 = _664 + _321;
    float _672 = fma(_590, _666, _594);
    float _674 = -_666;
    float _676 = fma(_590, _674, _594);
    float _678 = fma(_590, _668, _604);
    float3 _1972 = float3(_672, _604, float(int(_564)));
    float3 _1974 = select(_1972, float3(0.0), isnan(_1972));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1974.xy, uint(rint(_1974.z)), _590);
    float _682 = -_668;
    float _684 = fma(_590, _682, _604);
    float3 _1989 = float3(_594, _678, float(int(_564)));
    float3 _1991 = select(_1989, float3(0.0), isnan(_1989));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1991.xy, uint(rint(_1991.z)), _590);
    float3 _2000 = float3(_676, _678, float(int(_564)));
    float3 _2002 = select(_2000, float3(0.0), isnan(_2000));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2002.xy, uint(rint(_2002.z)), _590);
    float3 _2011 = float3(_672, _678, float(int(_564)));
    float3 _2013 = select(_2011, float3(0.0), isnan(_2011));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2013.xy, uint(rint(_2013.z)), _590);
    float3 _2022 = float3(_594, _604, float(int(_564)));
    float3 _2024 = select(_2022, float3(0.0), isnan(_2022));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2024.xy, uint(rint(_2024.z)), _590);
    float3 _2033 = float3(_676, _604, float(int(_564)));
    float3 _2035 = select(_2033, float3(0.0), isnan(_2033));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2035.xy, uint(rint(_2035.z)), _590);
    float3 _2044 = float3(_672, _684, float(int(_564)));
    float3 _2046 = select(_2044, float3(0.0), isnan(_2044));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2046.xy, uint(rint(_2046.z)), _590);
    float3 _2055 = float3(_594, _684, float(int(_564)));
    float3 _2057 = select(_2055, float3(0.0), isnan(_2055));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2057.xy, uint(rint(_2057.z)), _590);
    float _700 = _652;
    if (!_574)
    {
        float _702 = _660 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _700 = _702;
    }
    float _704 = _700;
    float _706 = _670 + _323;
    float _708 = 0.0 + _642;
    float _710 = precise::clamp(_708, 0.0, 1.0);
    float _712 = fma(_668, _710, _704);
    float _714 = fma(_666, _710, _626);
    float _716 = -_666;
    float _718 = fma(_716, _710, _626);
    float3 _2098 = float3(_676, _684, float(int(_564)));
    float3 _2100 = select(_2098, float3(0.0), isnan(_2098));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2100.xy, uint(rint(_2100.z)), _590);
    float3 _2109 = float3(_626, _712, float(int(_618)));
    float3 _2111 = select(_2109, float3(0.0), isnan(_2109));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2111.xy, uint(rint(_2111.z)), _710);
    float3 _2120 = float3(_714, _712, float(int(_618)));
    float3 _2122 = select(_2120, float3(0.0), isnan(_2120));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2122.xy, uint(rint(_2122.z)), _710);
    float3 _2131 = float3(_718, _712, float(int(_618)));
    float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2133.xy, uint(rint(_2133.z)), _710);
    float3 _2142 = float3(_714, _704, float(int(_618)));
    float3 _2144 = select(_2142, float3(0.0), isnan(_2142));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2144.xy, uint(rint(_2144.z)), _710);
    float _730 = -_668;
    float _732 = fma(_730, _710, _704);
    float3 _2159 = float3(_626, _704, float(int(_618)));
    float3 _2161 = select(_2159, float3(0.0), isnan(_2159));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2161.xy, uint(rint(_2161.z)), _710);
    float3 _2170 = float3(_718, _704, float(int(_618)));
    float3 _2172 = select(_2170, float3(0.0), isnan(_2170));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2172.xy, uint(rint(_2172.z)), _710);
    float3 _2181 = float3(_714, _732, float(int(_618)));
    float3 _2183 = select(_2181, float3(0.0), isnan(_2181));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2183.xy, uint(rint(_2183.z)), _710);
    float3 _2192 = float3(_626, _732, float(int(_618)));
    float3 _2194 = select(_2192, float3(0.0), isnan(_2192));
    float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2194.xy, uint(rint(_2194.z)), _710);
    float3 _2203 = float3(_718, _732, float(int(_618)));
    float3 _2205 = select(_2203, float3(0.0), isnan(_2203));
    float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2205.xy, uint(rint(_2205.z)), _710);
    float2 _2211 = float2(_54, _56);
    float _744 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2211, float2(0.0), isnan(_2211))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2211, float2(0.0), isnan(_2211))).x;
    float _746 = -_202;
    float _748 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _750 = _746 + _748;
    float _752 = _750 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _754 = precise::clamp(_752, 0.0, 1.0);
    float _756 = fma(_706, 0.111111111938953399658203125, _754);
    float _758 = _690 + _686;
    float _760 = _758 + _688;
    float _762 = _760 + _680;
    float _764 = _762 + _692;
    float _766 = _764 + _694;
    float _768 = _766 + _696;
    float _770 = _768 + _698;
    float _772 = _724 + _722;
    float _774 = _770 + _720;
    float _776 = _772 + _726;
    float _778 = _774 * 0.111111111938953399658203125;
    float _780 = _776 + _728;
    float _782 = _780 + _734;
    float _784 = _782 + _736;
    float _786 = -_202;
    float _788 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _790 = _786 + _788;
    float _792 = _784 + _738;
    float _794 = _790 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _796 = precise::clamp(_794, 0.0, 1.0);
    float _798 = _792 + _740;
    float _800 = _798 + _742;
    float _802 = _800 * 0.111111111938953399658203125;
    float _804 = _802 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _806 = fma(_778, (*spvDescriptorSet0.fp_c3)._m0[49].z, _804);
    float _808 = _796 + _806;
    out.m_47.x = _744;
    out.m_47.y = _756;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _808;
    return out;
}

