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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1062 = false;
    bool _786 = false;
    bool _644 = false;
    bool _356 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2268 = as_type<float>(_104);
        out.gl_Position.z = _2268;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2336 = as_type<float>(_140);
        out.gl_Position.z = _2336;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = _144 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _152 = _144 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _156 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _150);
    float _158 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _152);
    float _160 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].z, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].z, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].z, _160);
    bool _168 = !_148;
    float _186;
    if (!_168)
    {
        float _170 = in.m_51.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_88);
        float _192 = 1.0 / _190;
        float _194 = _122 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    bool _214 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_196);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = 1.0 / _228;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _238 = 1.0 / _232;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _240;
    float _244 = _200 * _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _196 + _246;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_212;
    float _264 = _262 + 1.0;
    float _266 = fma(_242, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _248 * _238;
    float _284 = _224 * _272;
    float _286 = fma(_276, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_280, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = -_224;
    float _292 = _290 + 1.0;
    float _294 = _266 * _284;
    float _296 = _286 * _284;
    float _298 = _288 * _284;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _312 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _314 = fma(_302, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_306, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_310, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _320 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _322 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _324 = fma(_314, _268, _312);
    float _326 = fma(_316, _268, _320);
    float _328 = fma(_318, _268, _322);
    float _330 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].x, _324);
    float _332 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].y, _326);
    float _334 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].z, _328);
    bool _336 = !_236;
    float _354;
    if (!_336)
    {
        float _338 = in.m_51.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_88);
        float _360 = 1.0 / _358;
        float _362 = _122 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_53.x;
    float _368 = in.m_53.y;
    float _370 = in.m_53.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _374 = _364 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _392 = 1.0 / _378;
    bool _394 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _396 = 1.0 / _382;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _400 = _364 + _398;
    float _402 = 1.0 / _390;
    float _404 = _400 * _392;
    float _406 = _332 * _368;
    bool _408 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _410 = isnan(_364);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _422 = _364 + _420;
    bool _424 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _426 = isnan(_364);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _334 * _370;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _440 = _364 + _438;
    float _442 = 1.0 / _386;
    float _444 = _422 * _396;
    float _446 = -_418;
    float _448 = _446 + 1.0;
    float _450 = _330 * _366;
    bool _452 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _454 = isnan(_364);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = _434 * _448;
    float _466 = -_434;
    float _468 = _466 + 1.0;
    float _470 = _374 * _402;
    bool _472 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_364);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _484;
    float _488 = -_482;
    float _490 = _488 + 1.0;
    float _492 = _482 * _468;
    float _494 = _440 * _442;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _500;
    float _504 = fma(_486, _404, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _510 = fma(_498, _404, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_502, _404, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _514 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _516 = isnan(_364);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _462 * _490;
    float _528 = -_462;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = fma(_508, _444, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _542 = _524 * _530;
    float _544 = fma(_534, _444, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _546 = fma(_538, _444, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = -_524;
    float _550 = _548 + 1.0;
    float _552 = _510 * _542;
    float _554 = _512 * _542;
    float _556 = _504 * _542;
    float _558 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].x, _552);
    float _560 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].y, _554);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _562;
    float _566 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _572;
    float _576 = fma(_544, _526, _558);
    float _578 = fma(_540, _526, _560);
    float _580 = fma(_546, _526, _566);
    float _582 = fma(_570, _494, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _584 = fma(_564, _494, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _586 = fma(_574, _494, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _600 = fma(_582, _492, _576);
    float _602 = fma(_590, _470, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _604 = fma(_594, _470, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _606 = fma(_598, _470, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _608 = fma(_584, _492, _578);
    float _610 = fma(_586, _492, _580);
    float _612 = fma(_602, _464, _600);
    float _614 = fma(_604, _464, _608);
    float _616 = fma(_606, _464, _610);
    float _618 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[111].x, _612);
    float _620 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[111].y, _614);
    float _622 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[111].z, _616);
    bool _624 = !_394;
    float _642;
    if (!_624)
    {
        float _626 = in.m_51.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_88);
        float _648 = 1.0 / _646;
        float _650 = _122 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _658 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = isnan(_652);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _676 = isnan(_652);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _656;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _688;
    float _692 = -_668;
    float _694 = _692 + 1.0;
    bool _696 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _698 = isnan(_652);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    bool _708 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _710 = _684 * _694;
    float _712 = -_684;
    float _714 = _712 + 1.0;
    float _716 = 1.0 / _672;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _722 = _690 * _686;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _652 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _730 = _652 + _728;
    float _732 = fma(_722, _726, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = _720 * _716;
    float _740 = _732 * _710;
    float _742 = _668 * _736;
    float _744 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = fma(_738, _730, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _748 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[115].x, _740);
    float _750 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _752 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = fma(_746, _742, _748);
    float _756 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[117].x, _754);
    float _762 = _756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _762;
    out.m_55.y = _752;
    out.m_55.z = _758;
    out.m_55.w = _764;
    bool _766 = !_708;
    float _784;
    if (!_766)
    {
        float _768 = in.m_51.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_88);
        float _790 = 1.0 / _788;
        float _792 = _122 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _798 = _794 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _802 = _794 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _816;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _824 = 1.0 / _814;
    bool _826 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _828 = isnan(_794);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = 1.0 / _810;
    bool _840 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _842 = isnan(_794);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    bool _852 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _854 = 1.0 / _818;
    float _856 = 1.0 / _822;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _860 = _794 + _858;
    float _862 = _798 * _838;
    bool _864 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _866 = isnan(_794);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _876;
    float _880 = _802 * _854;
    float _882 = _860 * _824;
    bool _884 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _886 = isnan(_794);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -_874;
    float _898 = _896 + 1.0;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _900;
    float _904 = fma(_878, _880, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _906 = _894 * _898;
    float _908 = _806 * _856;
    float _910 = -_894;
    float _912 = _910 + 1.0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _914;
    float _918 = -_850;
    float _920 = _918 + 1.0;
    float _922 = fma(_902, _880, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _924 = _850 * _912;
    float _926 = fma(_916, _880, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _932 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _934 = isnan(_794);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = _836 * _920;
    float _946 = -_836;
    float _948 = _946 + 1.0;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _958 = fma(_930, _908, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _960 = _942 * _948;
    float _962 = -_942;
    float _964 = _962 + 1.0;
    float _966 = fma(_952, _908, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _968 = fma(_956, _908, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _970 = _922 * _960;
    float _972 = _926 * _960;
    float _974 = _904 * _960;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _984;
    float _988 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].x, _970);
    float _990 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].y, _972);
    float _992 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].z, _974);
    float _994 = fma(_978, _862, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _996 = fma(_982, _862, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _998 = fma(_986, _862, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1000 = fma(_966, _944, _988);
    float _1002 = fma(_958, _944, _990);
    float _1004 = fma(_968, _944, _992);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1018 = fma(_994, _924, _1000);
    float _1020 = fma(_1008, _882, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1022 = fma(_1012, _882, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1024 = fma(_996, _924, _1002);
    float _1026 = fma(_1016, _882, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1028 = fma(_998, _924, _1004);
    float _1030 = fma(_1020, _906, _1018);
    float _1032 = fma(_1022, _906, _1024);
    float _1034 = fma(_1026, _906, _1028);
    float _1036 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1030);
    float _1038 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1032);
    float _1040 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1034);
    bool _1042 = !_852;
    float _1060;
    if (!_1042)
    {
        float _1044 = in.m_51.x;
        float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1048 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1052 = _1050 * _1046;
        float _1054 = floor(_1052);
        float _1056 = -_1054;
        float _1058 = _1052 + _1056;
        _1060 = _1058;
        _1062 = true;
    }
    else
    {
        float _1064 = float(_88);
        float _1066 = 1.0 / _1064;
        float _1068 = _122 * _1066;
        _1060 = _1068;
    }
    _1062 = false;
    float _1070 = _1060;
    float _1072 = in.m_42.x;
    float _1074 = in.m_42.y;
    float _1076 = in.m_42.z;
    float _1078 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1080 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1082);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1084);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1086);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1088);
    float _1096 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1090);
    float _1098 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1092);
    float _1100 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1102 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = _1098 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1106 = -_1100;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1110 = -_1102;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = -_1104;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1108 * _1108;
    float _1120 = fma(_1112, _1112, _1118);
    float _1122 = fma(_1116, _1116, _1120);
    float _1124 = rsqrt(_1122);
    float _1126 = _1112 * _1124;
    float _1128 = _1116 * _1124;
    float _1130 = _1108 * _1124;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1134 = _1126 * _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1128 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = _1130 * _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1146 = -_1134;
    float _1148 = fma(_1128, _1144, _1146);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1152 = -_1138;
    float _1154 = fma(_1130, _1150, _1152);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = -_1142;
    float _1160 = fma(_1126, _1156, _1158);
    float _1162 = in.m_57.x;
    float _1164 = in.m_57.y;
    float _1166 = in.m_57.z;
    float _1168 = _1148 * _1148;
    float _1170 = fma(_1154, _1154, _1168);
    float _1172 = fma(_1160, _1160, _1170);
    float _1174 = rsqrt(_1172);
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1162);
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1166);
    float _1182 = _1078 * _1176;
    float _1184 = _1080 * _1180;
    float _1186 = _1154 * _1174;
    float _1188 = _1148 * _1174;
    float _1190 = _1160 * _1174;
    float _1192 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1194 = _1130 * _1186;
    float _1196 = _1128 * _1188;
    float _1198 = _1192 * _1178;
    float _1200 = -_1194;
    float _1202 = fma(_1126, _1188, _1200);
    float _1204 = -_1196;
    float _1206 = fma(_1130, _1190, _1204);
    float _1208 = _1182 * _1202;
    float _1210 = _1182 * _1206;
    float _1212 = fma(_1198, _1190, _1208);
    float _1214 = fma(_1198, _1186, _1210);
    float _1216 = fma(_1184, _1128, _1212);
    float _1218 = fma(_1184, _1126, _1214);
    float _1220 = _1126 * _1190;
    float _1222 = _1104 + _1216;
    float _1224 = _1102 + _1218;
    float _1226 = -_1220;
    float _1228 = fma(_1128, _1186, _1226);
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1232 = _1222 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1236 = _1224 + _1234;
    float _1238 = _1182 * _1228;
    float _1240 = _1232 * _1232;
    float _1242 = fma(_1198, _1188, _1238);
    float _1244 = fma(_1236, _1236, _1240);
    float _1246 = fma(_1184, _1130, _1242);
    float _1248 = sqrt(_1244);
    float _1250 = _1100 + _1246;
    bool _1252 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1184;
    float _1256 = _1246;
    float _1258 = _1240;
    float _1260 = _1102;
    if (!_1252)
    {
        _1254 = _1224;
    }
    float _1262 = _1254;
    float _1264 = _1262;
    if (!_1252)
    {
        _1256 = _1222;
    }
    float _1266 = _1256;
    float _1268 = _1266;
    if (!_1252)
    {
        _1258 = _1250;
    }
    float _1270 = _1258;
    bool _1272 = !_1252;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1248 + _1278;
        float _1282 = rsqrt(_1244);
        float _1284 = _1280 * _1276;
        float _1286 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = _1292 + (-1.0);
        float _1300 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1302 = fma(_1296, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1304 = fma(_1250, _1292, _1300);
        float _1306 = _1282 * _1302;
        float _1308 = fma(_1236, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1310 = fma(_1232, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1274 = _1304;
        _1264 = _1308;
        _1268 = _1310;
    }
    float _1312 = _1274;
    float _1314 = _1264;
    float _1316 = _1268;
    float _1318 = -_1100;
    float _1320 = _1318 + _1312;
    float _1322 = -_1102;
    float _1324 = _1322 + _1314;
    float _1326 = -_1104;
    float _1328 = _1326 + _1316;
    float _1330 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1332 = _1320 * _1320;
    bool _1334 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1336 = isnan(0.5);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1342 = _1338 || _1340;
    float _1344 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1330);
    float _1346 = fma(_1324, _1324, _1332);
    float _1348 = fma(_1328, _1328, _1346);
    float _1350 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1344);
    float _1352 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1354 = sqrt(_1348);
    float _1356 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1358 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1352);
    float _1360 = _1312;
    float _1362 = _1314;
    float _1364 = _1316;
    float _1366 = _1328;
    if (_1342)
    {
        _1260 = 1.0;
    }
    float _1368 = _1260;
    float _1370 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1358);
    float _1372 = 1.0 / _1356;
    float _1374 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1376 = _1374 + _1356;
    bool _1378 = _1354 > 0.0;
    float _1380 = _1376 * _1372;
    float _1382 = _1380 * 0.5;
    bool _1384 = !_1378;
    float _1386 = _1372;
    float _1388 = _1368;
    if (!_1384)
    {
        float _1390 = _164 * _164;
        float _1392 = fma(_162, _162, _1390);
        float _1394 = rsqrt(_1348);
        float _1396 = fma(_166, _166, _1392);
        float _1398 = sqrt(_1396);
        float _1400 = _1324 * _1394;
        float _1402 = _1320 * _1394;
        float _1404 = _1328 * _1394;
        bool _1406 = _1398 > 0.0;
        bool _1408 = !_1406;
        _1386 = _1398;
        if (!_1408)
        {
            float _1410 = rsqrt(_1396);
            float _1412 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1414 = _164 * _1410;
            float _1416 = _162 * _1410;
            float _1418 = _166 * _1410;
            float _1420 = _1402 * _1414;
            float _1422 = fma(_1400, _1416, _1420);
            float _1424 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1426 = fma(_1404, _1418, _1422);
            float _1428 = _1426 * _1424;
            float _1430 = fma(_162, _1428, _1314);
            float _1432 = fma(_164, _1428, _1312);
            float _1434 = fma(_166, _1428, _1316);
            _1360 = _1432;
            _1362 = _1430;
            _1364 = _1434;
            _1386 = _1416;
        }
    }
    float _1436 = _1360;
    float _1438 = _1362;
    float _1440 = _1364;
    float _1442 = _1386;
    float _1444 = _1442;
    if (!_1342)
    {
        float _1446 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1448 = _1446 * 0.15915493667125701904296875;
        float _1450 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1454 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1452);
        float _1456 = _1448 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        float _1460 = _1450 * 0.15915493667125701904296875;
        float _1462 = _1448 * 6.283185482025146484375;
        float _1464 = sin(_1462);
        float _1466 = 1.0 / _1458;
        float _1468 = _1460 * 6.283185482025146484375;
        float _1470 = cos(_1468);
        float _1472 = _1464 * _1466;
        float _1474 = _1460 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = _1470 * _1472;
        float _1480 = 1.0 / _1454;
        float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1484 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1482;
        float _1486 = 1.0 / _1478;
        float _1488 = 1.0 / _1484;
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1492 = _1480 * _1490;
        float _1494 = _1476 * _1486;
        float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1498 = fma(_1494, _1492, _1496);
        float _1500 = _1498 * _1488;
        float _1502 = precise::clamp(_1500, 0.0, 1.0);
        _1444 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1388 = _1502;
    }
    float _1504 = _1444;
    float _1506 = _1388;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1436 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1438 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1440 + _1516;
    float _1520 = _1510 * _1510;
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = fma(_1518, _1518, _1522);
    float _1526 = rsqrt(_1524);
    float _1528 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1530 = _1514 * _1528;
    float _1532 = _1518 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 + _1536;
    float _1540 = sqrt(_1538);
    bool _1542 = _1540 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = _1540 + _1544;
    float _1548 = _1518;
    float _1550 = _1538;
    float _1552 = _1546;
    float _1554 = _1520;
    float _1556 = _1510;
    float _1558 = _1530;
    if (_1542)
    {
        float _1560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1560;
    }
    float _1562 = _1548;
    if (_1542)
    {
        float _1564 = rsqrt(_1538);
        _1550 = _1564;
    }
    float _1566 = _1550;
    if (_1542)
    {
        float _1568 = _1546 * _1562;
        _1552 = _1568;
    }
    float _1570 = _1552;
    if (_1542)
    {
        float _1572 = _1570 * 0.15915493667125701904296875;
        _1554 = _1572;
    }
    float _1574 = _1554;
    float _1576 = _1562;
    float _1578 = _1574;
    if (_1542)
    {
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1588 = precise::max(0.0, _1586);
    float _1590 = _1504;
    float _1592 = _1588;
    if (_1542)
    {
        float _1594 = _1574 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        _1590 = _1596;
    }
    float _1598 = _1590;
    float _1600 = -_1528;
    float _1602 = -_1588;
    float _1604 = fma(_1510, _1600, _1602);
    if (!_1542)
    {
        _1556 = _1532;
    }
    float _1606 = _1556;
    float _1608 = _1606;
    if (_1542)
    {
        float _1610 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1592 = _1610;
    }
    float _1612 = _1592;
    float _1614 = _1584;
    float _1616 = _1612;
    if (_1542)
    {
        float _1618 = fma(_1584, _1612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = _1620;
    float _1624 = _1598;
    if (_1542)
    {
        float _1626 = _1598 + (-1.0);
        _1616 = _1626;
    }
    float _1628 = _1616;
    float _1630 = _1628;
    if (_1542)
    {
        float _1632 = _1566 * _1620;
        _1366 = _1632;
    }
    float _1634 = _1366;
    if (!_1542)
    {
        _1622 = _1604;
    }
    float _1636 = _1622;
    float _1638 = sqrt(_1524);
    float _1640 = _1636;
    if (_1542)
    {
        float _1642 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1642;
    }
    float _1644 = _1578;
    if (_1542)
    {
        float _1646 = _1530 * _1634;
        _1558 = _1646;
    }
    float _1648 = _1558;
    if (!_1542)
    {
        _1630 = _1534;
    }
    float _1650 = _1630;
    float _1652 = _1650;
    if (_1542)
    {
        float _1654 = _1532 * _1634;
        _1608 = _1654;
    }
    float _1656 = _1608;
    if (_1542)
    {
        float _1658 = fma(_1604, _1598, _1644);
        _1640 = _1658;
    }
    float _1660 = _1640;
    if (_1542)
    {
        float _1662 = _1648 * _1648;
        _1652 = _1662;
    }
    float _1664 = _1652;
    if (!_1542)
    {
        _1624 = _1536;
    }
    float _1666 = _1624;
    float _1668 = _1666;
    if (_1542)
    {
        float _1670 = _1656 * _1656;
        _1668 = _1670;
    }
    float _1672 = _1668;
    float _1674 = fma(_1660, _1660, _1664);
    float _1676 = _1674 + _1672;
    float _1678 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1682 = fma(_1638, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1680);
    float _1684 = precise::clamp(_1682, 0.0, 1.0);
    float _1686 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = rsqrt(_1676);
    float _1690 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1678);
    float _1692 = -_1684;
    float _1694 = _1692 + 1.0;
    float _1696 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1698 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1700 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1690);
    float _1702 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1704 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1706 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1698);
    float _1708 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1712 = abs(_1694);
    float _1714 = log2(_1712);
    float _1716 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1718 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1702);
    float _1720 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1710);
    float _1722 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1724 = _1688 * _1648;
    float _1726 = _1688 * _1660;
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1730 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1734 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1718);
    float _1736 = _1688 * _1656;
    float _1738 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1730);
    float _1740 = -_1732;
    float _1742 = fma(_1726, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1740);
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1746 = -_1722;
    float _1748 = fma(_1746, _1704, 1.0);
    float _1750 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1738);
    float _1752 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = -_1736;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1742);
    float _1758 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1750);
    float _1762 = log2(_1748);
    float _1764 = fma(_1756, -0.5, 0.5);
    float _1766 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1770 = fma(_1756, 0.5, 0.5);
    float _1772 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1774 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1768);
    float _1776 = exp2(_1752);
    float _1778 = _1726 + 1.0;
    float _1780 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1772);
    float _1782 = fma(_1770, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1774);
    float _1786 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1780);
    float _1788 = fma(_1770, _1782, -0.212114393711090087890625);
    float _1790 = 1.0 / _1760;
    float _1792 = _1762 * 0.693147182464599609375;
    float _1794 = fma(_1770, _1788, 1.570728778839111328125);
    float _1796 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1798 = sqrt(_1764);
    float _1800 = -_1726;
    float _1802 = fma(_1776, _1778, _1800);
    float _1804 = fma(_1802, 0.5, 0.5);
    float _1806 = _1784 * _1790;
    float _1808 = _1786 * _1790;
    float _1810 = fma(_1806, 0.5, 0.5);
    float _1812 = fma(_1808, -0.5, 0.5);
    float _1814 = _1798 * 0.636619746685028076171875;
    float3 _5071 = float3(_1810, _1812, _1796);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5071, float3(0.0), isnan(_5071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5071, float3(0.0), isnan(_5071)), level(0.0)).x;
    float _1818 = -_1794;
    float _1820 = fma(_1814, _1818, 1.0);
    float3 _5087 = float3(_1810, _1812, _1796);
    float4 _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5087, float3(0.0), isnan(_5087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5087, float3(0.0), isnan(_5087)), level(0.0)).xyzw;
    float _1825 = _1823.x;
    float _1827 = _1823.y;
    float _1829 = _1823.z;
    float _1831 = _1823.w;
    float2 _5104 = float2(_1820, _1804);
    float3 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5104, float2(0.0), isnan(_5104)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5104, float2(0.0), isnan(_5104)), level(0.0)).xyz;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = in.m_51.w;
    float _1845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1847 = in.m_59.y;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1851 = _1849 != 0;
    float _1853 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1857 = _1855 != 0;
    float _1859 = in.m_51.x;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1863 = in.m_51.y;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1867 = _1865 != 0;
    float _1869 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1873 = _1871 != 0;
    float _1875 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1879 = _1877 != 0;
    float _1881 = 0.0;
    if (_1851)
    {
        float _1883 = in.m_51.z;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = exp2(_1853);
    float _1889 = in.m_59.x;
    bool _1891 = _1843 > 0.5;
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1895 = -_1847;
    float _1897 = _1895 + 1.0;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1901 = _1078 * _1847;
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1905 = _1903 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1907 = _1859 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1909 = _1847;
    bool _1911 = _1891;
    float _1913 = _1901;
    if (_1857)
    {
        float _1915 = _1891 ? _1897 : _1847;
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1921 = 1.0 / _1905;
    float _1923 = -_1899;
    float _1925 = fma(_1907, 2.0, _1923);
    bool _1927 = _1863 > 0.5;
    float _1929 = _1907;
    if (!_1867)
    {
        float _1931 = in.m_51.z;
        _1929 = _1931;
    }
    float _1933 = _1929;
    float _1935 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1937 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1893);
    float _1939 = -_1887;
    float _1941 = _1939 + 1.0;
    float _1943 = _1935;
    if (_1851)
    {
        bool _1945 = _1885 > 0.5;
        _1911 = _1945;
    }
    bool _1947 = _1911;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1949;
    float _1953 = -_1901;
    float _1955 = _1953 + 1.0;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1959 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    if (_1879)
    {
        float _1961 = _1927 ? _1955 : _1901;
        _1913 = _1961;
    }
    float _1963 = _1913;
    float _1965 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1967 = _1951 * _1921;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1971 = _1070 + _1969;
    float _1973 = fma(_1935, -2.0, _1957);
    float _1975 = _1921;
    float _1977 = _1971;
    float _1979 = _1967;
    if (!_1867)
    {
        _1943 = _1863;
    }
    float _1981 = _1943;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1985 = fma(_1967, _1971, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1987 = fma(_1965, _1917, -0.5);
    float _1989 = _1981;
    if (!_1851)
    {
        _1975 = _1889;
    }
    float _1991 = _1975;
    float _1993 = fma(_1875, _1963, -0.5);
    float _1995 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1937);
    float _1997 = _1933;
    float _1999 = _1991;
    if (!_1867)
    {
        _1977 = _1933;
    }
    float _2001 = _1977;
    float _2003 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1973);
    float _2005 = _2001;
    if (_1867)
    {
        _2005 = _1863;
    }
    float _2007 = _2005;
    float _2009 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1983);
    if (_1867)
    {
        _1997 = _1863;
    }
    float _2011 = _1997;
    bool _2013 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2015 = isnan(_1070);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    bool _2025 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2027 = isnan(_1070);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2033 = _2029 || _2031;
    float _2035 = float(_2033);
    float _2037 = -_2003;
    float _2039 = fma(_1995, _1993, _2037);
    int _2041 = as_type<int>(_2011);
    if (!_1851)
    {
        _1979 = _1991;
    }
    float _2043 = _1979;
    float _2045 = -_2023;
    float _2047 = _2045 + 1.0;
    float _2049 = _2043;
    if (_1851)
    {
        _1999 = _1889;
    }
    float _2051 = _1999;
    float _2053 = _2035 * _2047;
    if (_1867)
    {
        _1989 = _1859;
    }
    float _2055 = _1989;
    float _2057 = _1192 * _2051;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2061 = _1985 * _2053;
    float _2063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2065 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2059);
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2069 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2073 = -_2035;
    float _2075 = _2073 + 1.0;
    bool _2077 = _1859 > 0.5;
    float _2079 = -_2067;
    float _2081 = fma(_2069, 2.0, _2079);
    float _2083 = fma(_2011, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2071);
    float _2085 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2087 = _2057;
    if (_1851)
    {
        float _2089 = -_2051;
        float _2091 = _2089 + 1.0;
        _2041 = as_type<int>(_2091);
    }
    int _2093 = _2041;
    float _2095 = -_2057;
    float _2097 = _2095 + 1.0;
    float _2099 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2061);
    float _2101 = -_122;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2081);
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1851)
    {
        float _2107 = _1947 ? as_type<float>(_2093) : _2051;
        _2049 = _2107;
    }
    float _2109 = _2049;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_1873)
    {
        float _2113 = _2077 ? _2097 : _2057;
        _2087 = _2113;
    }
    float _2115 = _2087;
    float _2117 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2119 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2009);
    float _2121 = fma(_2085, -2.0, _2111);
    float _2123 = -_122;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1925);
    float _2127 = fma(_2117, _2109, -0.5);
    float _2129 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2099);
    float _2131 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2133 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2135 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2137 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2065);
    float _2139 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2083);
    float _2141 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2121);
    float _2143 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2151 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2153 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1959);
    bool _2155 = _1506 > 0.0;
    bool _2157 = isnan(_1506);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(0.0);
    bool _2163 = _2159 || _2161;
    float _2165 = fma(_2137, _2127, _2103);
    out.m_63.x = _2143;
    out.m_63.y = _2145;
    out.m_63.z = _2147;
    out.m_63.w = _2149;
    float _2167 = fma(_2151, _2115, -0.5);
    float _2169 = -_2141;
    float _2171 = fma(_2139, _1987, _2169);
    float _2173 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2175 = _2153 + _1760;
    float _2177 = fma(_2119, _2167, _2125);
    float _2179 = _2039 + 0.5;
    float _2181 = _2165 + 0.5;
    float _2183 = _2171 + 0.5;
    float _2185 = _2177 + 0.5;
    float _2187 = _2175 * 0.5;
    float _2189 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2191 = _2173 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2185;
    out.m_65.y = _2179;
    out.m_65.z = _2181;
    out.m_65.w = _2183;
    out.gl_Position.x = _1784;
    out.gl_Position.y = _1786;
    out.gl_Position.z = _2153;
    out.gl_Position.w = _1760;
    out.m_67.z = _2187;
    out.m_67.w = _1760;
    out.m_45.x = _2191;
    float _2193 = _2189 * _1816;
    float _2195 = -_2189;
    float _2197 = _2195 + 1.0;
    float _2199 = _1831 * _2193;
    float _2201 = _1831 * _2197;
    float _2203 = _1841 * _2193;
    float _2205 = fma(_1837, _2199, _1825);
    float _2207 = fma(_1839, _2199, _1827);
    float _2209 = fma(_1831, _2203, _1829);
    out.m_69.x = _2205;
    out.m_69.y = _2207;
    out.m_69.z = _2209;
    out.m_69.w = _2201;
    if (_2163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2211 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2211;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1062 = false;
    bool _786 = false;
    bool _644 = false;
    bool _356 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2268 = as_type<float>(_104);
        out.gl_Position.z = _2268;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2336 = as_type<float>(_140);
        out.gl_Position.z = _2336;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = _144 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _152 = _144 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _156 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _150);
    float _158 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _152);
    float _160 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].z, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].z, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].z, _160);
    bool _168 = !_148;
    float _186;
    if (!_168)
    {
        float _170 = in.m_51.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_88);
        float _192 = 1.0 / _190;
        float _194 = _122 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    bool _214 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_196);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = 1.0 / _228;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _238 = 1.0 / _232;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _240;
    float _244 = _200 * _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _196 + _246;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_212;
    float _264 = _262 + 1.0;
    float _266 = fma(_242, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _248 * _238;
    float _284 = _224 * _272;
    float _286 = fma(_276, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_280, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = -_224;
    float _292 = _290 + 1.0;
    float _294 = _266 * _284;
    float _296 = _286 * _284;
    float _298 = _288 * _284;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _312 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _314 = fma(_302, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_306, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_310, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _320 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _322 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _324 = fma(_314, _268, _312);
    float _326 = fma(_316, _268, _320);
    float _328 = fma(_318, _268, _322);
    float _330 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].x, _324);
    float _332 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].y, _326);
    float _334 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].z, _328);
    bool _336 = !_236;
    float _354;
    if (!_336)
    {
        float _338 = in.m_51.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_88);
        float _360 = 1.0 / _358;
        float _362 = _122 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_53.x;
    float _368 = in.m_53.y;
    float _370 = in.m_53.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _374 = _364 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _392 = 1.0 / _378;
    bool _394 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _396 = 1.0 / _382;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _400 = _364 + _398;
    float _402 = 1.0 / _390;
    float _404 = _400 * _392;
    float _406 = _332 * _368;
    bool _408 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _410 = isnan(_364);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _422 = _364 + _420;
    bool _424 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _426 = isnan(_364);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _334 * _370;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _440 = _364 + _438;
    float _442 = 1.0 / _386;
    float _444 = _422 * _396;
    float _446 = -_418;
    float _448 = _446 + 1.0;
    float _450 = _330 * _366;
    bool _452 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _454 = isnan(_364);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = _434 * _448;
    float _466 = -_434;
    float _468 = _466 + 1.0;
    float _470 = _374 * _402;
    bool _472 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_364);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _484;
    float _488 = -_482;
    float _490 = _488 + 1.0;
    float _492 = _482 * _468;
    float _494 = _440 * _442;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _500;
    float _504 = fma(_486, _404, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _510 = fma(_498, _404, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_502, _404, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _514 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _516 = isnan(_364);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _462 * _490;
    float _528 = -_462;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = fma(_508, _444, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _542 = _524 * _530;
    float _544 = fma(_534, _444, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _546 = fma(_538, _444, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = -_524;
    float _550 = _548 + 1.0;
    float _552 = _510 * _542;
    float _554 = _512 * _542;
    float _556 = _504 * _542;
    float _558 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].x, _552);
    float _560 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].y, _554);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _562;
    float _566 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _572;
    float _576 = fma(_544, _526, _558);
    float _578 = fma(_540, _526, _560);
    float _580 = fma(_546, _526, _566);
    float _582 = fma(_570, _494, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _584 = fma(_564, _494, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _586 = fma(_574, _494, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _600 = fma(_582, _492, _576);
    float _602 = fma(_590, _470, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _604 = fma(_594, _470, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _606 = fma(_598, _470, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _608 = fma(_584, _492, _578);
    float _610 = fma(_586, _492, _580);
    float _612 = fma(_602, _464, _600);
    float _614 = fma(_604, _464, _608);
    float _616 = fma(_606, _464, _610);
    float _618 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[111].x, _612);
    float _620 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[111].y, _614);
    float _622 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[111].z, _616);
    bool _624 = !_394;
    float _642;
    if (!_624)
    {
        float _626 = in.m_51.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_88);
        float _648 = 1.0 / _646;
        float _650 = _122 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _658 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = isnan(_652);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _676 = isnan(_652);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _656;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _688;
    float _692 = -_668;
    float _694 = _692 + 1.0;
    bool _696 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _698 = isnan(_652);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    bool _708 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _710 = _684 * _694;
    float _712 = -_684;
    float _714 = _712 + 1.0;
    float _716 = 1.0 / _672;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _722 = _690 * _686;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _652 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _730 = _652 + _728;
    float _732 = fma(_722, _726, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = _720 * _716;
    float _740 = _732 * _710;
    float _742 = _668 * _736;
    float _744 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = fma(_738, _730, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _748 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[115].x, _740);
    float _750 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _752 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = fma(_746, _742, _748);
    float _756 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[117].x, _754);
    float _762 = _756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _762;
    out.m_55.y = _752;
    out.m_55.z = _758;
    out.m_55.w = _764;
    bool _766 = !_708;
    float _784;
    if (!_766)
    {
        float _768 = in.m_51.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_88);
        float _790 = 1.0 / _788;
        float _792 = _122 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _798 = _794 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _802 = _794 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _816;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _824 = 1.0 / _814;
    bool _826 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _828 = isnan(_794);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = 1.0 / _810;
    bool _840 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _842 = isnan(_794);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    bool _852 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _854 = 1.0 / _818;
    float _856 = 1.0 / _822;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _860 = _794 + _858;
    float _862 = _798 * _838;
    bool _864 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _866 = isnan(_794);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _876;
    float _880 = _802 * _854;
    float _882 = _860 * _824;
    bool _884 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _886 = isnan(_794);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -_874;
    float _898 = _896 + 1.0;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _900;
    float _904 = fma(_878, _880, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _906 = _894 * _898;
    float _908 = _806 * _856;
    float _910 = -_894;
    float _912 = _910 + 1.0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _914;
    float _918 = -_850;
    float _920 = _918 + 1.0;
    float _922 = fma(_902, _880, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _924 = _850 * _912;
    float _926 = fma(_916, _880, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _932 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _934 = isnan(_794);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = _836 * _920;
    float _946 = -_836;
    float _948 = _946 + 1.0;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _958 = fma(_930, _908, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _960 = _942 * _948;
    float _962 = -_942;
    float _964 = _962 + 1.0;
    float _966 = fma(_952, _908, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _968 = fma(_956, _908, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _970 = _922 * _960;
    float _972 = _926 * _960;
    float _974 = _904 * _960;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _984;
    float _988 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].x, _970);
    float _990 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].y, _972);
    float _992 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].z, _974);
    float _994 = fma(_978, _862, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _996 = fma(_982, _862, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _998 = fma(_986, _862, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1000 = fma(_966, _944, _988);
    float _1002 = fma(_958, _944, _990);
    float _1004 = fma(_968, _944, _992);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1018 = fma(_994, _924, _1000);
    float _1020 = fma(_1008, _882, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1022 = fma(_1012, _882, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1024 = fma(_996, _924, _1002);
    float _1026 = fma(_1016, _882, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1028 = fma(_998, _924, _1004);
    float _1030 = fma(_1020, _906, _1018);
    float _1032 = fma(_1022, _906, _1024);
    float _1034 = fma(_1026, _906, _1028);
    float _1036 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1030);
    float _1038 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1032);
    float _1040 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1034);
    bool _1042 = !_852;
    float _1060;
    if (!_1042)
    {
        float _1044 = in.m_51.x;
        float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1048 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1052 = _1050 * _1046;
        float _1054 = floor(_1052);
        float _1056 = -_1054;
        float _1058 = _1052 + _1056;
        _1060 = _1058;
        _1062 = true;
    }
    else
    {
        float _1064 = float(_88);
        float _1066 = 1.0 / _1064;
        float _1068 = _122 * _1066;
        _1060 = _1068;
    }
    _1062 = false;
    float _1070 = _1060;
    float _1072 = in.m_42.x;
    float _1074 = in.m_42.y;
    float _1076 = in.m_42.z;
    float _1078 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1080 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1082);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1084);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1086);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1088);
    float _1096 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1090);
    float _1098 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1092);
    float _1100 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1102 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = _1098 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1106 = -_1100;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1110 = -_1102;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = -_1104;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1108 * _1108;
    float _1120 = fma(_1112, _1112, _1118);
    float _1122 = fma(_1116, _1116, _1120);
    float _1124 = rsqrt(_1122);
    float _1126 = _1112 * _1124;
    float _1128 = _1116 * _1124;
    float _1130 = _1108 * _1124;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1134 = _1126 * _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1128 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = _1130 * _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1146 = -_1134;
    float _1148 = fma(_1128, _1144, _1146);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1152 = -_1138;
    float _1154 = fma(_1130, _1150, _1152);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = -_1142;
    float _1160 = fma(_1126, _1156, _1158);
    float _1162 = in.m_57.x;
    float _1164 = in.m_57.y;
    float _1166 = in.m_57.z;
    float _1168 = _1148 * _1148;
    float _1170 = fma(_1154, _1154, _1168);
    float _1172 = fma(_1160, _1160, _1170);
    float _1174 = rsqrt(_1172);
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1162);
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1166);
    float _1182 = _1078 * _1176;
    float _1184 = _1080 * _1180;
    float _1186 = _1154 * _1174;
    float _1188 = _1148 * _1174;
    float _1190 = _1160 * _1174;
    float _1192 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1194 = _1130 * _1186;
    float _1196 = _1128 * _1188;
    float _1198 = _1192 * _1178;
    float _1200 = -_1194;
    float _1202 = fma(_1126, _1188, _1200);
    float _1204 = -_1196;
    float _1206 = fma(_1130, _1190, _1204);
    float _1208 = _1182 * _1202;
    float _1210 = _1182 * _1206;
    float _1212 = fma(_1198, _1190, _1208);
    float _1214 = fma(_1198, _1186, _1210);
    float _1216 = fma(_1184, _1128, _1212);
    float _1218 = fma(_1184, _1126, _1214);
    float _1220 = _1126 * _1190;
    float _1222 = _1104 + _1216;
    float _1224 = _1102 + _1218;
    float _1226 = -_1220;
    float _1228 = fma(_1128, _1186, _1226);
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1232 = _1222 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1236 = _1224 + _1234;
    float _1238 = _1182 * _1228;
    float _1240 = _1232 * _1232;
    float _1242 = fma(_1198, _1188, _1238);
    float _1244 = fma(_1236, _1236, _1240);
    float _1246 = fma(_1184, _1130, _1242);
    float _1248 = sqrt(_1244);
    float _1250 = _1100 + _1246;
    bool _1252 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1184;
    float _1256 = _1246;
    float _1258 = _1240;
    float _1260 = _1102;
    if (!_1252)
    {
        _1254 = _1224;
    }
    float _1262 = _1254;
    float _1264 = _1262;
    if (!_1252)
    {
        _1256 = _1222;
    }
    float _1266 = _1256;
    float _1268 = _1266;
    if (!_1252)
    {
        _1258 = _1250;
    }
    float _1270 = _1258;
    bool _1272 = !_1252;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1248 + _1278;
        float _1282 = rsqrt(_1244);
        float _1284 = _1280 * _1276;
        float _1286 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = _1292 + (-1.0);
        float _1300 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1302 = fma(_1296, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1304 = fma(_1250, _1292, _1300);
        float _1306 = _1282 * _1302;
        float _1308 = fma(_1236, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1310 = fma(_1232, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1274 = _1304;
        _1264 = _1308;
        _1268 = _1310;
    }
    float _1312 = _1274;
    float _1314 = _1264;
    float _1316 = _1268;
    float _1318 = -_1100;
    float _1320 = _1318 + _1312;
    float _1322 = -_1102;
    float _1324 = _1322 + _1314;
    float _1326 = -_1104;
    float _1328 = _1326 + _1316;
    float _1330 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1332 = _1320 * _1320;
    bool _1334 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1336 = isnan(0.5);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1342 = _1338 || _1340;
    float _1344 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1330);
    float _1346 = fma(_1324, _1324, _1332);
    float _1348 = fma(_1328, _1328, _1346);
    float _1350 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1344);
    float _1352 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1354 = sqrt(_1348);
    float _1356 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1358 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1352);
    float _1360 = _1312;
    float _1362 = _1314;
    float _1364 = _1316;
    float _1366 = _1328;
    if (_1342)
    {
        _1260 = 1.0;
    }
    float _1368 = _1260;
    float _1370 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1358);
    float _1372 = 1.0 / _1356;
    float _1374 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1376 = _1374 + _1356;
    bool _1378 = _1354 > 0.0;
    float _1380 = _1376 * _1372;
    float _1382 = _1380 * 0.5;
    bool _1384 = !_1378;
    float _1386 = _1372;
    float _1388 = _1368;
    if (!_1384)
    {
        float _1390 = _164 * _164;
        float _1392 = fma(_162, _162, _1390);
        float _1394 = rsqrt(_1348);
        float _1396 = fma(_166, _166, _1392);
        float _1398 = sqrt(_1396);
        float _1400 = _1324 * _1394;
        float _1402 = _1320 * _1394;
        float _1404 = _1328 * _1394;
        bool _1406 = _1398 > 0.0;
        bool _1408 = !_1406;
        _1386 = _1398;
        if (!_1408)
        {
            float _1410 = rsqrt(_1396);
            float _1412 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1414 = _164 * _1410;
            float _1416 = _162 * _1410;
            float _1418 = _166 * _1410;
            float _1420 = _1402 * _1414;
            float _1422 = fma(_1400, _1416, _1420);
            float _1424 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1426 = fma(_1404, _1418, _1422);
            float _1428 = _1426 * _1424;
            float _1430 = fma(_162, _1428, _1314);
            float _1432 = fma(_164, _1428, _1312);
            float _1434 = fma(_166, _1428, _1316);
            _1360 = _1432;
            _1362 = _1430;
            _1364 = _1434;
            _1386 = _1416;
        }
    }
    float _1436 = _1360;
    float _1438 = _1362;
    float _1440 = _1364;
    float _1442 = _1386;
    float _1444 = _1442;
    if (!_1342)
    {
        float _1446 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1448 = _1446 * 0.15915493667125701904296875;
        float _1450 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1454 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1452);
        float _1456 = _1448 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        float _1460 = _1450 * 0.15915493667125701904296875;
        float _1462 = _1448 * 6.283185482025146484375;
        float _1464 = sin(_1462);
        float _1466 = 1.0 / _1458;
        float _1468 = _1460 * 6.283185482025146484375;
        float _1470 = cos(_1468);
        float _1472 = _1464 * _1466;
        float _1474 = _1460 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = _1470 * _1472;
        float _1480 = 1.0 / _1454;
        float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1484 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1482;
        float _1486 = 1.0 / _1478;
        float _1488 = 1.0 / _1484;
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1492 = _1480 * _1490;
        float _1494 = _1476 * _1486;
        float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1498 = fma(_1494, _1492, _1496);
        float _1500 = _1498 * _1488;
        float _1502 = precise::clamp(_1500, 0.0, 1.0);
        _1444 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1388 = _1502;
    }
    float _1504 = _1444;
    float _1506 = _1388;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1436 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1438 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1440 + _1516;
    float _1520 = _1510 * _1510;
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = fma(_1518, _1518, _1522);
    float _1526 = rsqrt(_1524);
    float _1528 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1530 = _1514 * _1528;
    float _1532 = _1518 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 + _1536;
    float _1540 = sqrt(_1538);
    bool _1542 = _1540 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = _1540 + _1544;
    float _1548 = _1518;
    float _1550 = _1538;
    float _1552 = _1546;
    float _1554 = _1520;
    float _1556 = _1510;
    float _1558 = _1530;
    if (_1542)
    {
        float _1560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1560;
    }
    float _1562 = _1548;
    if (_1542)
    {
        float _1564 = rsqrt(_1538);
        _1550 = _1564;
    }
    float _1566 = _1550;
    if (_1542)
    {
        float _1568 = _1546 * _1562;
        _1552 = _1568;
    }
    float _1570 = _1552;
    if (_1542)
    {
        float _1572 = _1570 * 0.15915493667125701904296875;
        _1554 = _1572;
    }
    float _1574 = _1554;
    float _1576 = _1562;
    float _1578 = _1574;
    if (_1542)
    {
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1588 = precise::max(0.0, _1586);
    float _1590 = _1504;
    float _1592 = _1588;
    if (_1542)
    {
        float _1594 = _1574 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        _1590 = _1596;
    }
    float _1598 = _1590;
    float _1600 = -_1528;
    float _1602 = -_1588;
    float _1604 = fma(_1510, _1600, _1602);
    if (!_1542)
    {
        _1556 = _1532;
    }
    float _1606 = _1556;
    float _1608 = _1606;
    if (_1542)
    {
        float _1610 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1592 = _1610;
    }
    float _1612 = _1592;
    float _1614 = _1584;
    float _1616 = _1612;
    if (_1542)
    {
        float _1618 = fma(_1584, _1612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = _1620;
    float _1624 = _1598;
    if (_1542)
    {
        float _1626 = _1598 + (-1.0);
        _1616 = _1626;
    }
    float _1628 = _1616;
    float _1630 = _1628;
    if (_1542)
    {
        float _1632 = _1566 * _1620;
        _1366 = _1632;
    }
    float _1634 = _1366;
    if (!_1542)
    {
        _1622 = _1604;
    }
    float _1636 = _1622;
    float _1638 = sqrt(_1524);
    float _1640 = _1636;
    if (_1542)
    {
        float _1642 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1642;
    }
    float _1644 = _1578;
    if (_1542)
    {
        float _1646 = _1530 * _1634;
        _1558 = _1646;
    }
    float _1648 = _1558;
    if (!_1542)
    {
        _1630 = _1534;
    }
    float _1650 = _1630;
    float _1652 = _1650;
    if (_1542)
    {
        float _1654 = _1532 * _1634;
        _1608 = _1654;
    }
    float _1656 = _1608;
    if (_1542)
    {
        float _1658 = fma(_1604, _1598, _1644);
        _1640 = _1658;
    }
    float _1660 = _1640;
    if (_1542)
    {
        float _1662 = _1648 * _1648;
        _1652 = _1662;
    }
    float _1664 = _1652;
    if (!_1542)
    {
        _1624 = _1536;
    }
    float _1666 = _1624;
    float _1668 = _1666;
    if (_1542)
    {
        float _1670 = _1656 * _1656;
        _1668 = _1670;
    }
    float _1672 = _1668;
    float _1674 = fma(_1660, _1660, _1664);
    float _1676 = _1674 + _1672;
    float _1678 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1682 = fma(_1638, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1680);
    float _1684 = precise::clamp(_1682, 0.0, 1.0);
    float _1686 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = rsqrt(_1676);
    float _1690 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1678);
    float _1692 = -_1684;
    float _1694 = _1692 + 1.0;
    float _1696 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1698 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1700 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1690);
    float _1702 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1704 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1706 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1698);
    float _1708 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1712 = abs(_1694);
    float _1714 = log2(_1712);
    float _1716 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1718 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1702);
    float _1720 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1710);
    float _1722 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1724 = _1688 * _1648;
    float _1726 = _1688 * _1660;
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1730 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1734 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1718);
    float _1736 = _1688 * _1656;
    float _1738 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1730);
    float _1740 = -_1732;
    float _1742 = fma(_1726, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1740);
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1746 = -_1722;
    float _1748 = fma(_1746, _1704, 1.0);
    float _1750 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1738);
    float _1752 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = -_1736;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1742);
    float _1758 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1750);
    float _1762 = log2(_1748);
    float _1764 = fma(_1756, -0.5, 0.5);
    float _1766 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1770 = fma(_1756, 0.5, 0.5);
    float _1772 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1774 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1768);
    float _1776 = exp2(_1752);
    float _1778 = _1726 + 1.0;
    float _1780 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1772);
    float _1782 = fma(_1770, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1774);
    float _1786 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1780);
    float _1788 = fma(_1770, _1782, -0.212114393711090087890625);
    float _1790 = 1.0 / _1760;
    float _1792 = _1762 * 0.693147182464599609375;
    float _1794 = fma(_1770, _1788, 1.570728778839111328125);
    float _1796 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1798 = sqrt(_1764);
    float _1800 = -_1726;
    float _1802 = fma(_1776, _1778, _1800);
    float _1804 = fma(_1802, 0.5, 0.5);
    float _1806 = _1784 * _1790;
    float _1808 = _1786 * _1790;
    float _1810 = fma(_1806, 0.5, 0.5);
    float _1812 = fma(_1808, -0.5, 0.5);
    float _1814 = _1798 * 0.636619746685028076171875;
    float3 _5071 = float3(_1810, _1812, _1796);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5071, float3(0.0), isnan(_5071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5071, float3(0.0), isnan(_5071)), level(0.0)).x;
    float _1818 = -_1794;
    float _1820 = fma(_1814, _1818, 1.0);
    float3 _5087 = float3(_1810, _1812, _1796);
    float4 _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5087, float3(0.0), isnan(_5087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5087, float3(0.0), isnan(_5087)), level(0.0)).xyzw;
    float _1825 = _1823.x;
    float _1827 = _1823.y;
    float _1829 = _1823.z;
    float _1831 = _1823.w;
    float2 _5104 = float2(_1820, _1804);
    float3 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5104, float2(0.0), isnan(_5104)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5104, float2(0.0), isnan(_5104)), level(0.0)).xyz;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = in.m_51.w;
    float _1845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1847 = in.m_59.y;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1851 = _1849 != 0;
    float _1853 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1857 = _1855 != 0;
    float _1859 = in.m_51.x;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1863 = in.m_51.y;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1867 = _1865 != 0;
    float _1869 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1873 = _1871 != 0;
    float _1875 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1879 = _1877 != 0;
    float _1881 = 0.0;
    if (_1851)
    {
        float _1883 = in.m_51.z;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = exp2(_1853);
    float _1889 = in.m_59.x;
    bool _1891 = _1843 > 0.5;
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1895 = -_1847;
    float _1897 = _1895 + 1.0;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1901 = _1078 * _1847;
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1905 = _1903 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1907 = _1859 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1909 = _1847;
    bool _1911 = _1891;
    float _1913 = _1901;
    if (_1857)
    {
        float _1915 = _1891 ? _1897 : _1847;
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1921 = 1.0 / _1905;
    float _1923 = -_1899;
    float _1925 = fma(_1907, 2.0, _1923);
    bool _1927 = _1863 > 0.5;
    float _1929 = _1907;
    if (!_1867)
    {
        float _1931 = in.m_51.z;
        _1929 = _1931;
    }
    float _1933 = _1929;
    float _1935 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1937 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1893);
    float _1939 = -_1887;
    float _1941 = _1939 + 1.0;
    float _1943 = _1935;
    if (_1851)
    {
        bool _1945 = _1885 > 0.5;
        _1911 = _1945;
    }
    bool _1947 = _1911;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1949;
    float _1953 = -_1901;
    float _1955 = _1953 + 1.0;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1959 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    if (_1879)
    {
        float _1961 = _1927 ? _1955 : _1901;
        _1913 = _1961;
    }
    float _1963 = _1913;
    float _1965 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1967 = _1951 * _1921;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1971 = _1070 + _1969;
    float _1973 = fma(_1935, -2.0, _1957);
    float _1975 = _1921;
    float _1977 = _1971;
    float _1979 = _1967;
    if (!_1867)
    {
        _1943 = _1863;
    }
    float _1981 = _1943;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1985 = fma(_1967, _1971, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1987 = fma(_1965, _1917, -0.5);
    float _1989 = _1981;
    if (!_1851)
    {
        _1975 = _1889;
    }
    float _1991 = _1975;
    float _1993 = fma(_1875, _1963, -0.5);
    float _1995 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1937);
    float _1997 = _1933;
    float _1999 = _1991;
    if (!_1867)
    {
        _1977 = _1933;
    }
    float _2001 = _1977;
    float _2003 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1973);
    float _2005 = _2001;
    if (_1867)
    {
        _2005 = _1863;
    }
    float _2007 = _2005;
    float _2009 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1983);
    if (_1867)
    {
        _1997 = _1863;
    }
    float _2011 = _1997;
    bool _2013 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2015 = isnan(_1070);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    bool _2025 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2027 = isnan(_1070);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2033 = _2029 || _2031;
    float _2035 = float(_2033);
    float _2037 = -_2003;
    float _2039 = fma(_1995, _1993, _2037);
    int _2041 = as_type<int>(_2011);
    if (!_1851)
    {
        _1979 = _1991;
    }
    float _2043 = _1979;
    float _2045 = -_2023;
    float _2047 = _2045 + 1.0;
    float _2049 = _2043;
    if (_1851)
    {
        _1999 = _1889;
    }
    float _2051 = _1999;
    float _2053 = _2035 * _2047;
    if (_1867)
    {
        _1989 = _1859;
    }
    float _2055 = _1989;
    float _2057 = _1192 * _2051;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2061 = _1985 * _2053;
    float _2063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2065 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2059);
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2069 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2073 = -_2035;
    float _2075 = _2073 + 1.0;
    bool _2077 = _1859 > 0.5;
    float _2079 = -_2067;
    float _2081 = fma(_2069, 2.0, _2079);
    float _2083 = fma(_2011, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2071);
    float _2085 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2087 = _2057;
    if (_1851)
    {
        float _2089 = -_2051;
        float _2091 = _2089 + 1.0;
        _2041 = as_type<int>(_2091);
    }
    int _2093 = _2041;
    float _2095 = -_2057;
    float _2097 = _2095 + 1.0;
    float _2099 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2061);
    float _2101 = -_122;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2081);
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1851)
    {
        float _2107 = _1947 ? as_type<float>(_2093) : _2051;
        _2049 = _2107;
    }
    float _2109 = _2049;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_1873)
    {
        float _2113 = _2077 ? _2097 : _2057;
        _2087 = _2113;
    }
    float _2115 = _2087;
    float _2117 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2119 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2009);
    float _2121 = fma(_2085, -2.0, _2111);
    float _2123 = -_122;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1925);
    float _2127 = fma(_2117, _2109, -0.5);
    float _2129 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2099);
    float _2131 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2133 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2135 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2137 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2065);
    float _2139 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2083);
    float _2141 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2121);
    float _2143 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2151 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2153 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1959);
    bool _2155 = _1506 > 0.0;
    bool _2157 = isnan(_1506);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(0.0);
    bool _2163 = _2159 || _2161;
    float _2165 = fma(_2137, _2127, _2103);
    out.m_63.x = _2143;
    out.m_63.y = _2145;
    out.m_63.z = _2147;
    out.m_63.w = _2149;
    float _2167 = fma(_2151, _2115, -0.5);
    float _2169 = -_2141;
    float _2171 = fma(_2139, _1987, _2169);
    float _2173 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2175 = _2153 + _1760;
    float _2177 = fma(_2119, _2167, _2125);
    float _2179 = _2039 + 0.5;
    float _2181 = _2165 + 0.5;
    float _2183 = _2171 + 0.5;
    float _2185 = _2177 + 0.5;
    float _2187 = _2175 * 0.5;
    float _2189 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2191 = _2173 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2185;
    out.m_65.y = _2179;
    out.m_65.z = _2181;
    out.m_65.w = _2183;
    out.gl_Position.x = _1784;
    out.gl_Position.y = _1786;
    out.gl_Position.z = _2153;
    out.gl_Position.w = _1760;
    out.m_67.z = _2187;
    out.m_67.w = _1760;
    out.m_45.x = _2191;
    float _2193 = _2189 * _1816;
    float _2195 = -_2189;
    float _2197 = _2195 + 1.0;
    float _2199 = _1831 * _2193;
    float _2201 = _1831 * _2197;
    float _2203 = _1841 * _2193;
    float _2205 = fma(_1837, _2199, _1825);
    float _2207 = fma(_1839, _2199, _1827);
    float _2209 = fma(_1831, _2203, _1829);
    out.m_69.x = _2205;
    out.m_69.y = _2207;
    out.m_69.z = _2209;
    out.m_69.w = _2201;
    if (_2163)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2211 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2211;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1062 = false;
    bool _786 = false;
    bool _644 = false;
    bool _356 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2268 = as_type<float>(_104);
        out.gl_Position.z = _2268;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2336 = as_type<float>(_140);
        out.gl_Position.z = _2336;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = _144 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _152 = _144 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _156 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _150);
    float _158 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _152);
    float _160 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].z, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].z, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].z, _160);
    bool _168 = !_148;
    float _186;
    if (!_168)
    {
        float _170 = in.m_51.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_88);
        float _192 = 1.0 / _190;
        float _194 = _122 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    bool _214 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_196);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = 1.0 / _228;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _238 = 1.0 / _232;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _240;
    float _244 = _200 * _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _196 + _246;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_212;
    float _264 = _262 + 1.0;
    float _266 = fma(_242, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _248 * _238;
    float _284 = _224 * _272;
    float _286 = fma(_276, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_280, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = -_224;
    float _292 = _290 + 1.0;
    float _294 = _266 * _284;
    float _296 = _286 * _284;
    float _298 = _288 * _284;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _312 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _314 = fma(_302, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_306, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_310, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _320 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _322 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _324 = fma(_314, _268, _312);
    float _326 = fma(_316, _268, _320);
    float _328 = fma(_318, _268, _322);
    float _330 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].x, _324);
    float _332 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].y, _326);
    float _334 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].z, _328);
    bool _336 = !_236;
    float _354;
    if (!_336)
    {
        float _338 = in.m_51.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_88);
        float _360 = 1.0 / _358;
        float _362 = _122 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_53.x;
    float _368 = in.m_53.y;
    float _370 = in.m_53.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _374 = _364 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _392 = 1.0 / _378;
    bool _394 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _396 = 1.0 / _382;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _400 = _364 + _398;
    float _402 = 1.0 / _390;
    float _404 = _400 * _392;
    float _406 = _332 * _368;
    bool _408 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _410 = isnan(_364);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _422 = _364 + _420;
    bool _424 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _426 = isnan(_364);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _334 * _370;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _440 = _364 + _438;
    float _442 = 1.0 / _386;
    float _444 = _422 * _396;
    float _446 = -_418;
    float _448 = _446 + 1.0;
    float _450 = _330 * _366;
    bool _452 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _454 = isnan(_364);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = _434 * _448;
    float _466 = -_434;
    float _468 = _466 + 1.0;
    float _470 = _374 * _402;
    bool _472 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_364);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _484;
    float _488 = -_482;
    float _490 = _488 + 1.0;
    float _492 = _482 * _468;
    float _494 = _440 * _442;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _500;
    float _504 = fma(_486, _404, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _510 = fma(_498, _404, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_502, _404, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _514 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _516 = isnan(_364);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _462 * _490;
    float _528 = -_462;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = fma(_508, _444, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _542 = _524 * _530;
    float _544 = fma(_534, _444, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _546 = fma(_538, _444, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = -_524;
    float _550 = _548 + 1.0;
    float _552 = _510 * _542;
    float _554 = _512 * _542;
    float _556 = _504 * _542;
    float _558 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].x, _552);
    float _560 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].y, _554);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _562;
    float _566 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _572;
    float _576 = fma(_544, _526, _558);
    float _578 = fma(_540, _526, _560);
    float _580 = fma(_546, _526, _566);
    float _582 = fma(_570, _494, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _584 = fma(_564, _494, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _586 = fma(_574, _494, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _600 = fma(_582, _492, _576);
    float _602 = fma(_590, _470, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _604 = fma(_594, _470, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _606 = fma(_598, _470, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _608 = fma(_584, _492, _578);
    float _610 = fma(_586, _492, _580);
    float _612 = fma(_602, _464, _600);
    float _614 = fma(_604, _464, _608);
    float _616 = fma(_606, _464, _610);
    float _618 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[111].x, _612);
    float _620 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[111].y, _614);
    float _622 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[111].z, _616);
    bool _624 = !_394;
    float _642;
    if (!_624)
    {
        float _626 = in.m_51.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_88);
        float _648 = 1.0 / _646;
        float _650 = _122 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _658 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = isnan(_652);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _676 = isnan(_652);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _656;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _688;
    float _692 = -_668;
    float _694 = _692 + 1.0;
    bool _696 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _698 = isnan(_652);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    bool _708 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _710 = _684 * _694;
    float _712 = -_684;
    float _714 = _712 + 1.0;
    float _716 = 1.0 / _672;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _722 = _690 * _686;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _652 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _730 = _652 + _728;
    float _732 = fma(_722, _726, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = _720 * _716;
    float _740 = _732 * _710;
    float _742 = _668 * _736;
    float _744 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = fma(_738, _730, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _748 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[115].x, _740);
    float _750 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _752 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = fma(_746, _742, _748);
    float _756 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[117].x, _754);
    float _762 = _756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _762;
    out.m_55.y = _752;
    out.m_55.z = _758;
    out.m_55.w = _764;
    bool _766 = !_708;
    float _784;
    if (!_766)
    {
        float _768 = in.m_51.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_88);
        float _790 = 1.0 / _788;
        float _792 = _122 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _798 = _794 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _802 = _794 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _816;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _824 = 1.0 / _814;
    bool _826 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _828 = isnan(_794);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = 1.0 / _810;
    bool _840 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _842 = isnan(_794);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    bool _852 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _854 = 1.0 / _818;
    float _856 = 1.0 / _822;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _860 = _794 + _858;
    float _862 = _798 * _838;
    bool _864 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _866 = isnan(_794);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _876;
    float _880 = _802 * _854;
    float _882 = _860 * _824;
    bool _884 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _886 = isnan(_794);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -_874;
    float _898 = _896 + 1.0;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _900;
    float _904 = fma(_878, _880, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _906 = _894 * _898;
    float _908 = _806 * _856;
    float _910 = -_894;
    float _912 = _910 + 1.0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _914;
    float _918 = -_850;
    float _920 = _918 + 1.0;
    float _922 = fma(_902, _880, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _924 = _850 * _912;
    float _926 = fma(_916, _880, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _932 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _934 = isnan(_794);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = _836 * _920;
    float _946 = -_836;
    float _948 = _946 + 1.0;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _958 = fma(_930, _908, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _960 = _942 * _948;
    float _962 = -_942;
    float _964 = _962 + 1.0;
    float _966 = fma(_952, _908, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _968 = fma(_956, _908, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _970 = _922 * _960;
    float _972 = _926 * _960;
    float _974 = _904 * _960;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _984;
    float _988 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].x, _970);
    float _990 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].y, _972);
    float _992 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].z, _974);
    float _994 = fma(_978, _862, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _996 = fma(_982, _862, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _998 = fma(_986, _862, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1000 = fma(_966, _944, _988);
    float _1002 = fma(_958, _944, _990);
    float _1004 = fma(_968, _944, _992);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1018 = fma(_994, _924, _1000);
    float _1020 = fma(_1008, _882, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1022 = fma(_1012, _882, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1024 = fma(_996, _924, _1002);
    float _1026 = fma(_1016, _882, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1028 = fma(_998, _924, _1004);
    float _1030 = fma(_1020, _906, _1018);
    float _1032 = fma(_1022, _906, _1024);
    float _1034 = fma(_1026, _906, _1028);
    float _1036 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1030);
    float _1038 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1032);
    float _1040 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1034);
    bool _1042 = !_852;
    float _1060;
    if (!_1042)
    {
        float _1044 = in.m_51.x;
        float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1048 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1052 = _1050 * _1046;
        float _1054 = floor(_1052);
        float _1056 = -_1054;
        float _1058 = _1052 + _1056;
        _1060 = _1058;
        _1062 = true;
    }
    else
    {
        float _1064 = float(_88);
        float _1066 = 1.0 / _1064;
        float _1068 = _122 * _1066;
        _1060 = _1068;
    }
    _1062 = false;
    float _1070 = _1060;
    float _1072 = in.m_42.x;
    float _1074 = in.m_42.y;
    float _1076 = in.m_42.z;
    float _1078 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1080 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1082);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1084);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1086);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1088);
    float _1096 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1090);
    float _1098 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1092);
    float _1100 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1102 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = _1098 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1106 = -_1100;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1110 = -_1102;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = -_1104;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1108 * _1108;
    float _1120 = fma(_1112, _1112, _1118);
    float _1122 = fma(_1116, _1116, _1120);
    float _1124 = rsqrt(_1122);
    float _1126 = _1112 * _1124;
    float _1128 = _1116 * _1124;
    float _1130 = _1108 * _1124;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1134 = _1126 * _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1128 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = _1130 * _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1146 = -_1134;
    float _1148 = fma(_1128, _1144, _1146);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1152 = -_1138;
    float _1154 = fma(_1130, _1150, _1152);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = -_1142;
    float _1160 = fma(_1126, _1156, _1158);
    float _1162 = in.m_57.x;
    float _1164 = in.m_57.y;
    float _1166 = in.m_57.z;
    float _1168 = _1148 * _1148;
    float _1170 = fma(_1154, _1154, _1168);
    float _1172 = fma(_1160, _1160, _1170);
    float _1174 = rsqrt(_1172);
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1162);
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1166);
    float _1182 = _1078 * _1176;
    float _1184 = _1080 * _1180;
    float _1186 = _1154 * _1174;
    float _1188 = _1148 * _1174;
    float _1190 = _1160 * _1174;
    float _1192 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1194 = _1130 * _1186;
    float _1196 = _1128 * _1188;
    float _1198 = _1192 * _1178;
    float _1200 = -_1194;
    float _1202 = fma(_1126, _1188, _1200);
    float _1204 = -_1196;
    float _1206 = fma(_1130, _1190, _1204);
    float _1208 = _1182 * _1202;
    float _1210 = _1182 * _1206;
    float _1212 = fma(_1198, _1190, _1208);
    float _1214 = fma(_1198, _1186, _1210);
    float _1216 = fma(_1184, _1128, _1212);
    float _1218 = fma(_1184, _1126, _1214);
    float _1220 = _1126 * _1190;
    float _1222 = _1104 + _1216;
    float _1224 = _1102 + _1218;
    float _1226 = -_1220;
    float _1228 = fma(_1128, _1186, _1226);
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1232 = _1222 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1236 = _1224 + _1234;
    float _1238 = _1182 * _1228;
    float _1240 = _1232 * _1232;
    float _1242 = fma(_1198, _1188, _1238);
    float _1244 = fma(_1236, _1236, _1240);
    float _1246 = fma(_1184, _1130, _1242);
    float _1248 = sqrt(_1244);
    float _1250 = _1100 + _1246;
    bool _1252 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1184;
    float _1256 = _1246;
    float _1258 = _1240;
    float _1260 = _1102;
    if (!_1252)
    {
        _1254 = _1224;
    }
    float _1262 = _1254;
    float _1264 = _1262;
    if (!_1252)
    {
        _1256 = _1222;
    }
    float _1266 = _1256;
    float _1268 = _1266;
    if (!_1252)
    {
        _1258 = _1250;
    }
    float _1270 = _1258;
    bool _1272 = !_1252;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1248 + _1278;
        float _1282 = rsqrt(_1244);
        float _1284 = _1280 * _1276;
        float _1286 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = _1292 + (-1.0);
        float _1300 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1302 = fma(_1296, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1304 = fma(_1250, _1292, _1300);
        float _1306 = _1282 * _1302;
        float _1308 = fma(_1236, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1310 = fma(_1232, _1306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1274 = _1304;
        _1264 = _1308;
        _1268 = _1310;
    }
    float _1312 = _1274;
    float _1314 = _1264;
    float _1316 = _1268;
    float _1318 = -_1100;
    float _1320 = _1318 + _1312;
    float _1322 = -_1102;
    float _1324 = _1322 + _1314;
    float _1326 = -_1104;
    float _1328 = _1326 + _1316;
    float _1330 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1332 = _1320 * _1320;
    bool _1334 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1336 = isnan(0.5);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1342 = _1338 || _1340;
    float _1344 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1330);
    float _1346 = fma(_1324, _1324, _1332);
    float _1348 = fma(_1328, _1328, _1346);
    float _1350 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1344);
    float _1352 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1354 = sqrt(_1348);
    float _1356 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1358 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1352);
    float _1360 = _1312;
    float _1362 = _1314;
    float _1364 = _1316;
    float _1366 = _1328;
    if (_1342)
    {
        _1260 = 1.0;
    }
    float _1368 = _1260;
    float _1370 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1358);
    float _1372 = 1.0 / _1356;
    float _1374 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1376 = _1374 + _1356;
    bool _1378 = _1354 > 0.0;
    float _1380 = _1376 * _1372;
    float _1382 = _1380 * 0.5;
    bool _1384 = !_1378;
    float _1386 = _1372;
    float _1388 = _1368;
    if (!_1384)
    {
        float _1390 = _164 * _164;
        float _1392 = fma(_162, _162, _1390);
        float _1394 = rsqrt(_1348);
        float _1396 = fma(_166, _166, _1392);
        float _1398 = sqrt(_1396);
        float _1400 = _1324 * _1394;
        float _1402 = _1320 * _1394;
        float _1404 = _1328 * _1394;
        bool _1406 = _1398 > 0.0;
        bool _1408 = !_1406;
        _1386 = _1398;
        if (!_1408)
        {
            float _1410 = rsqrt(_1396);
            float _1412 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1414 = _164 * _1410;
            float _1416 = _162 * _1410;
            float _1418 = _166 * _1410;
            float _1420 = _1402 * _1414;
            float _1422 = fma(_1400, _1416, _1420);
            float _1424 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1426 = fma(_1404, _1418, _1422);
            float _1428 = _1426 * _1424;
            float _1430 = fma(_162, _1428, _1314);
            float _1432 = fma(_164, _1428, _1312);
            float _1434 = fma(_166, _1428, _1316);
            _1360 = _1432;
            _1362 = _1430;
            _1364 = _1434;
            _1386 = _1416;
        }
    }
    float _1436 = _1360;
    float _1438 = _1362;
    float _1440 = _1364;
    float _1442 = _1386;
    float _1444 = _1442;
    if (!_1342)
    {
        float _1446 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1448 = _1446 * 0.15915493667125701904296875;
        float _1450 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1454 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1452);
        float _1456 = _1448 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        float _1460 = _1450 * 0.15915493667125701904296875;
        float _1462 = _1448 * 6.283185482025146484375;
        float _1464 = sin(_1462);
        float _1466 = 1.0 / _1458;
        float _1468 = _1460 * 6.283185482025146484375;
        float _1470 = cos(_1468);
        float _1472 = _1464 * _1466;
        float _1474 = _1460 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = _1470 * _1472;
        float _1480 = 1.0 / _1454;
        float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1484 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1482;
        float _1486 = 1.0 / _1478;
        float _1488 = 1.0 / _1484;
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1492 = _1480 * _1490;
        float _1494 = _1476 * _1486;
        float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1498 = fma(_1494, _1492, _1496);
        float _1500 = _1498 * _1488;
        float _1502 = precise::clamp(_1500, 0.0, 1.0);
        _1444 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1388 = _1502;
    }
    float _1504 = _1444;
    float _1506 = _1388;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1436 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1438 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1440 + _1516;
    float _1520 = _1510 * _1510;
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = fma(_1518, _1518, _1522);
    float _1526 = rsqrt(_1524);
    float _1528 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1530 = _1514 * _1528;
    float _1532 = _1518 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 + _1536;
    float _1540 = sqrt(_1538);
    bool _1542 = _1540 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = _1540 + _1544;
    float _1548 = _1518;
    float _1550 = _1538;
    float _1552 = _1546;
    float _1554 = _1520;
    float _1556 = _1510;
    float _1558 = _1530;
    if (_1542)
    {
        float _1560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1560;
    }
    float _1562 = _1548;
    if (_1542)
    {
        float _1564 = rsqrt(_1538);
        _1550 = _1564;
    }
    float _1566 = _1550;
    if (_1542)
    {
        float _1568 = _1546 * _1562;
        _1552 = _1568;
    }
    float _1570 = _1552;
    if (_1542)
    {
        float _1572 = _1570 * 0.15915493667125701904296875;
        _1554 = _1572;
    }
    float _1574 = _1554;
    float _1576 = _1562;
    float _1578 = _1574;
    if (_1542)
    {
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1588 = precise::max(0.0, _1586);
    float _1590 = _1504;
    float _1592 = _1588;
    if (_1542)
    {
        float _1594 = _1574 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        _1590 = _1596;
    }
    float _1598 = _1590;
    float _1600 = -_1528;
    float _1602 = -_1588;
    float _1604 = fma(_1510, _1600, _1602);
    if (!_1542)
    {
        _1556 = _1532;
    }
    float _1606 = _1556;
    float _1608 = _1606;
    if (_1542)
    {
        float _1610 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1592 = _1610;
    }
    float _1612 = _1592;
    float _1614 = _1584;
    float _1616 = _1612;
    if (_1542)
    {
        float _1618 = fma(_1584, _1612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = _1620;
    float _1624 = _1598;
    if (_1542)
    {
        float _1626 = _1598 + (-1.0);
        _1616 = _1626;
    }
    float _1628 = _1616;
    float _1630 = _1628;
    if (_1542)
    {
        float _1632 = _1566 * _1620;
        _1366 = _1632;
    }
    float _1634 = _1366;
    if (!_1542)
    {
        _1622 = _1604;
    }
    float _1636 = _1622;
    float _1638 = sqrt(_1524);
    float _1640 = _1636;
    if (_1542)
    {
        float _1642 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1642;
    }
    float _1644 = _1578;
    if (_1542)
    {
        float _1646 = _1530 * _1634;
        _1558 = _1646;
    }
    float _1648 = _1558;
    if (!_1542)
    {
        _1630 = _1534;
    }
    float _1650 = _1630;
    float _1652 = _1650;
    if (_1542)
    {
        float _1654 = _1532 * _1634;
        _1608 = _1654;
    }
    float _1656 = _1608;
    if (_1542)
    {
        float _1658 = fma(_1604, _1598, _1644);
        _1640 = _1658;
    }
    float _1660 = _1640;
    if (_1542)
    {
        float _1662 = _1648 * _1648;
        _1652 = _1662;
    }
    float _1664 = _1652;
    if (!_1542)
    {
        _1624 = _1536;
    }
    float _1666 = _1624;
    float _1668 = _1666;
    if (_1542)
    {
        float _1670 = _1656 * _1656;
        _1668 = _1670;
    }
    float _1672 = _1668;
    float _1674 = fma(_1660, _1660, _1664);
    float _1676 = _1674 + _1672;
    float _1678 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1682 = fma(_1638, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1680);
    float _1684 = precise::clamp(_1682, 0.0, 1.0);
    float _1686 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = rsqrt(_1676);
    float _1690 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1678);
    float _1692 = -_1684;
    float _1694 = _1692 + 1.0;
    float _1696 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1698 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1700 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1690);
    float _1702 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1704 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1706 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1698);
    float _1708 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1712 = abs(_1694);
    float _1714 = log2(_1712);
    float _1716 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1718 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1702);
    float _1720 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1710);
    float _1722 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1724 = _1688 * _1648;
    float _1726 = _1688 * _1660;
    float _1728 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1730 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1734 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1718);
    float _1736 = _1688 * _1656;
    float _1738 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1730);
    float _1740 = -_1732;
    float _1742 = fma(_1726, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1740);
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1746 = -_1722;
    float _1748 = fma(_1746, _1704, 1.0);
    float _1750 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1738);
    float _1752 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = -_1736;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1742);
    float _1758 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1750);
    float _1762 = log2(_1748);
    float _1764 = fma(_1756, -0.5, 0.5);
    float _1766 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1770 = fma(_1756, 0.5, 0.5);
    float _1772 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1774 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1768);
    float _1776 = exp2(_1752);
    float _1778 = _1726 + 1.0;
    float _1780 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1772);
    float _1782 = fma(_1770, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1774);
    float _1786 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1780);
    float _1788 = fma(_1770, _1782, -0.212114393711090087890625);
    float _1790 = 1.0 / _1760;
    float _1792 = _1762 * 0.693147182464599609375;
    float _1794 = fma(_1770, _1788, 1.570728778839111328125);
    float _1796 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1798 = sqrt(_1764);
    float _1800 = -_1726;
    float _1802 = fma(_1776, _1778, _1800);
    float _1804 = fma(_1802, 0.5, 0.5);
    float _1806 = _1784 * _1790;
    float _1808 = _1786 * _1790;
    float _1810 = fma(_1806, 0.5, 0.5);
    float _1812 = fma(_1808, -0.5, 0.5);
    float _1814 = _1798 * 0.636619746685028076171875;
    float3 _5071 = float3(_1810, _1812, _1796);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5071, float3(0.0), isnan(_5071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5071, float3(0.0), isnan(_5071)), level(0.0)).x;
    float _1818 = -_1794;
    float _1820 = fma(_1814, _1818, 1.0);
    float3 _5087 = float3(_1810, _1812, _1796);
    float4 _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5087, float3(0.0), isnan(_5087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5087, float3(0.0), isnan(_5087)), level(0.0)).xyzw;
    float _1825 = _1823.x;
    float _1827 = _1823.y;
    float _1829 = _1823.z;
    float _1831 = _1823.w;
    float2 _5104 = float2(_1820, _1804);
    float3 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5104, float2(0.0), isnan(_5104)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5104, float2(0.0), isnan(_5104)), level(0.0)).xyz;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = in.m_51.w;
    float _1845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1847 = in.m_59.y;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1851 = _1849 != 0;
    float _1853 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1857 = _1855 != 0;
    float _1859 = in.m_51.x;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1863 = in.m_51.y;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1867 = _1865 != 0;
    float _1869 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1873 = _1871 != 0;
    float _1875 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1879 = _1877 != 0;
    float _1881 = 0.0;
    if (_1851)
    {
        float _1883 = in.m_51.z;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = exp2(_1853);
    float _1889 = in.m_59.x;
    bool _1891 = _1843 > 0.5;
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1895 = -_1847;
    float _1897 = _1895 + 1.0;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1901 = _1078 * _1847;
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1905 = _1903 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1907 = _1859 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1909 = _1847;
    bool _1911 = _1891;
    float _1913 = _1901;
    if (_1857)
    {
        float _1915 = _1891 ? _1897 : _1847;
        _1909 = _1915;
    }
    float _1917 = _1909;
    float _1919 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1921 = 1.0 / _1905;
    float _1923 = -_1899;
    float _1925 = fma(_1907, 2.0, _1923);
    bool _1927 = _1863 > 0.5;
    float _1929 = _1907;
    if (!_1867)
    {
        float _1931 = in.m_51.z;
        _1929 = _1931;
    }
    float _1933 = _1929;
    float _1935 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1937 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1893);
    float _1939 = -_1887;
    float _1941 = _1939 + 1.0;
    float _1943 = _1935;
    if (_1851)
    {
        bool _1945 = _1885 > 0.5;
        _1911 = _1945;
    }
    bool _1947 = _1911;
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1949;
    float _1953 = -_1901;
    float _1955 = _1953 + 1.0;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1959 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    if (_1879)
    {
        float _1961 = _1927 ? _1955 : _1901;
        _1913 = _1961;
    }
    float _1963 = _1913;
    float _1965 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1967 = _1951 * _1921;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1971 = _1070 + _1969;
    float _1973 = fma(_1935, -2.0, _1957);
    float _1975 = _1921;
    float _1977 = _1971;
    float _1979 = _1967;
    if (!_1867)
    {
        _1943 = _1863;
    }
    float _1981 = _1943;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1985 = fma(_1967, _1971, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1987 = fma(_1965, _1917, -0.5);
    float _1989 = _1981;
    if (!_1851)
    {
        _1975 = _1889;
    }
    float _1991 = _1975;
    float _1993 = fma(_1875, _1963, -0.5);
    float _1995 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1937);
    float _1997 = _1933;
    float _1999 = _1991;
    if (!_1867)
    {
        _1977 = _1933;
    }
    float _2001 = _1977;
    float _2003 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1973);
    float _2005 = _2001;
    if (_1867)
    {
        _2005 = _1863;
    }
    float _2007 = _2005;
    float _2009 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1983);
    if (_1867)
    {
        _1997 = _1863;
    }
    float _2011 = _1997;
    bool _2013 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2015 = isnan(_1070);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    bool _2025 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2027 = isnan(_1070);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2033 = _2029 || _2031;
    float _2035 = float(_2033);
    float _2037 = -_2003;
    float _2039 = fma(_1995, _1993, _2037);
    int _2041 = as_type<int>(_2011);
    if (!_1851)
    {
        _1979 = _1991;
    }
    float _2043 = _1979;
    float _2045 = -_2023;
    float _2047 = _2045 + 1.0;
    float _2049 = _2043;
    if (_1851)
    {
        _1999 = _1889;
    }
    float _2051 = _1999;
    float _2053 = _2035 * _2047;
    if (_1867)
    {
        _1989 = _1859;
    }
    float _2055 = _1989;
    float _2057 = _1192 * _2051;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2061 = _1985 * _2053;
    float _2063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2065 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2059);
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2069 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2073 = -_2035;
    float _2075 = _2073 + 1.0;
    bool _2077 = _1859 > 0.5;
    float _2079 = -_2067;
    float _2081 = fma(_2069, 2.0, _2079);
    float _2083 = fma(_2011, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2071);
    float _2085 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2087 = _2057;
    if (_1851)
    {
        float _2089 = -_2051;
        float _2091 = _2089 + 1.0;
        _2041 = as_type<int>(_2091);
    }
    int _2093 = _2041;
    float _2095 = -_2057;
    float _2097 = _2095 + 1.0;
    float _2099 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2061);
    float _2101 = -_122;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2081);
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1851)
    {
        float _2107 = _1947 ? as_type<float>(_2093) : _2051;
        _2049 = _2107;
    }
    float _2109 = _2049;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_1873)
    {
        float _2113 = _2077 ? _2097 : _2057;
        _2087 = _2113;
    }
    float _2115 = _2087;
    float _2117 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2119 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2009);
    float _2121 = fma(_2085, -2.0, _2111);
    float _2123 = -_122;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1925);
    float _2127 = fma(_2117, _2109, -0.5);
    float _2129 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2099);
    float _2131 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2133 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2135 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2137 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2065);
    float _2139 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2083);
    float _2141 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2121);
    float _2143 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2151 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2153 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1959);
    bool _2155 = _1506 > 0.0;
    bool _2157 = isnan(_1506);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(0.0);
    bool _2163 = _2159 || _2161;
    float _2165 = fma(_2137, _2127, _2103);
    out.m_63.x = _2143;
    out.m_63.y = _2145;
    out.m_63.z = _2147;
    out.m_63.w = _2149;
    float _2167 = fma(_2151, _2115, -0.5);
    float _2169 = -_2141;
    float _2171 = fma(_2139, _1987, _2169);
    float _2173 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2175 = _2153 + _1760;
    float _2177 = fma(_2119, _2167, _2125);
    float _2179 = _2039 + 0.5;
    float _2181 = _2165 + 0.5;
    float _2183 = _2171 + 0.5;
    float _2185 = _2177 + 0.5;
    float _2187 = _2175 * 0.5;
    float _2189 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2191 = _2173 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2185;
    out.m_65.y = _2179;
    out.m_65.z = _2181;
    out.m_65.w = _2183;
    out.gl_Position.x = _1784;
    out.gl_Position.y = _1786;
    out.gl_Position.z = _2153;
    out.gl_Position.w = _1760;
    out.m_67.z = _2187;
    out.m_67.w = _1760;
    out.m_45.x = _2191;
    float _2193 = _2189 * _1816;
    float _2195 = -_2189;
    float _2197 = _2195 + 1.0;
    float _2199 = _1831 * _2193;
    float _2201 = _1831 * _2197;
    float _2203 = _1841 * _2193;
    float _2205 = fma(_1837, _2199, _1825);
    float _2207 = fma(_1839, _2199, _1827);
    float _2209 = fma(_1831, _2203, _1829);
    out.m_69.x = _2205;
    out.m_69.y = _2207;
    out.m_69.z = _2209;
    out.m_69.w = _2201;
    if (_2163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2211 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2211;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

