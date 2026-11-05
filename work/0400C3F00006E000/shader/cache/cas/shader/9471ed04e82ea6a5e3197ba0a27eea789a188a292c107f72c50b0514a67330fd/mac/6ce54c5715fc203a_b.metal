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
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _642 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_642, float2(0.0), isnan(_642))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = _64 * _58;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _72);
    float _80 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _82 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _84 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _78);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _88 = _82 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _90 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _98 = 1.0 / _88;
    float _100 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _96);
    float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _104 = _102 * _98;
    float _106 = _94 * _98;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _92 * _98;
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _116 = fma(_108, _112, _104);
    float _118 = -_112;
    float _120 = fma(_108, _118, _104);
    float _122 = fma(_108, _114, _110);
    float _124 = -_114;
    float _126 = fma(_108, _124, _110);
    float3 _798 = float3(_116, _122, float(0));
    float3 _802 = select(_798, float3(0.0), isnan(_798));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _802.xy, uint(rint(_802.z)), _108);
    float3 _809 = float3(_104, _122, float(0));
    float3 _811 = select(_809, float3(0.0), isnan(_809));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _811.xy, uint(rint(_811.z)), _108);
    float3 _818 = float3(_120, _122, float(0));
    float3 _820 = select(_818, float3(0.0), isnan(_818));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _820.xy, uint(rint(_820.z)), _108);
    float3 _827 = float3(_116, _110, float(0));
    float3 _829 = select(_827, float3(0.0), isnan(_827));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _829.xy, uint(rint(_829.z)), _108);
    float3 _836 = float3(_104, _110, float(0));
    float3 _838 = select(_836, float3(0.0), isnan(_836));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _838.xy, uint(rint(_838.z)), _108);
    float3 _845 = float3(_120, _110, float(0));
    float3 _847 = select(_845, float3(0.0), isnan(_845));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _847.xy, uint(rint(_847.z)), _108);
    float3 _854 = float3(_116, _126, float(0));
    float3 _856 = select(_854, float3(0.0), isnan(_854));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _856.xy, uint(rint(_856.z)), _108);
    float3 _863 = float3(_104, _126, float(0));
    float3 _865 = select(_863, float3(0.0), isnan(_863));
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _865.xy, uint(rint(_865.z)), _108);
    float3 _872 = float3(_120, _126, float(0));
    float3 _874 = select(_872, float3(0.0), isnan(_872));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _874.xy, uint(rint(_874.z)), _108);
    float _146 = -_66;
    float _148 = _146 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _150 = -_66;
    float _152 = _150 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _154 = -_68;
    float _156 = _154 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _158 = -_68;
    float _160 = _158 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _162 = _148 * _148;
    float _164 = _152 * _152;
    float _166 = -_64;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _170 = fma(_156, _156, _162);
    float _172 = fma(_160, _160, _164);
    float _174 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _176 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _178 = fma(_168, _168, _170);
    float _180 = -_64;
    float _182 = _180 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _184 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _186 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _188 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _190 = fma(_182, _182, _172);
    float _192 = sqrt(_178);
    float _194 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _196 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _198 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _186);
    float _200 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _174);
    float _202 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _176);
    float _204 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _206 = sqrt(_190);
    float _208 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _210 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _212 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _214 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _216 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _188);
    float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _194);
    float _220 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _196);
    bool _224 = _192 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _226 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _202);
    bool _228 = _192 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _230 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _232 = !_224;
    int _235 = _232 ? 0 : 1;
    float _237 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _198);
    float _239 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _200);
    float _241 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _218);
    bool _243 = _206 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _245 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _216);
    bool _247 = _206 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _249 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _251 = !_243;
    int _253 = _251 ? 0 : 1;
    float _255 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _220);
    int _257 = 2;
    int _259 = 2;
    if (!_224)
    {
        _257 = 1;
    }
    int _261 = _257;
    float _263 = _239 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    int _265 = _261;
    float _267 = _263;
    if (!_228)
    {
        _265 = _235;
    }
    int _269 = _265;
    float _271 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _273 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _208);
    float _275 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _210);
    float _277 = float(_269);
    float _279 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _249);
    if (!_243)
    {
        _259 = 1;
    }
    int _281 = _259;
    float _283 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _214);
    float _285 = precise::min(_277, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _287 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _204);
    int _289 = _281;
    if (!_247)
    {
        _289 = _253;
    }
    int _291 = _289;
    float _293 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    bool _295 = _285 != 1.0;
    bool _297 = isnan(_285);
    bool _299 = _295 || _297;
    bool _301 = isnan(1.0);
    bool _303 = _299 || _301;
    float _305 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _230);
    bool _307 = _285 != 0.0;
    bool _309 = isnan(_285);
    bool _311 = _307 || _309;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    float _317 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _293);
    float _319 = float(_291);
    float _321 = rint(_285);
    float _323 = precise::max(_321, 0.0);
    uint _326 = uint(_323);
    uint _328 = clamp(_326, 0u, 65535u);
    float _330 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _273);
    float _332 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _275);
    float _334 = precise::min(_319, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _336 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _283);
    float _338 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _305);
    float _340 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _287);
    bool _342 = _334 != 1.0;
    bool _344 = isnan(_334);
    bool _346 = _342 || _344;
    bool _348 = isnan(1.0);
    bool _350 = _346 || _348;
    float _352 = _332 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _354 = _330 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _356 = _354;
    float _358 = _352;
    if (_350)
    {
        float _360 = _338 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _356 = _360;
    }
    float _362 = _356;
    float _364 = _128 + _130;
    float _366 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _368 = _364 + _132;
    float _370 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _372 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _366);
    float _374 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _184);
    float _376 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _271);
    float _378 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _370);
    float _380 = _368 + _134;
    float _382 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _374);
    float _384 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _376);
    float _386 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _378);
    float _388 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _212);
    float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _392 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _317);
    float _394 = _226 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _396 = _237 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _398 = _380 + _136;
    float _400 = _394;
    float _402 = _396;
    float _404 = _390;
    float _406 = _362;
    if (_303)
    {
        float _408 = _241 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _400 = _408;
    }
    float _410 = _400;
    float _412 = _410;
    if (_303)
    {
        float _414 = _245 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _402 = _414;
    }
    float _416 = _402;
    float _418 = _416;
    if (_303)
    {
        float _420 = _386 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _267 = _420;
    }
    float _422 = _267;
    float _424 = _422;
    if (!_315)
    {
        float _426 = _392 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _412 = _426;
    }
    float _428 = _412;
    if (!_315)
    {
        float _430 = _255 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _418 = _430;
    }
    float _432 = _418;
    if (!_315)
    {
        float _434 = _384 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _424 = _434;
    }
    float _436 = _424;
    bool _438 = _334 != 0.0;
    bool _440 = isnan(_334);
    bool _442 = _438 || _440;
    bool _444 = isnan(0.0);
    bool _446 = _442 || _444;
    float _448 = _398 + _138;
    float _450 = 0.0 + _428;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _456 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _458 = _448 + _140;
    float _460 = rint(_334);
    float _462 = precise::max(_460, 0.0);
    uint _464 = uint(_462);
    uint _466 = clamp(_464, 0u, 65535u);
    float _468 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _388);
    float _470 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _279);
    float _472 = _458 + _142;
    float _474 = fma(_452, _454, _432);
    float _476 = -_454;
    float _478 = fma(_452, _476, _432);
    float _480 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _372);
    float _482 = fma(_452, _456, _436);
    if (_350)
    {
        float _484 = _336 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _404 = _484;
    }
    float _486 = _404;
    float _488 = _486;
    if (_350)
    {
        float _490 = _468 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _358 = _490;
    }
    float _492 = _358;
    float _494 = _492;
    if (!_446)
    {
        float _496 = _340 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _488 = _496;
    }
    float _498 = _488;
    float3 _1520 = float3(_474, _436, float(int(_328)));
    float3 _1522 = select(_1520, float3(0.0), isnan(_1520));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1522.xy, uint(rint(_1522.z)), _452);
    float3 _1531 = float3(_432, _482, float(int(_328)));
    float3 _1533 = select(_1531, float3(0.0), isnan(_1531));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1533.xy, uint(rint(_1533.z)), _452);
    float3 _1542 = float3(_478, _482, float(int(_328)));
    float3 _1544 = select(_1542, float3(0.0), isnan(_1542));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1544.xy, uint(rint(_1544.z)), _452);
    float3 _1553 = float3(_474, _482, float(int(_328)));
    float3 _1555 = select(_1553, float3(0.0), isnan(_1553));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1555.xy, uint(rint(_1555.z)), _452);
    if (!_446)
    {
        float _508 = _480 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _406 = _508;
    }
    float _510 = _406;
    float _512 = -_456;
    float _514 = fma(_452, _512, _436);
    float3 _1580 = float3(_432, _436, float(int(_328)));
    float3 _1582 = select(_1580, float3(0.0), isnan(_1580));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1582.xy, uint(rint(_1582.z)), _452);
    float3 _1591 = float3(_478, _436, float(int(_328)));
    float3 _1593 = select(_1591, float3(0.0), isnan(_1591));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1593.xy, uint(rint(_1593.z)), _452);
    float3 _1602 = float3(_474, _514, float(int(_328)));
    float3 _1604 = select(_1602, float3(0.0), isnan(_1602));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1604.xy, uint(rint(_1604.z)), _452);
    if (!_446)
    {
        float _522 = _470 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _494 = _522;
    }
    float _524 = _494;
    float _526 = _472 + _144;
    float _528 = 0.0 + _498;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = fma(_456, _530, _524);
    float _534 = fma(_454, _530, _510);
    float3 _1638 = float3(_432, _514, float(int(_328)));
    float3 _1640 = select(_1638, float3(0.0), isnan(_1638));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1640.xy, uint(rint(_1640.z)), _452);
    float _538 = -_454;
    float _540 = fma(_538, _530, _510);
    float3 _1655 = float3(_478, _514, float(int(_328)));
    float3 _1657 = select(_1655, float3(0.0), isnan(_1655));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1657.xy, uint(rint(_1657.z)), _452);
    float3 _1666 = float3(_510, _532, float(int(_466)));
    float3 _1668 = select(_1666, float3(0.0), isnan(_1666));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1668.xy, uint(rint(_1668.z)), _530);
    float3 _1677 = float3(_534, _532, float(int(_466)));
    float3 _1679 = select(_1677, float3(0.0), isnan(_1677));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1679.xy, uint(rint(_1679.z)), _530);
    float3 _1688 = float3(_540, _532, float(int(_466)));
    float3 _1690 = select(_1688, float3(0.0), isnan(_1688));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1690.xy, uint(rint(_1690.z)), _530);
    float3 _1699 = float3(_534, _524, float(int(_466)));
    float3 _1701 = select(_1699, float3(0.0), isnan(_1699));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1701.xy, uint(rint(_1701.z)), _530);
    float _552 = -_456;
    float _554 = fma(_552, _530, _524);
    float3 _1716 = float3(_510, _524, float(int(_466)));
    float3 _1718 = select(_1716, float3(0.0), isnan(_1716));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1718.xy, uint(rint(_1718.z)), _530);
    float3 _1727 = float3(_540, _524, float(int(_466)));
    float3 _1729 = select(_1727, float3(0.0), isnan(_1727));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1729.xy, uint(rint(_1729.z)), _530);
    float3 _1738 = float3(_534, _554, float(int(_466)));
    float3 _1740 = select(_1738, float3(0.0), isnan(_1738));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1740.xy, uint(rint(_1740.z)), _530);
    float3 _1749 = float3(_510, _554, float(int(_466)));
    float3 _1751 = select(_1749, float3(0.0), isnan(_1749));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1751.xy, uint(rint(_1751.z)), _530);
    float3 _1760 = float3(_540, _554, float(int(_466)));
    float3 _1762 = select(_1760, float3(0.0), isnan(_1760));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1762.xy, uint(rint(_1762.z)), _530);
    float2 _1768 = float2(_50, _52);
    float _566 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1768, float2(0.0), isnan(_1768))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1768, float2(0.0), isnan(_1768))).x;
    float _568 = -_64;
    float _570 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _572 = _568 + _570;
    float _574 = _572 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _576 = precise::clamp(_574, 0.0, 1.0);
    float _578 = -_64;
    float _580 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _582 = _578 + _580;
    float _584 = fma(_526, 0.111111111938953399658203125, _576);
    float _586 = _582 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = _506 + _502;
    float _592 = _590 + _504;
    float _594 = _592 + _500;
    float _596 = _594 + _516;
    float _598 = _596 + _518;
    float _600 = _598 + _520;
    float _602 = _600 + _536;
    float _604 = _602 + _542;
    float _606 = _546 + _544;
    float _608 = _604 * 0.111111111938953399658203125;
    float _610 = _606 + _548;
    float _612 = _610 + _550;
    float _614 = _612 + _556;
    float _616 = _614 + _558;
    float _618 = _616 + _560;
    float _620 = _618 + _562;
    float _622 = _620 + _564;
    float _624 = _622 * 0.111111111938953399658203125;
    float _626 = _624 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _628 = fma(_608, (*spvDescriptorSet0.fp_c3)._m0[49].z, _626);
    float _630 = _588 + _628;
    out.m_43.x = _566;
    out.m_43.y = _584;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _630;
    return out;
}

