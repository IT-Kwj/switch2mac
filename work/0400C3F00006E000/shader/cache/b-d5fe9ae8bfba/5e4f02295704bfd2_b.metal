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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1612 = false;
    bool _738 = false;
    bool _612 = false;
    bool _462 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2300 = as_type<float>(_104);
        out.gl_Position.z = _2300;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = 0.0;
    if (_118)
    {
        float _128 = float(_88);
        _98 = _128;
    }
    float _130 = _98;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2371 = as_type<float>(_144);
        out.gl_Position.z = _2371;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _154;
    if (!_164)
    {
        float _168 = _154 * _154;
        float _170 = _168 * 0.5;
        _146 = _170;
    }
    float _172 = _146;
    float _174 = 0.0;
    float _176 = _172;
    if (!_164)
    {
        float _178 = _122 * _122;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    if (!_164)
    {
        float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _184;
    }
    float _186 = _176;
    bool _188 = !_164;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _154 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _154);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _124 = _210;
        _190 = _220;
        _126 = _208;
    }
    float _222 = _124;
    float _224 = _190;
    float _226 = _126;
    bool _228 = !_164;
    float _230 = _222;
    float _232 = _226;
    if (!_228)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _154 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _230 = _246;
        _232 = _240;
        _166 = _252;
    }
    float _254 = _230;
    float _256 = _232;
    float _258 = _166;
    float _260 = _256;
    float _262 = _254;
    if (!_164)
    {
        _260 = _122;
    }
    float _264 = _260;
    float _266 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_164)
    {
        float _270 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _262 = _270;
    }
    float _272 = _262;
    bool _274 = !_164;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _122 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _122);
        float _304 = _302 * _290;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    bool _310 = !_164;
    if (!_310)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = 1.0 / _318;
        float _322 = _122 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _336 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _338 = fma(_258, _150, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _150, _334);
    float _344 = fma(_258, _148, _336);
    float _346 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _148, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_258, _152, _346);
    float _358 = fma(_332, _152, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_358;
    float _370 = _356 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = in.m_44.x;
    float _388 = in.m_44.y;
    float _390 = in.m_44.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_356, _366, _390);
    float _418 = _394;
    float _420 = _398;
    float _422 = _400;
    if (!_410)
    {
        bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _426 = !_424;
        if (!_426)
        {
            float _428 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _430 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _434 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _430);
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _438);
            float _446 = _440 * _440;
            float _448 = fma(_442, _442, _446);
            float _450 = fma(_444, _444, _448);
            float _452 = rsqrt(_450);
            float _454 = _452 * 9.9999999747524270787835121154785e-07;
            float _456 = _442 * _454;
            float _458 = _440 * _454;
            float _460 = _444 * _454;
            _418 = _458;
            _420 = _456;
            _422 = _460;
            _462 = true;
        }
        else
        {
            float _464 = _150 * _150;
            float _466 = fma(_148, _148, _464);
            float _468 = fma(_152, _152, _466);
            float _470 = sqrt(_468);
            bool _472 = _470 >= 9.9999999747524270787835121154785e-07;
            bool _474 = isnan(_470);
            bool _476 = _472 || _474;
            bool _478 = isnan(9.9999999747524270787835121154785e-07);
            bool _480 = _476 || _478;
            if (!_480)
            {
                float _482 = _388 * _388;
                float _484 = fma(_386, _386, _482);
                float _486 = fma(_390, _390, _484);
                float _488 = sqrt(_486);
                bool _490 = _488 >= 9.9999999747524270787835121154785e-07;
                bool _492 = isnan(_488);
                bool _494 = _490 || _492;
                bool _496 = isnan(9.9999999747524270787835121154785e-07);
                bool _498 = _494 || _496;
                if (!_498)
                {
                    float _500 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _502 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _500);
                    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _502);
                    float _506 = rsqrt(_504);
                    float _508 = _506 * 9.9999999747524270787835121154785e-07;
                    float _510 = _508 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _512 = _508 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _514 = _508 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _418 = _512;
                    _420 = _510;
                    _422 = _514;
                    _462 = true;
                }
                else
                {
                    float _516 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _520 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _522 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _516);
                    float _524 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _518);
                    float _526 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _520);
                    float _528 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _522);
                    float _530 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _524);
                    float _532 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _526);
                    float _534 = _528 * _528;
                    float _536 = fma(_530, _530, _534);
                    float _538 = fma(_532, _532, _536);
                    float _540 = rsqrt(_538);
                    float _542 = _540 * 9.9999999747524270787835121154785e-07;
                    float _544 = _530 * _542;
                    float _546 = _528 * _542;
                    float _548 = _532 * _542;
                    _418 = _546;
                    _420 = _544;
                    _422 = _548;
                    _462 = true;
                }
            }
            else
            {
                float _550 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _552 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _554 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _556 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _550);
                float _558 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _552);
                float _560 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _554);
                float _562 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _556);
                float _564 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _558);
                float _566 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _560);
                float _568 = _562 * _562;
                float _570 = fma(_564, _564, _568);
                float _572 = fma(_566, _566, _570);
                float _574 = rsqrt(_572);
                float _576 = _574 * 9.9999999747524270787835121154785e-07;
                float _578 = _564 * _576;
                float _580 = _562 * _576;
                float _582 = _566 * _576;
                _418 = _580;
                _420 = _578;
                _422 = _582;
            }
        }
    }
    _462 = false;
    float _584 = _418;
    float _586 = _420;
    float _588 = _422;
    bool _590 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _592 = !_590;
    float _610;
    if (!_592)
    {
        float _594 = in.m_53.x;
        float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _598 = _594 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _602 = _600 * _596;
        float _604 = floor(_602);
        float _606 = -_604;
        float _608 = _602 + _606;
        _610 = _608;
        _612 = true;
    }
    else
    {
        float _614 = float(_88);
        float _616 = 1.0 / _614;
        float _618 = _122 * _616;
        _610 = _618;
    }
    _612 = false;
    float _620 = _610;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _624 = _620 + _622;
    bool _626 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _628 = isnan(_620);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _638;
    float _642 = -_636;
    float _644 = _642 + 1.0;
    bool _646 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _648 = isnan(_620);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = 1.0 / _640;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _664;
    bool _668 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _670 = _656 * _644;
    float _672 = -_656;
    float _674 = _672 + 1.0;
    float _676 = _624 * _658;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _678;
    float _682 = in.m_51.x;
    float _684 = in.m_51.y;
    float _686 = in.m_51.z;
    float _688 = fma(_662, _676, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _690 = fma(_680, _676, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _692 = fma(_666, _676, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _694 = _688 * _670;
    float _696 = _690 * _670;
    float _698 = _692 * _670;
    float _700 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].x, _694);
    float _702 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].y, _696);
    float _704 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].z, _698);
    float _706 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[144].x, _700);
    float _708 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[144].y, _702);
    float _710 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[144].z, _704);
    float _712 = _706 * _682;
    float _714 = _708 * _684;
    float _716 = _710 * _686;
    bool _718 = !_668;
    float _736;
    if (!_718)
    {
        float _720 = in.m_53.x;
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _724 = _720 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _728 = _726 * _722;
        float _730 = floor(_728);
        float _732 = -_730;
        float _734 = _728 + _732;
        _736 = _734;
        _738 = true;
    }
    else
    {
        float _740 = float(_88);
        float _742 = 1.0 / _740;
        float _744 = _122 * _742;
        _736 = _744;
    }
    _738 = false;
    float _746 = _736;
    float _748 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _750 = _584 * _584;
    float _752 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _754 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _748);
    float _756 = fma(_586, _586, _750);
    float _758 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _760 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _762 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _752);
    float _764 = fma(_588, _588, _756);
    float _766 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _758);
    float _768 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _770 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _762);
    float _772 = rsqrt(_764);
    float _774 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _754);
    float _776 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _768);
    float _778 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _760);
    float _780 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _766);
    float _782 = _770 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _784 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _776);
    float _786 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _778);
    float _788 = _774 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _782 + _790;
    float _794 = _784 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _798 = _788 + _796;
    float _800 = _792 * _792;
    float _802 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _806 = _794 + _804;
    float _808 = sqrt(_780);
    float _810 = fma(_798, _798, _800);
    float _812 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _802);
    float _814 = _772 * _584;
    float _816 = _772 * _586;
    float _818 = fma(_806, _806, _810);
    float _820 = _772 * _588;
    float _822 = _814 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _826 = in.m_53.w;
    float _828 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[8].y, _822);
    float _830 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _832 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _812);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[10].y, _828);
    float _836 = sqrt(_786);
    float _838 = in.m_53.y;
    float _840 = fma(_808, _808, _832);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _844 = _842 != 0;
    float _846 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _848 = abs(_834);
    bool _850 = _848 > 0.99989998340606689453125;
    float _852 = in.m_55.z;
    float _854 = rsqrt(_818);
    float _856 = _824 * _584;
    float _858 = _856 * 8.0;
    float _860 = _824 * _586;
    float _862 = _860 * 8.0;
    float _864 = _824 * _588;
    float _866 = _864 * 8.0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _870 = _868 != 0;
    float _872 = in.m_55.x;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _876 = _874 != 0;
    float _878 = _862 * _862;
    float _880 = fma(_836, _836, _840);
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _884 = _882 != 0;
    float _886 = sqrt(_832);
    float _888 = 0.0;
    float _890 = (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _892 = _806;
    bool _894 = _850;
    if (_850)
    {
        _888 = 0.001000000047497451305389404296875;
    }
    float _896 = _888;
    float _898 = fma(_866, _866, _878);
    if (!_850)
    {
        _890 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _900 = _890;
    float _902 = fma(_858, _858, _878);
    float _904 = _792 * _854;
    float _906 = _798 * _854;
    float _908 = _900;
    if (_850)
    {
        float _910 = fma(_896, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _908 = _910;
    }
    float _912 = _908;
    float _914 = sqrt(_880);
    float _916 = -_904;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _920 = -_906;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _924 = _918 * _918;
    bool _926 = _826 > 0.5;
    float _928 = fma(_922, _922, _924);
    float _930 = _806 * _854;
    float _932 = _924;
    bool _934 = _926;
    if (!_850)
    {
        _932 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _936 = _932;
    float _938 = _936;
    if (_850)
    {
        float _940 = fma(_896, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _938 = _940;
    }
    float _942 = _938;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _948 = -_930;
    float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _806);
    if (!_850)
    {
        _892 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _952 = _892;
    float _954 = _952;
    if (_850)
    {
        float _956 = fma(_896, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _954 = _956;
    }
    float _958 = _954;
    float _960 = sqrt(_898);
    float _962 = fma(_950, _950, _928);
    float _964 = -_912;
    float _966 = _820 * _964;
    float _968 = -_958;
    float _970 = _816 * _968;
    float _972 = _914 + 9.9999997473787516355514526367188e-06;
    bool _974 = _838 > 0.5;
    float _976 = -_942;
    float _978 = -_966;
    float _980 = fma(_816, _976, _978);
    float _982 = -_942;
    float _984 = _814 * _982;
    float _986 = sqrt(_962);
    float _988 = -_912;
    float _990 = -_970;
    float _992 = fma(_814, _988, _990);
    float _994 = -_958;
    float _996 = -_984;
    float _998 = fma(_820, _994, _996);
    float _1000 = _980 * _980;
    float _1002 = _886 * 0.800000011920928955078125;
    float _1004 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1006 = precise::clamp(_1004, 0.0, 1.0);
    float _1008 = 1.0 / _946;
    float _1010 = fma(_998, _998, _1000);
    float _1012 = fma(_1006, -0.64999997615814208984375, 1.0);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1014;
    float _1018 = fma(_992, _992, _1010);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1024 = _886 * (-0.4000000059604644775390625);
    float _1026 = 1.0 / _972;
    float _1028 = _854 * _986;
    float _1030 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1032 = _830 * _1028;
    float _1034 = _846 * _1028;
    float _1036 = fma(_960, 4.999999523162841796875, -0.4999999701976776123046875);
    float _1038 = precise::clamp(_1036, 0.0, 1.0);
    float _1040 = abs(_858);
    float _1042 = 1.0 / _1040;
    float _1044 = in.m_55.y;
    float _1046 = _1016 * _1008;
    float _1048 = 1.0 / _1002;
    float _1050 = _1026 * _852;
    float _1052 = _1038 * _1038;
    float _1054 = rsqrt(_1018);
    float _1056 = _960 * _1042;
    float _1058 = _1056 * 0.25;
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = fma(_1038, -2.0, 3.0);
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1050);
    float _1066 = _1030 * _1028;
    float _1068 = _1026 * _872;
    float _1070 = _1062 * _1052;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1074 = _746 + _1072;
    float _1076 = _960 * _1048;
    float _1078 = _1066 * _1064;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1044);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1068);
    float _1084 = fma(_866, _866, _902);
    bool _1086 = _1076 < 0.5;
    float _1088 = float(_1086);
    float _1090 = _1032 * _1080;
    float _1092 = _1034 * _1082;
    float _1094 = _980 * _1054;
    float _1096 = _992 * _1054;
    float _1098 = _998 * _1054;
    float _1100 = _1090 * _820;
    float _1102 = _816 * _1094;
    float _1104 = _814 * _1096;
    float _1106 = _1090 * _816;
    float _1108 = _1054;
    float _1110 = _1012;
    if (_844)
    {
        float _1112 = in.m_53.x;
        _1108 = _1112;
    }
    float _1114 = _1108;
    float _1116 = -_1102;
    float _1118 = fma(_814, _1098, _1116);
    float _1120 = _1090 * _814;
    float _1122 = -_1104;
    float _1124 = fma(_820, _1094, _1122);
    float _1126 = _820 * _1098;
    float _1128 = fma(_1092, _1098, _1106);
    float _1130 = rsqrt(_1084);
    float _1132 = fma(_1092, _1094, _1120);
    float _1134 = -_1126;
    float _1136 = fma(_816, _1096, _1134);
    float _1138 = fma(_1092, _1096, _1100);
    float _1140 = fma(_1078, _1124, _1128);
    float _1142 = fma(_1078, _1118, _1138);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1148 = fma(_1078, _1136, _1132);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1154 = _1060 * _1060;
    float _1156 = in.m_57.y;
    float _1158 = -_1070;
    float _1160 = _1158 + 1.0;
    float _1162 = 1.0 / _1146;
    float _1164 = _858 * _1130;
    float _1166 = _862 * _1130;
    float _1168 = fma(_1060, -2.0, 3.0);
    float _1170 = _866 * _1130;
    float _1172 = _1148 * _1164;
    if (_844)
    {
        bool _1174 = _1114 > 0.5;
        _894 = _1174;
    }
    bool _1176 = _894;
    float _1178 = fma(_1168, _1154, _1160);
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = 1.0 / _1152;
    float _1184 = fma(_1140, _1166, _1172);
    float _1186 = _1146;
    if (_870)
    {
        float _1188 = in.m_53.z;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = -_1088;
    float _1194 = fma(_1192, _1180, 1.0);
    float _1196 = fma(_1142, _1170, _1184);
    bool _1198 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1200 = isnan(_746);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = _1166 * _1196;
    float _1212 = _1170 * _1196;
    float _1214 = fma(_1194, 0.89999997615814208984375, 0.100000001490116119384765625);
    bool _1216 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1218 = isnan(_746);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = -_1210;
    float _1230 = _1140 + _1228;
    float _1232 = -_1212;
    float _1234 = _1142 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1236;
    float _1240 = _1022 * _1162;
    float _1242 = fma(_1210, _1214, _1230);
    float _1244 = fma(_1212, _1214, _1234);
    float _1246 = -_1156;
    float _1248 = _1246 + 1.0;
    float _1250 = _1238 * _1182;
    float _1252 = _788 + _1242;
    float _1254 = _794 + _1244;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1258 = _746 + _1256;
    int _1260 = _926 ? as_type<int>(_1248) : as_type<int>(_1156);
    float _1262 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1264 = _1252 + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1268 = _1254 + _1266;
    float _1270 = _1156;
    if (_870)
    {
        bool _1272 = _1190 > 0.5;
        _934 = _1272;
    }
    bool _1274 = _934;
    float _1276 = fma(_1046, _1258, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1278 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1280 = isnan(_746);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = fma(_1264, _1012, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1292 = fma(_1268, _1012, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1294 = fma(_1240, _1074, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1296 = -_1208;
    float _1298 = _1296 + 1.0;
    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1302 = _1290 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1306 = _1292 + _1304;
    float _1308 = -_1288;
    float _1310 = _1308 + 1.0;
    float _1312 = _1226 * _1298;
    float _1314 = _1302 * _1302;
    float _1316 = _1306 * _1306;
    float _1318 = _1208 * _1310;
    float _1320 = _1032 * _1044;
    float _1322 = -_1226;
    float _1324 = _1322 + 1.0;
    float _1326 = _1314 + _1316;
    float _1328 = _1164 * _1196;
    float _1330 = _1214 * _1320;
    bool _1332 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1334 = isnan(_746);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = sqrt(_1326);
    float _1346 = -_1328;
    float _1348 = _1148 + _1346;
    float _1350 = _1130 * _1330;
    float _1352 = in.m_57.x;
    float _1354 = _1342 * _1324;
    float _1356 = fma(_1194, 0.5, 0.5);
    float _1358 = _1350 * _1350;
    float _1360 = _876 ? as_type<float>(_1260) : _1156;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1364 = _1070 * _1356;
    float _1366 = _1024 * _1358;
    float _1368 = _1366 * 0.5;
    float _1370 = fma(_1328, _1214, _1348);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1374 = _746 + _1372;
    float _1376 = _1364 * _1364;
    float _1378 = _1276 * _1354;
    float _1380 = _782 + _1370;
    bool _1382 = _1344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1386 = -_1342;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_1368, _1376, _1380);
    float _1392 = fma(_1250, _1374, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1394 = _1380;
    float _1396 = _1314;
    int _1398 = as_type<int>(_1344);
    float _1400 = _1316;
    float _1402 = _1290;
    float _1404 = _1292;
    float _1406 = _1326;
    if (_884)
    {
        float _1408 = _974 ? _1248 : _1156;
        _1270 = _1408;
    }
    float _1410 = _1270;
    float _1412 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1378);
    float _1414 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1416 = _1390 + _1414;
    float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1420 = fma(_1294, _1312, _1412);
    float _1422 = fma(_1416, _1012, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    int _1424 = as_type<int>(_1416);
    float _1426 = _1352;
    if (!_844)
    {
        _1394 = _1352;
    }
    float _1428 = _1394;
    float _1430 = _1428;
    if (!_1382)
    {
        _1110 = _1422;
    }
    float _1432 = _1110;
    bool _1434 = !_1382;
    float _1436 = _1432;
    float _1438 = _1418;
    if (!_1434)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1344 + _1442;
        float _1446 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = rsqrt(_1326);
        float _1450 = _1444 * _1440;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = cos(_1458);
        float _1462 = fma(_1456, _1446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1464 = _1448 * _1462;
        float _1466 = fma(_1302, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = _1460 + (-1.0);
        float _1470 = fma(_1306, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1474 = _1466 + _1472;
        float _1476 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1480 = _1470 + _1478;
        float _1482 = _1474 * _1474;
        float _1484 = fma(_1422, _1460, _1476);
        float _1486 = _1480 * _1480;
        _1436 = _1484;
        _1396 = _1482;
        _1398 = as_type<int>(_1476);
        _1400 = _1486;
        _1424 = as_type<int>(_1452);
        _1402 = _1466;
        _1404 = _1470;
        _1406 = _1448;
    }
    float _1488 = _1436;
    float _1490 = _1396;
    int _1492 = _1398;
    float _1494 = _1400;
    int _1496 = _1424;
    float _1498 = _1402;
    float _1500 = _1404;
    float _1502 = _1406;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1506 = _1488 + _1504;
    float _1508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1510 = _1492;
    int _1512 = _1496;
    float _1514 = _1502;
    if (_844)
    {
        float _1516 = -_1352;
        float _1518 = _1516 + 1.0;
        _1510 = as_type<int>(_1518);
    }
    int _1520 = _1510;
    if (_870)
    {
        float _1522 = -_1352;
        float _1524 = _1522 + 1.0;
        _1512 = as_type<int>(_1524);
    }
    int _1526 = _1512;
    float _1528 = fma(_1506, _1506, _1490);
    float _1530 = fma(_1392, _1318, _1420);
    out.m_59.x = _1034;
    out.m_59.y = _1032;
    if (_844)
    {
        float _1532 = _1176 ? as_type<float>(_1520) : _1352;
        _1430 = _1532;
    }
    float _1534 = _1430;
    float _1536 = _1528 + _1494;
    if (_870)
    {
        float _1538 = _1274 ? as_type<float>(_1526) : _1352;
        _1426 = _1538;
    }
    float _1540 = _1426;
    float _1542 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1530);
    float _1544 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1546 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1548 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1550 = sqrt(_1536);
    float _1552 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1554 = _1544 * _1384;
    float _1556 = _1546 * _1508;
    float _1558 = _1548 * _1362;
    float _1560 = _1552 * _1418;
    float _1562 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1558;
    out.m_61.y = _1554;
    out.m_61.z = _1560;
    out.m_61.w = _1556;
    out.m_63.w = _1562;
    bool _1564 = _1550 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1566 = isnan(_1550);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1572 = _1568 || _1570;
    float _1574 = _1556;
    float _1576 = _1508;
    if (!_1572)
    {
        _1438 = 1.0;
    }
    float _1578 = _1438;
    bool _1580 = !_1572;
    float _1582 = _1578;
    if (!_1580)
    {
        bool _1584 = _1550 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1586 = isnan(_1550);
        bool _1588 = _1584 || _1586;
        bool _1590 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1592 = _1588 || _1590;
        if (!_1592)
        {
            float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1596 = _1550 + _1594;
            float _1598 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1600 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1598;
            float _1602 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1604 = _1602 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1606 = 1.0 / _1600;
            float _1608 = _1596 * _1606;
            float _1610 = fma(_1608, _1604, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1582 = _1610;
            _1612 = true;
        }
        else
        {
            bool _1614 = _1550 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1616 = isnan(_1550);
            bool _1618 = _1614 || _1616;
            bool _1620 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1622 = _1618 || _1620;
            if (!_1622)
            {
                float _1624 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1626 = _1550 + _1624;
                float _1628 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1630 = _1628 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1632 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1634 = _1632 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1636 = 1.0 / _1630;
                float _1638 = _1626 * _1636;
                float _1640 = fma(_1638, _1634, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1582 = _1640;
                _1612 = true;
            }
            else
            {
                _1582 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1612 = false;
    float _1642 = _1582;
    float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1646 = _1488 + _1644;
    float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1650 = _1498 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1654 = _1500 + _1652;
    float _1656 = fma(_1646, _1642, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1658 = fma(_1650, _1642, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1660 = fma(_1654, _1642, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1662 = -_904;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1656);
    float _1666 = -_906;
    float _1668 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1658);
    float _1670 = -_930;
    float _1672 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1660);
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1676 = _1664 + _1674;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1680 = _1668 + _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1684 = _1672 + _1682;
    float _1686 = _1676 * _1676;
    float _1688 = fma(_1680, _1680, _1686);
    float _1690 = fma(_1684, _1684, _1688);
    float _1692 = rsqrt(_1690);
    float _1694 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1696 = _1680 * _1694;
    float _1698 = _1684 * _1694;
    float _1700 = _1696 * _1696;
    float _1702 = _1698 * _1698;
    float _1704 = _1700 + _1702;
    float _1706 = sqrt(_1704);
    bool _1708 = _1706 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1712 = _1706 + _1710;
    float _1714 = _1684;
    float _1716 = _1704;
    float _1718 = _1712;
    float _1720 = _1676;
    if (_1708)
    {
        float _1722 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1714 = _1722;
    }
    float _1724 = _1714;
    if (_1708)
    {
        float _1726 = rsqrt(_1704);
        _1716 = _1726;
    }
    float _1728 = _1716;
    float _1730 = _1728;
    if (_1708)
    {
        float _1732 = _1712 * _1724;
        _1718 = _1732;
    }
    float _1734 = _1718;
    if (_1708)
    {
        float _1736 = _1734 * 0.15915493667125701904296875;
        _1574 = _1736;
    }
    float _1738 = _1574;
    float _1740 = _1724;
    if (_1708)
    {
        float _1742 = _1738 * 6.283185482025146484375;
        float _1744 = sin(_1742);
        _1740 = _1744;
    }
    float _1746 = _1740;
    float _1748 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1750 = precise::max(0.0, _1748);
    float _1752 = _1686;
    float _1754 = _1750;
    if (_1708)
    {
        float _1756 = _1738 * 6.283185482025146484375;
        float _1758 = cos(_1756);
        _1752 = _1758;
    }
    float _1760 = _1752;
    float _1762 = -_1694;
    float _1764 = -_1750;
    float _1766 = fma(_1676, _1762, _1764);
    if (_1708)
    {
        float _1768 = _1766 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1754 = _1768;
    }
    float _1770 = _1754;
    float _1772 = sqrt(_1690);
    float _1774 = _1746;
    float _1776 = _1770;
    if (_1708)
    {
        float _1778 = fma(_1746, _1770, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1720 = _1778;
    }
    float _1780 = _1720;
    float _1782 = _1780;
    if (!_1708)
    {
        _1774 = _1696;
    }
    float _1784 = _1774;
    float _1786 = _1784;
    float _1788 = _1760;
    if (_1708)
    {
        float _1790 = _1760 + (-1.0);
        _1776 = _1790;
    }
    float _1792 = _1776;
    float _1794 = _1792;
    if (_1708)
    {
        float _1796 = _1728 * _1780;
        _1514 = _1796;
    }
    float _1798 = _1514;
    if (!_1708)
    {
        _1782 = _1766;
    }
    float _1800 = _1782;
    float _1802 = _1800;
    if (_1708)
    {
        float _1804 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1804;
    }
    float _1806 = _1576;
    if (_1708)
    {
        float _1808 = _1696 * _1798;
        _1786 = _1808;
    }
    float _1810 = _1786;
    if (!_1708)
    {
        _1794 = _1698;
    }
    float _1812 = _1794;
    float _1814 = _1812;
    if (_1708)
    {
        float _1816 = _1698 * _1798;
        _1814 = _1816;
    }
    float _1818 = _1814;
    if (!_1708)
    {
        _1730 = _1700;
    }
    float _1820 = _1730;
    float _1822 = _1820;
    if (_1708)
    {
        float _1824 = fma(_1766, _1760, _1806);
        _1802 = _1824;
    }
    float _1826 = _1802;
    if (_1708)
    {
        float _1828 = _1810 * _1810;
        _1822 = _1828;
    }
    float _1830 = _1822;
    if (!_1708)
    {
        _1788 = _1702;
    }
    float _1832 = _1788;
    float _1834 = _1832;
    if (_1708)
    {
        float _1836 = _1818 * _1818;
        _1834 = _1836;
    }
    float _1838 = _1834;
    float _1840 = fma(_1826, _1826, _1830);
    float _1842 = _1840 + _1838;
    float _1844 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1848 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1846);
    float _1850 = precise::clamp(_1848, 0.0, 1.0);
    float _1852 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1854 = rsqrt(_1842);
    float _1856 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1844);
    float _1858 = -_1850;
    float _1860 = _1858 + 1.0;
    float _1862 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1852);
    float _1864 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1866 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1856);
    float _1868 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1870 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1862);
    float _1872 = abs(_1860);
    float _1874 = log2(_1872);
    float _1876 = _1866 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1878 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1868);
    float _1880 = _1870 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1882 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1884 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1886 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1878);
    float _1888 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1882);
    float _1890 = -_1884;
    float _1892 = fma(_1890, _1864, 1.0);
    float _1894 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1898 = _1854 * _1810;
    float _1900 = _1854 * _1826;
    float _1902 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1888);
    float _1904 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1896);
    float _1906 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1908 = _1854 * _1818;
    float _1910 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1912 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1914 = -_1906;
    float _1916 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1914);
    float _1918 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1904);
    float _1920 = log2(_1892);
    float _1922 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1924 = -_1908;
    float _1926 = fma(_1924, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1916);
    float _1928 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1918);
    float _1930 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1932 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1922);
    float _1934 = fma(_1926, -0.5, 0.5);
    float _1936 = fma(_1926, 0.5, 0.5);
    float _1938 = exp2(_1912);
    float _1940 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1930);
    float _1942 = _1900 + 1.0;
    float _1944 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1932);
    float _1946 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1940);
    float _1948 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1944);
    float _1950 = 1.0 / _1928;
    float _1952 = fma(_1936, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1954 = _1920 * 0.693147182464599609375;
    float _1956 = fma(_1936, _1952, -0.212114393711090087890625);
    float _1958 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1960 = sqrt(_1934);
    float _1962 = -_1900;
    float _1964 = fma(_1938, _1942, _1962);
    float _1966 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1946);
    float _1968 = fma(_1936, _1956, 1.570728778839111328125);
    float _1970 = fma(_1964, 0.5, 0.5);
    float _1972 = _1966 * _1950;
    float _1974 = _1948 * _1950;
    float _1976 = fma(_1972, 0.5, 0.5);
    float _1978 = fma(_1974, -0.5, 0.5);
    float _1980 = _1960 * 0.636619746685028076171875;
    float _1982 = -_1968;
    float _1984 = fma(_1980, _1982, 1.0);
    float3 _5374 = float3(_1976, _1978, _1958);
    float _1986 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5374, float3(0.0), isnan(_5374)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5374, float3(0.0), isnan(_5374)), level(0.0)).x;
    float3 _5385 = float3(_1976, _1978, _1958);
    float4 _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5385, float3(0.0), isnan(_5385)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5385, float3(0.0), isnan(_5385)), level(0.0)).xyzw;
    float _1991 = _1989.x;
    float _1993 = _1989.y;
    float _1995 = _1989.z;
    float _1997 = _1989.w;
    float2 _5402 = float2(_1984, _1970);
    float3 _2001 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5402, float2(0.0), isnan(_5402)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5402, float2(0.0), isnan(_5402)), level(0.0)).xyz;
    float _2003 = _2001.x;
    float _2005 = _2001.y;
    float _2007 = _2001.z;
    float _2009 = -_904;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _2013 = -_906;
    float _2015 = fma(_2013, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _2017 = -_930;
    float _2019 = fma(_2017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _794);
    float _2021 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2023 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2025 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2027 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2023);
    float _2029 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2025);
    float _2031 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2027);
    float _2033 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2029);
    float _2035 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2037 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2039 = 1.0 / _2035;
    float _2041 = _2037 + _2035;
    float _2043 = _2041 * _2039;
    float _2045 = _2043 * 0.5;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2049 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2047);
    bool _2051 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.5);
    bool _2059 = _2055 || _2057;
    float _2061 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2063 = 1.0 / _2049;
    float _2065 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2061);
    float _2067 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2065);
    float _2069 = exp2(_2021);
    float _2071 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2067);
    float _2073 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2075 = _2045;
    if (_2059)
    {
        _2073 = 1.0;
    }
    float _2077 = _2073;
    float _2079 = _2077;
    if (_2059)
    {
        _2075 = 1.0;
    }
    float _2081 = _2075;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2085 = _2063 * _2083;
    float _2087 = _2081;
    if (!_2059)
    {
        float _2089 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2091 = _2089 * 0.15915493667125701904296875;
        float _2093 = _2091 * 6.283185482025146484375;
        float _2095 = cos(_2093);
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2099 = _2097 * 0.15915493667125701904296875;
        float _2101 = _2091 * 6.283185482025146484375;
        float _2103 = sin(_2101);
        float _2105 = 1.0 / _2095;
        float _2107 = _2099 * 6.283185482025146484375;
        float _2109 = cos(_2107);
        float _2111 = _2103 * _2105;
        float _2113 = _2099 * 6.283185482025146484375;
        float _2115 = sin(_2113);
        float _2117 = _2109 * _2111;
        float _2119 = 1.0 / _2117;
        float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2123 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2121;
        float _2125 = 1.0 / _2123;
        float _2127 = _2115 * _2119;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2131 = fma(_2085, _2127, _2129);
        float _2133 = _2131 * _2125;
        float _2135 = precise::clamp(_2133, 0.0, 1.0);
        _2079 = _2135;
    }
    float _2137 = _2079;
    if (!_2059)
    {
        float _2139 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2141 = _2139 * 0.15915493667125701904296875;
        float _2143 = _2141 * 6.283185482025146484375;
        float _2145 = cos(_2143);
        float _2147 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2149 = _2147 * 0.15915493667125701904296875;
        float _2151 = _2141 * 6.283185482025146484375;
        float _2153 = sin(_2151);
        float _2155 = 1.0 / _2145;
        float _2157 = _2149 * 6.283185482025146484375;
        float _2159 = cos(_2157);
        float _2161 = _2153 * _2155;
        float _2163 = _2149 * 6.283185482025146484375;
        float _2165 = sin(_2163);
        float _2167 = _2159 * _2161;
        float _2169 = 1.0 / _2167;
        float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2173 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2171;
        float _2175 = 1.0 / _2173;
        float _2177 = _2165 * _2169;
        float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2181 = fma(_2085, _2177, _2179);
        float _2183 = _2181 * _2175;
        float _2185 = precise::clamp(_2183, 0.0, 1.0);
        float _2187 = -_2185;
        float _2189 = _2187 + 1.0;
        _2087 = _2189;
    }
    float _2191 = _2087;
    float _2193 = _2137 * _2191;
    float _2195 = _2071 + _1928;
    float _2197 = -_2069;
    float _2199 = _2197 + 1.0;
    bool _2201 = _2137 > 0.0;
    bool _2203 = isnan(_2137);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(0.0);
    bool _2209 = _2205 || _2207;
    float _2211 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2213 = _2195 * 0.5;
    float _2215 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2217 = _2191 <= 0.0;
    bool _2219 = !_2209;
    bool _2221 = _2217 || _2219;
    out.m_65.x = _1668;
    out.m_65.y = _1664;
    out.m_65.z = _1672;
    float _2223 = _2215 * _1986;
    float _2225 = -_2215;
    float _2227 = _2225 + 1.0;
    float _2229 = _2211 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2231 = _1997 * _2223;
    float _2233 = _2007 * _2223;
    float _2235 = _1997 * _2227;
    out.gl_Position.x = _1966;
    out.gl_Position.y = _1948;
    out.gl_Position.z = _2071;
    out.gl_Position.w = _1928;
    float _2237 = fma(_2003, _2231, _1991);
    float _2239 = fma(_2005, _2231, _1993);
    float _2241 = fma(_1997, _2233, _1995);
    out.m_67.z = _2213;
    out.m_67.w = _1928;
    out.m_47.x = _2229;
    out.m_69.x = _2237;
    out.m_69.y = _2239;
    out.m_69.z = _2241;
    out.m_69.w = _2235;
    if (!_2221)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2243 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2243;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1612 = false;
    bool _738 = false;
    bool _612 = false;
    bool _462 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2300 = as_type<float>(_104);
        out.gl_Position.z = _2300;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = 0.0;
    if (_118)
    {
        float _128 = float(_88);
        _98 = _128;
    }
    float _130 = _98;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2371 = as_type<float>(_144);
        out.gl_Position.z = _2371;
    }
    if (_136)
    {
        return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _154;
    if (!_164)
    {
        float _168 = _154 * _154;
        float _170 = _168 * 0.5;
        _146 = _170;
    }
    float _172 = _146;
    float _174 = 0.0;
    float _176 = _172;
    if (!_164)
    {
        float _178 = _122 * _122;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    if (!_164)
    {
        float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _184;
    }
    float _186 = _176;
    bool _188 = !_164;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _154 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _154);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _124 = _210;
        _190 = _220;
        _126 = _208;
    }
    float _222 = _124;
    float _224 = _190;
    float _226 = _126;
    bool _228 = !_164;
    float _230 = _222;
    float _232 = _226;
    if (!_228)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _154 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _230 = _246;
        _232 = _240;
        _166 = _252;
    }
    float _254 = _230;
    float _256 = _232;
    float _258 = _166;
    float _260 = _256;
    float _262 = _254;
    if (!_164)
    {
        _260 = _122;
    }
    float _264 = _260;
    float _266 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_164)
    {
        float _270 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _262 = _270;
    }
    float _272 = _262;
    bool _274 = !_164;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _122 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _122);
        float _304 = _302 * _290;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    bool _310 = !_164;
    if (!_310)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = 1.0 / _318;
        float _322 = _122 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _336 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _338 = fma(_258, _150, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _150, _334);
    float _344 = fma(_258, _148, _336);
    float _346 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _148, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_258, _152, _346);
    float _358 = fma(_332, _152, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_358;
    float _370 = _356 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = in.m_44.x;
    float _388 = in.m_44.y;
    float _390 = in.m_44.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_356, _366, _390);
    float _418 = _394;
    float _420 = _398;
    float _422 = _400;
    if (!_410)
    {
        bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _426 = !_424;
        if (!_426)
        {
            float _428 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _430 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _434 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _430);
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _438);
            float _446 = _440 * _440;
            float _448 = fma(_442, _442, _446);
            float _450 = fma(_444, _444, _448);
            float _452 = rsqrt(_450);
            float _454 = _452 * 9.9999999747524270787835121154785e-07;
            float _456 = _442 * _454;
            float _458 = _440 * _454;
            float _460 = _444 * _454;
            _418 = _458;
            _420 = _456;
            _422 = _460;
            _462 = true;
        }
        else
        {
            float _464 = _150 * _150;
            float _466 = fma(_148, _148, _464);
            float _468 = fma(_152, _152, _466);
            float _470 = sqrt(_468);
            bool _472 = _470 >= 9.9999999747524270787835121154785e-07;
            bool _474 = isnan(_470);
            bool _476 = _472 || _474;
            bool _478 = isnan(9.9999999747524270787835121154785e-07);
            bool _480 = _476 || _478;
            if (!_480)
            {
                float _482 = _388 * _388;
                float _484 = fma(_386, _386, _482);
                float _486 = fma(_390, _390, _484);
                float _488 = sqrt(_486);
                bool _490 = _488 >= 9.9999999747524270787835121154785e-07;
                bool _492 = isnan(_488);
                bool _494 = _490 || _492;
                bool _496 = isnan(9.9999999747524270787835121154785e-07);
                bool _498 = _494 || _496;
                if (!_498)
                {
                    float _500 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _502 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _500);
                    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _502);
                    float _506 = rsqrt(_504);
                    float _508 = _506 * 9.9999999747524270787835121154785e-07;
                    float _510 = _508 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _512 = _508 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _514 = _508 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _418 = _512;
                    _420 = _510;
                    _422 = _514;
                    _462 = true;
                }
                else
                {
                    float _516 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _520 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _522 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _516);
                    float _524 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _518);
                    float _526 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _520);
                    float _528 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _522);
                    float _530 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _524);
                    float _532 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _526);
                    float _534 = _528 * _528;
                    float _536 = fma(_530, _530, _534);
                    float _538 = fma(_532, _532, _536);
                    float _540 = rsqrt(_538);
                    float _542 = _540 * 9.9999999747524270787835121154785e-07;
                    float _544 = _530 * _542;
                    float _546 = _528 * _542;
                    float _548 = _532 * _542;
                    _418 = _546;
                    _420 = _544;
                    _422 = _548;
                    _462 = true;
                }
            }
            else
            {
                float _550 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _552 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _554 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _556 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _550);
                float _558 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _552);
                float _560 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _554);
                float _562 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _556);
                float _564 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _558);
                float _566 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _560);
                float _568 = _562 * _562;
                float _570 = fma(_564, _564, _568);
                float _572 = fma(_566, _566, _570);
                float _574 = rsqrt(_572);
                float _576 = _574 * 9.9999999747524270787835121154785e-07;
                float _578 = _564 * _576;
                float _580 = _562 * _576;
                float _582 = _566 * _576;
                _418 = _580;
                _420 = _578;
                _422 = _582;
            }
        }
    }
    _462 = false;
    float _584 = _418;
    float _586 = _420;
    float _588 = _422;
    bool _590 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _592 = !_590;
    float _610;
    if (!_592)
    {
        float _594 = in.m_53.x;
        float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _598 = _594 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _602 = _600 * _596;
        float _604 = floor(_602);
        float _606 = -_604;
        float _608 = _602 + _606;
        _610 = _608;
        _612 = true;
    }
    else
    {
        float _614 = float(_88);
        float _616 = 1.0 / _614;
        float _618 = _122 * _616;
        _610 = _618;
    }
    _612 = false;
    float _620 = _610;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _624 = _620 + _622;
    bool _626 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _628 = isnan(_620);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _638;
    float _642 = -_636;
    float _644 = _642 + 1.0;
    bool _646 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _648 = isnan(_620);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = 1.0 / _640;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _664;
    bool _668 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _670 = _656 * _644;
    float _672 = -_656;
    float _674 = _672 + 1.0;
    float _676 = _624 * _658;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _678;
    float _682 = in.m_51.x;
    float _684 = in.m_51.y;
    float _686 = in.m_51.z;
    float _688 = fma(_662, _676, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _690 = fma(_680, _676, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _692 = fma(_666, _676, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _694 = _688 * _670;
    float _696 = _690 * _670;
    float _698 = _692 * _670;
    float _700 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].x, _694);
    float _702 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].y, _696);
    float _704 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].z, _698);
    float _706 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[144].x, _700);
    float _708 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[144].y, _702);
    float _710 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[144].z, _704);
    float _712 = _706 * _682;
    float _714 = _708 * _684;
    float _716 = _710 * _686;
    bool _718 = !_668;
    float _736;
    if (!_718)
    {
        float _720 = in.m_53.x;
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _724 = _720 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _728 = _726 * _722;
        float _730 = floor(_728);
        float _732 = -_730;
        float _734 = _728 + _732;
        _736 = _734;
        _738 = true;
    }
    else
    {
        float _740 = float(_88);
        float _742 = 1.0 / _740;
        float _744 = _122 * _742;
        _736 = _744;
    }
    _738 = false;
    float _746 = _736;
    float _748 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _750 = _584 * _584;
    float _752 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _754 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _748);
    float _756 = fma(_586, _586, _750);
    float _758 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _760 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _762 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _752);
    float _764 = fma(_588, _588, _756);
    float _766 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _758);
    float _768 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _770 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _762);
    float _772 = rsqrt(_764);
    float _774 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _754);
    float _776 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _768);
    float _778 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _760);
    float _780 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _766);
    float _782 = _770 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _784 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _776);
    float _786 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _778);
    float _788 = _774 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _782 + _790;
    float _794 = _784 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _798 = _788 + _796;
    float _800 = _792 * _792;
    float _802 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _806 = _794 + _804;
    float _808 = sqrt(_780);
    float _810 = fma(_798, _798, _800);
    float _812 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _802);
    float _814 = _772 * _584;
    float _816 = _772 * _586;
    float _818 = fma(_806, _806, _810);
    float _820 = _772 * _588;
    float _822 = _814 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _826 = in.m_53.w;
    float _828 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[8].y, _822);
    float _830 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _832 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _812);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[10].y, _828);
    float _836 = sqrt(_786);
    float _838 = in.m_53.y;
    float _840 = fma(_808, _808, _832);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _844 = _842 != 0;
    float _846 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _848 = abs(_834);
    bool _850 = _848 > 0.99989998340606689453125;
    float _852 = in.m_55.z;
    float _854 = rsqrt(_818);
    float _856 = _824 * _584;
    float _858 = _856 * 8.0;
    float _860 = _824 * _586;
    float _862 = _860 * 8.0;
    float _864 = _824 * _588;
    float _866 = _864 * 8.0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _870 = _868 != 0;
    float _872 = in.m_55.x;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _876 = _874 != 0;
    float _878 = _862 * _862;
    float _880 = fma(_836, _836, _840);
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _884 = _882 != 0;
    float _886 = sqrt(_832);
    float _888 = 0.0;
    float _890 = (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _892 = _806;
    bool _894 = _850;
    if (_850)
    {
        _888 = 0.001000000047497451305389404296875;
    }
    float _896 = _888;
    float _898 = fma(_866, _866, _878);
    if (!_850)
    {
        _890 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _900 = _890;
    float _902 = fma(_858, _858, _878);
    float _904 = _792 * _854;
    float _906 = _798 * _854;
    float _908 = _900;
    if (_850)
    {
        float _910 = fma(_896, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _908 = _910;
    }
    float _912 = _908;
    float _914 = sqrt(_880);
    float _916 = -_904;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _920 = -_906;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _924 = _918 * _918;
    bool _926 = _826 > 0.5;
    float _928 = fma(_922, _922, _924);
    float _930 = _806 * _854;
    float _932 = _924;
    bool _934 = _926;
    if (!_850)
    {
        _932 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _936 = _932;
    float _938 = _936;
    if (_850)
    {
        float _940 = fma(_896, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _938 = _940;
    }
    float _942 = _938;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _948 = -_930;
    float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _806);
    if (!_850)
    {
        _892 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _952 = _892;
    float _954 = _952;
    if (_850)
    {
        float _956 = fma(_896, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _954 = _956;
    }
    float _958 = _954;
    float _960 = sqrt(_898);
    float _962 = fma(_950, _950, _928);
    float _964 = -_912;
    float _966 = _820 * _964;
    float _968 = -_958;
    float _970 = _816 * _968;
    float _972 = _914 + 9.9999997473787516355514526367188e-06;
    bool _974 = _838 > 0.5;
    float _976 = -_942;
    float _978 = -_966;
    float _980 = fma(_816, _976, _978);
    float _982 = -_942;
    float _984 = _814 * _982;
    float _986 = sqrt(_962);
    float _988 = -_912;
    float _990 = -_970;
    float _992 = fma(_814, _988, _990);
    float _994 = -_958;
    float _996 = -_984;
    float _998 = fma(_820, _994, _996);
    float _1000 = _980 * _980;
    float _1002 = _886 * 0.800000011920928955078125;
    float _1004 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1006 = precise::clamp(_1004, 0.0, 1.0);
    float _1008 = 1.0 / _946;
    float _1010 = fma(_998, _998, _1000);
    float _1012 = fma(_1006, -0.64999997615814208984375, 1.0);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1014;
    float _1018 = fma(_992, _992, _1010);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1024 = _886 * (-0.4000000059604644775390625);
    float _1026 = 1.0 / _972;
    float _1028 = _854 * _986;
    float _1030 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1032 = _830 * _1028;
    float _1034 = _846 * _1028;
    float _1036 = fma(_960, 4.999999523162841796875, -0.4999999701976776123046875);
    float _1038 = precise::clamp(_1036, 0.0, 1.0);
    float _1040 = abs(_858);
    float _1042 = 1.0 / _1040;
    float _1044 = in.m_55.y;
    float _1046 = _1016 * _1008;
    float _1048 = 1.0 / _1002;
    float _1050 = _1026 * _852;
    float _1052 = _1038 * _1038;
    float _1054 = rsqrt(_1018);
    float _1056 = _960 * _1042;
    float _1058 = _1056 * 0.25;
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = fma(_1038, -2.0, 3.0);
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1050);
    float _1066 = _1030 * _1028;
    float _1068 = _1026 * _872;
    float _1070 = _1062 * _1052;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1074 = _746 + _1072;
    float _1076 = _960 * _1048;
    float _1078 = _1066 * _1064;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1044);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1068);
    float _1084 = fma(_866, _866, _902);
    bool _1086 = _1076 < 0.5;
    float _1088 = float(_1086);
    float _1090 = _1032 * _1080;
    float _1092 = _1034 * _1082;
    float _1094 = _980 * _1054;
    float _1096 = _992 * _1054;
    float _1098 = _998 * _1054;
    float _1100 = _1090 * _820;
    float _1102 = _816 * _1094;
    float _1104 = _814 * _1096;
    float _1106 = _1090 * _816;
    float _1108 = _1054;
    float _1110 = _1012;
    if (_844)
    {
        float _1112 = in.m_53.x;
        _1108 = _1112;
    }
    float _1114 = _1108;
    float _1116 = -_1102;
    float _1118 = fma(_814, _1098, _1116);
    float _1120 = _1090 * _814;
    float _1122 = -_1104;
    float _1124 = fma(_820, _1094, _1122);
    float _1126 = _820 * _1098;
    float _1128 = fma(_1092, _1098, _1106);
    float _1130 = rsqrt(_1084);
    float _1132 = fma(_1092, _1094, _1120);
    float _1134 = -_1126;
    float _1136 = fma(_816, _1096, _1134);
    float _1138 = fma(_1092, _1096, _1100);
    float _1140 = fma(_1078, _1124, _1128);
    float _1142 = fma(_1078, _1118, _1138);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1148 = fma(_1078, _1136, _1132);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1154 = _1060 * _1060;
    float _1156 = in.m_57.y;
    float _1158 = -_1070;
    float _1160 = _1158 + 1.0;
    float _1162 = 1.0 / _1146;
    float _1164 = _858 * _1130;
    float _1166 = _862 * _1130;
    float _1168 = fma(_1060, -2.0, 3.0);
    float _1170 = _866 * _1130;
    float _1172 = _1148 * _1164;
    if (_844)
    {
        bool _1174 = _1114 > 0.5;
        _894 = _1174;
    }
    bool _1176 = _894;
    float _1178 = fma(_1168, _1154, _1160);
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = 1.0 / _1152;
    float _1184 = fma(_1140, _1166, _1172);
    float _1186 = _1146;
    if (_870)
    {
        float _1188 = in.m_53.z;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = -_1088;
    float _1194 = fma(_1192, _1180, 1.0);
    float _1196 = fma(_1142, _1170, _1184);
    bool _1198 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1200 = isnan(_746);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = _1166 * _1196;
    float _1212 = _1170 * _1196;
    float _1214 = fma(_1194, 0.89999997615814208984375, 0.100000001490116119384765625);
    bool _1216 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1218 = isnan(_746);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = -_1210;
    float _1230 = _1140 + _1228;
    float _1232 = -_1212;
    float _1234 = _1142 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1236;
    float _1240 = _1022 * _1162;
    float _1242 = fma(_1210, _1214, _1230);
    float _1244 = fma(_1212, _1214, _1234);
    float _1246 = -_1156;
    float _1248 = _1246 + 1.0;
    float _1250 = _1238 * _1182;
    float _1252 = _788 + _1242;
    float _1254 = _794 + _1244;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1258 = _746 + _1256;
    int _1260 = _926 ? as_type<int>(_1248) : as_type<int>(_1156);
    float _1262 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1264 = _1252 + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1268 = _1254 + _1266;
    float _1270 = _1156;
    if (_870)
    {
        bool _1272 = _1190 > 0.5;
        _934 = _1272;
    }
    bool _1274 = _934;
    float _1276 = fma(_1046, _1258, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1278 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1280 = isnan(_746);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = fma(_1264, _1012, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1292 = fma(_1268, _1012, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1294 = fma(_1240, _1074, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1296 = -_1208;
    float _1298 = _1296 + 1.0;
    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1302 = _1290 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1306 = _1292 + _1304;
    float _1308 = -_1288;
    float _1310 = _1308 + 1.0;
    float _1312 = _1226 * _1298;
    float _1314 = _1302 * _1302;
    float _1316 = _1306 * _1306;
    float _1318 = _1208 * _1310;
    float _1320 = _1032 * _1044;
    float _1322 = -_1226;
    float _1324 = _1322 + 1.0;
    float _1326 = _1314 + _1316;
    float _1328 = _1164 * _1196;
    float _1330 = _1214 * _1320;
    bool _1332 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1334 = isnan(_746);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = sqrt(_1326);
    float _1346 = -_1328;
    float _1348 = _1148 + _1346;
    float _1350 = _1130 * _1330;
    float _1352 = in.m_57.x;
    float _1354 = _1342 * _1324;
    float _1356 = fma(_1194, 0.5, 0.5);
    float _1358 = _1350 * _1350;
    float _1360 = _876 ? as_type<float>(_1260) : _1156;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1364 = _1070 * _1356;
    float _1366 = _1024 * _1358;
    float _1368 = _1366 * 0.5;
    float _1370 = fma(_1328, _1214, _1348);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1374 = _746 + _1372;
    float _1376 = _1364 * _1364;
    float _1378 = _1276 * _1354;
    float _1380 = _782 + _1370;
    bool _1382 = _1344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1386 = -_1342;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_1368, _1376, _1380);
    float _1392 = fma(_1250, _1374, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1394 = _1380;
    float _1396 = _1314;
    int _1398 = as_type<int>(_1344);
    float _1400 = _1316;
    float _1402 = _1290;
    float _1404 = _1292;
    float _1406 = _1326;
    if (_884)
    {
        float _1408 = _974 ? _1248 : _1156;
        _1270 = _1408;
    }
    float _1410 = _1270;
    float _1412 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1378);
    float _1414 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1416 = _1390 + _1414;
    float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1420 = fma(_1294, _1312, _1412);
    float _1422 = fma(_1416, _1012, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    int _1424 = as_type<int>(_1416);
    float _1426 = _1352;
    if (!_844)
    {
        _1394 = _1352;
    }
    float _1428 = _1394;
    float _1430 = _1428;
    if (!_1382)
    {
        _1110 = _1422;
    }
    float _1432 = _1110;
    bool _1434 = !_1382;
    float _1436 = _1432;
    float _1438 = _1418;
    if (!_1434)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1344 + _1442;
        float _1446 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = rsqrt(_1326);
        float _1450 = _1444 * _1440;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = cos(_1458);
        float _1462 = fma(_1456, _1446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1464 = _1448 * _1462;
        float _1466 = fma(_1302, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = _1460 + (-1.0);
        float _1470 = fma(_1306, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1474 = _1466 + _1472;
        float _1476 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1480 = _1470 + _1478;
        float _1482 = _1474 * _1474;
        float _1484 = fma(_1422, _1460, _1476);
        float _1486 = _1480 * _1480;
        _1436 = _1484;
        _1396 = _1482;
        _1398 = as_type<int>(_1476);
        _1400 = _1486;
        _1424 = as_type<int>(_1452);
        _1402 = _1466;
        _1404 = _1470;
        _1406 = _1448;
    }
    float _1488 = _1436;
    float _1490 = _1396;
    int _1492 = _1398;
    float _1494 = _1400;
    int _1496 = _1424;
    float _1498 = _1402;
    float _1500 = _1404;
    float _1502 = _1406;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1506 = _1488 + _1504;
    float _1508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1510 = _1492;
    int _1512 = _1496;
    float _1514 = _1502;
    if (_844)
    {
        float _1516 = -_1352;
        float _1518 = _1516 + 1.0;
        _1510 = as_type<int>(_1518);
    }
    int _1520 = _1510;
    if (_870)
    {
        float _1522 = -_1352;
        float _1524 = _1522 + 1.0;
        _1512 = as_type<int>(_1524);
    }
    int _1526 = _1512;
    float _1528 = fma(_1506, _1506, _1490);
    float _1530 = fma(_1392, _1318, _1420);
    out.m_59.x = _1034;
    out.m_59.y = _1032;
    if (_844)
    {
        float _1532 = _1176 ? as_type<float>(_1520) : _1352;
        _1430 = _1532;
    }
    float _1534 = _1430;
    float _1536 = _1528 + _1494;
    if (_870)
    {
        float _1538 = _1274 ? as_type<float>(_1526) : _1352;
        _1426 = _1538;
    }
    float _1540 = _1426;
    float _1542 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1530);
    float _1544 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1546 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1548 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1550 = sqrt(_1536);
    float _1552 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1554 = _1544 * _1384;
    float _1556 = _1546 * _1508;
    float _1558 = _1548 * _1362;
    float _1560 = _1552 * _1418;
    float _1562 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1558;
    out.m_61.y = _1554;
    out.m_61.z = _1560;
    out.m_61.w = _1556;
    out.m_63.w = _1562;
    bool _1564 = _1550 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1566 = isnan(_1550);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1572 = _1568 || _1570;
    float _1574 = _1556;
    float _1576 = _1508;
    if (!_1572)
    {
        _1438 = 1.0;
    }
    float _1578 = _1438;
    bool _1580 = !_1572;
    float _1582 = _1578;
    if (!_1580)
    {
        bool _1584 = _1550 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1586 = isnan(_1550);
        bool _1588 = _1584 || _1586;
        bool _1590 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1592 = _1588 || _1590;
        if (!_1592)
        {
            float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1596 = _1550 + _1594;
            float _1598 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1600 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1598;
            float _1602 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1604 = _1602 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1606 = 1.0 / _1600;
            float _1608 = _1596 * _1606;
            float _1610 = fma(_1608, _1604, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1582 = _1610;
            _1612 = true;
        }
        else
        {
            bool _1614 = _1550 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1616 = isnan(_1550);
            bool _1618 = _1614 || _1616;
            bool _1620 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1622 = _1618 || _1620;
            if (!_1622)
            {
                float _1624 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1626 = _1550 + _1624;
                float _1628 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1630 = _1628 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1632 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1634 = _1632 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1636 = 1.0 / _1630;
                float _1638 = _1626 * _1636;
                float _1640 = fma(_1638, _1634, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1582 = _1640;
                _1612 = true;
            }
            else
            {
                _1582 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1612 = false;
    float _1642 = _1582;
    float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1646 = _1488 + _1644;
    float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1650 = _1498 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1654 = _1500 + _1652;
    float _1656 = fma(_1646, _1642, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1658 = fma(_1650, _1642, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1660 = fma(_1654, _1642, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1662 = -_904;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1656);
    float _1666 = -_906;
    float _1668 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1658);
    float _1670 = -_930;
    float _1672 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1660);
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1676 = _1664 + _1674;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1680 = _1668 + _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1684 = _1672 + _1682;
    float _1686 = _1676 * _1676;
    float _1688 = fma(_1680, _1680, _1686);
    float _1690 = fma(_1684, _1684, _1688);
    float _1692 = rsqrt(_1690);
    float _1694 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1696 = _1680 * _1694;
    float _1698 = _1684 * _1694;
    float _1700 = _1696 * _1696;
    float _1702 = _1698 * _1698;
    float _1704 = _1700 + _1702;
    float _1706 = sqrt(_1704);
    bool _1708 = _1706 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1712 = _1706 + _1710;
    float _1714 = _1684;
    float _1716 = _1704;
    float _1718 = _1712;
    float _1720 = _1676;
    if (_1708)
    {
        float _1722 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1714 = _1722;
    }
    float _1724 = _1714;
    if (_1708)
    {
        float _1726 = rsqrt(_1704);
        _1716 = _1726;
    }
    float _1728 = _1716;
    float _1730 = _1728;
    if (_1708)
    {
        float _1732 = _1712 * _1724;
        _1718 = _1732;
    }
    float _1734 = _1718;
    if (_1708)
    {
        float _1736 = _1734 * 0.15915493667125701904296875;
        _1574 = _1736;
    }
    float _1738 = _1574;
    float _1740 = _1724;
    if (_1708)
    {
        float _1742 = _1738 * 6.283185482025146484375;
        float _1744 = sin(_1742);
        _1740 = _1744;
    }
    float _1746 = _1740;
    float _1748 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1750 = precise::max(0.0, _1748);
    float _1752 = _1686;
    float _1754 = _1750;
    if (_1708)
    {
        float _1756 = _1738 * 6.283185482025146484375;
        float _1758 = cos(_1756);
        _1752 = _1758;
    }
    float _1760 = _1752;
    float _1762 = -_1694;
    float _1764 = -_1750;
    float _1766 = fma(_1676, _1762, _1764);
    if (_1708)
    {
        float _1768 = _1766 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1754 = _1768;
    }
    float _1770 = _1754;
    float _1772 = sqrt(_1690);
    float _1774 = _1746;
    float _1776 = _1770;
    if (_1708)
    {
        float _1778 = fma(_1746, _1770, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1720 = _1778;
    }
    float _1780 = _1720;
    float _1782 = _1780;
    if (!_1708)
    {
        _1774 = _1696;
    }
    float _1784 = _1774;
    float _1786 = _1784;
    float _1788 = _1760;
    if (_1708)
    {
        float _1790 = _1760 + (-1.0);
        _1776 = _1790;
    }
    float _1792 = _1776;
    float _1794 = _1792;
    if (_1708)
    {
        float _1796 = _1728 * _1780;
        _1514 = _1796;
    }
    float _1798 = _1514;
    if (!_1708)
    {
        _1782 = _1766;
    }
    float _1800 = _1782;
    float _1802 = _1800;
    if (_1708)
    {
        float _1804 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1804;
    }
    float _1806 = _1576;
    if (_1708)
    {
        float _1808 = _1696 * _1798;
        _1786 = _1808;
    }
    float _1810 = _1786;
    if (!_1708)
    {
        _1794 = _1698;
    }
    float _1812 = _1794;
    float _1814 = _1812;
    if (_1708)
    {
        float _1816 = _1698 * _1798;
        _1814 = _1816;
    }
    float _1818 = _1814;
    if (!_1708)
    {
        _1730 = _1700;
    }
    float _1820 = _1730;
    float _1822 = _1820;
    if (_1708)
    {
        float _1824 = fma(_1766, _1760, _1806);
        _1802 = _1824;
    }
    float _1826 = _1802;
    if (_1708)
    {
        float _1828 = _1810 * _1810;
        _1822 = _1828;
    }
    float _1830 = _1822;
    if (!_1708)
    {
        _1788 = _1702;
    }
    float _1832 = _1788;
    float _1834 = _1832;
    if (_1708)
    {
        float _1836 = _1818 * _1818;
        _1834 = _1836;
    }
    float _1838 = _1834;
    float _1840 = fma(_1826, _1826, _1830);
    float _1842 = _1840 + _1838;
    float _1844 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1848 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1846);
    float _1850 = precise::clamp(_1848, 0.0, 1.0);
    float _1852 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1854 = rsqrt(_1842);
    float _1856 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1844);
    float _1858 = -_1850;
    float _1860 = _1858 + 1.0;
    float _1862 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1852);
    float _1864 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1866 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1856);
    float _1868 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1870 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1862);
    float _1872 = abs(_1860);
    float _1874 = log2(_1872);
    float _1876 = _1866 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1878 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1868);
    float _1880 = _1870 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1882 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1884 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1886 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1878);
    float _1888 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1882);
    float _1890 = -_1884;
    float _1892 = fma(_1890, _1864, 1.0);
    float _1894 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1898 = _1854 * _1810;
    float _1900 = _1854 * _1826;
    float _1902 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1888);
    float _1904 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1896);
    float _1906 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1908 = _1854 * _1818;
    float _1910 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1912 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1914 = -_1906;
    float _1916 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1914);
    float _1918 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1904);
    float _1920 = log2(_1892);
    float _1922 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1924 = -_1908;
    float _1926 = fma(_1924, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1916);
    float _1928 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1918);
    float _1930 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1932 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1922);
    float _1934 = fma(_1926, -0.5, 0.5);
    float _1936 = fma(_1926, 0.5, 0.5);
    float _1938 = exp2(_1912);
    float _1940 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1930);
    float _1942 = _1900 + 1.0;
    float _1944 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1932);
    float _1946 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1940);
    float _1948 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1944);
    float _1950 = 1.0 / _1928;
    float _1952 = fma(_1936, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1954 = _1920 * 0.693147182464599609375;
    float _1956 = fma(_1936, _1952, -0.212114393711090087890625);
    float _1958 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1960 = sqrt(_1934);
    float _1962 = -_1900;
    float _1964 = fma(_1938, _1942, _1962);
    float _1966 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1946);
    float _1968 = fma(_1936, _1956, 1.570728778839111328125);
    float _1970 = fma(_1964, 0.5, 0.5);
    float _1972 = _1966 * _1950;
    float _1974 = _1948 * _1950;
    float _1976 = fma(_1972, 0.5, 0.5);
    float _1978 = fma(_1974, -0.5, 0.5);
    float _1980 = _1960 * 0.636619746685028076171875;
    float _1982 = -_1968;
    float _1984 = fma(_1980, _1982, 1.0);
    float3 _5374 = float3(_1976, _1978, _1958);
    float _1986 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5374, float3(0.0), isnan(_5374)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5374, float3(0.0), isnan(_5374)), level(0.0)).x;
    float3 _5385 = float3(_1976, _1978, _1958);
    float4 _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5385, float3(0.0), isnan(_5385)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5385, float3(0.0), isnan(_5385)), level(0.0)).xyzw;
    float _1991 = _1989.x;
    float _1993 = _1989.y;
    float _1995 = _1989.z;
    float _1997 = _1989.w;
    float2 _5402 = float2(_1984, _1970);
    float3 _2001 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5402, float2(0.0), isnan(_5402)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5402, float2(0.0), isnan(_5402)), level(0.0)).xyz;
    float _2003 = _2001.x;
    float _2005 = _2001.y;
    float _2007 = _2001.z;
    float _2009 = -_904;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _2013 = -_906;
    float _2015 = fma(_2013, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _2017 = -_930;
    float _2019 = fma(_2017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _794);
    float _2021 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2023 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2025 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2027 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2023);
    float _2029 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2025);
    float _2031 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2027);
    float _2033 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2029);
    float _2035 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2037 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2039 = 1.0 / _2035;
    float _2041 = _2037 + _2035;
    float _2043 = _2041 * _2039;
    float _2045 = _2043 * 0.5;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2049 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2047);
    bool _2051 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.5);
    bool _2059 = _2055 || _2057;
    float _2061 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2063 = 1.0 / _2049;
    float _2065 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2061);
    float _2067 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2065);
    float _2069 = exp2(_2021);
    float _2071 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2067);
    float _2073 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2075 = _2045;
    if (_2059)
    {
        _2073 = 1.0;
    }
    float _2077 = _2073;
    float _2079 = _2077;
    if (_2059)
    {
        _2075 = 1.0;
    }
    float _2081 = _2075;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2085 = _2063 * _2083;
    float _2087 = _2081;
    if (!_2059)
    {
        float _2089 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2091 = _2089 * 0.15915493667125701904296875;
        float _2093 = _2091 * 6.283185482025146484375;
        float _2095 = cos(_2093);
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2099 = _2097 * 0.15915493667125701904296875;
        float _2101 = _2091 * 6.283185482025146484375;
        float _2103 = sin(_2101);
        float _2105 = 1.0 / _2095;
        float _2107 = _2099 * 6.283185482025146484375;
        float _2109 = cos(_2107);
        float _2111 = _2103 * _2105;
        float _2113 = _2099 * 6.283185482025146484375;
        float _2115 = sin(_2113);
        float _2117 = _2109 * _2111;
        float _2119 = 1.0 / _2117;
        float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2123 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2121;
        float _2125 = 1.0 / _2123;
        float _2127 = _2115 * _2119;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2131 = fma(_2085, _2127, _2129);
        float _2133 = _2131 * _2125;
        float _2135 = precise::clamp(_2133, 0.0, 1.0);
        _2079 = _2135;
    }
    float _2137 = _2079;
    if (!_2059)
    {
        float _2139 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2141 = _2139 * 0.15915493667125701904296875;
        float _2143 = _2141 * 6.283185482025146484375;
        float _2145 = cos(_2143);
        float _2147 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2149 = _2147 * 0.15915493667125701904296875;
        float _2151 = _2141 * 6.283185482025146484375;
        float _2153 = sin(_2151);
        float _2155 = 1.0 / _2145;
        float _2157 = _2149 * 6.283185482025146484375;
        float _2159 = cos(_2157);
        float _2161 = _2153 * _2155;
        float _2163 = _2149 * 6.283185482025146484375;
        float _2165 = sin(_2163);
        float _2167 = _2159 * _2161;
        float _2169 = 1.0 / _2167;
        float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2173 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2171;
        float _2175 = 1.0 / _2173;
        float _2177 = _2165 * _2169;
        float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2181 = fma(_2085, _2177, _2179);
        float _2183 = _2181 * _2175;
        float _2185 = precise::clamp(_2183, 0.0, 1.0);
        float _2187 = -_2185;
        float _2189 = _2187 + 1.0;
        _2087 = _2189;
    }
    float _2191 = _2087;
    float _2193 = _2137 * _2191;
    float _2195 = _2071 + _1928;
    float _2197 = -_2069;
    float _2199 = _2197 + 1.0;
    bool _2201 = _2137 > 0.0;
    bool _2203 = isnan(_2137);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(0.0);
    bool _2209 = _2205 || _2207;
    float _2211 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2213 = _2195 * 0.5;
    float _2215 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2217 = _2191 <= 0.0;
    bool _2219 = !_2209;
    bool _2221 = _2217 || _2219;
    out.m_65.x = _1668;
    out.m_65.y = _1664;
    out.m_65.z = _1672;
    float _2223 = _2215 * _1986;
    float _2225 = -_2215;
    float _2227 = _2225 + 1.0;
    float _2229 = _2211 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2231 = _1997 * _2223;
    float _2233 = _2007 * _2223;
    float _2235 = _1997 * _2227;
    out.gl_Position.x = _1966;
    out.gl_Position.y = _1948;
    out.gl_Position.z = _2071;
    out.gl_Position.w = _1928;
    float _2237 = fma(_2003, _2231, _1991);
    float _2239 = fma(_2005, _2231, _1993);
    float _2241 = fma(_1997, _2233, _1995);
    out.m_67.z = _2213;
    out.m_67.w = _1928;
    out.m_47.x = _2229;
    out.m_69.x = _2237;
    out.m_69.y = _2239;
    out.m_69.z = _2241;
    out.m_69.w = _2235;
    if (!_2221)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2243 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2243;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1612 = false;
    bool _738 = false;
    bool _612 = false;
    bool _462 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2300 = as_type<float>(_104);
        out.gl_Position.z = _2300;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = 0.0;
    if (_118)
    {
        float _128 = float(_88);
        _98 = _128;
    }
    float _130 = _98;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2371 = as_type<float>(_144);
        out.gl_Position.z = _2371;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _154;
    if (!_164)
    {
        float _168 = _154 * _154;
        float _170 = _168 * 0.5;
        _146 = _170;
    }
    float _172 = _146;
    float _174 = 0.0;
    float _176 = _172;
    if (!_164)
    {
        float _178 = _122 * _122;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    if (!_164)
    {
        float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _184;
    }
    float _186 = _176;
    bool _188 = !_164;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _154 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _154);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _124 = _210;
        _190 = _220;
        _126 = _208;
    }
    float _222 = _124;
    float _224 = _190;
    float _226 = _126;
    bool _228 = !_164;
    float _230 = _222;
    float _232 = _226;
    if (!_228)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _154 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _230 = _246;
        _232 = _240;
        _166 = _252;
    }
    float _254 = _230;
    float _256 = _232;
    float _258 = _166;
    float _260 = _256;
    float _262 = _254;
    if (!_164)
    {
        _260 = _122;
    }
    float _264 = _260;
    float _266 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_164)
    {
        float _270 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _262 = _270;
    }
    float _272 = _262;
    bool _274 = !_164;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _122 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _122);
        float _304 = _302 * _290;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    bool _310 = !_164;
    if (!_310)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = 1.0 / _318;
        float _322 = _122 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _336 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _338 = fma(_258, _150, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _150, _334);
    float _344 = fma(_258, _148, _336);
    float _346 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _148, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_258, _152, _346);
    float _358 = fma(_332, _152, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_358;
    float _370 = _356 + _368;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = fma(_362, _362, _364);
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _382 = fma(_370, _370, _374);
    float _384 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = in.m_44.x;
    float _388 = in.m_44.y;
    float _390 = in.m_44.z;
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_356, _366, _390);
    float _418 = _394;
    float _420 = _398;
    float _422 = _400;
    if (!_410)
    {
        bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _426 = !_424;
        if (!_426)
        {
            float _428 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _430 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _434 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _430);
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _438);
            float _446 = _440 * _440;
            float _448 = fma(_442, _442, _446);
            float _450 = fma(_444, _444, _448);
            float _452 = rsqrt(_450);
            float _454 = _452 * 9.9999999747524270787835121154785e-07;
            float _456 = _442 * _454;
            float _458 = _440 * _454;
            float _460 = _444 * _454;
            _418 = _458;
            _420 = _456;
            _422 = _460;
            _462 = true;
        }
        else
        {
            float _464 = _150 * _150;
            float _466 = fma(_148, _148, _464);
            float _468 = fma(_152, _152, _466);
            float _470 = sqrt(_468);
            bool _472 = _470 >= 9.9999999747524270787835121154785e-07;
            bool _474 = isnan(_470);
            bool _476 = _472 || _474;
            bool _478 = isnan(9.9999999747524270787835121154785e-07);
            bool _480 = _476 || _478;
            if (!_480)
            {
                float _482 = _388 * _388;
                float _484 = fma(_386, _386, _482);
                float _486 = fma(_390, _390, _484);
                float _488 = sqrt(_486);
                bool _490 = _488 >= 9.9999999747524270787835121154785e-07;
                bool _492 = isnan(_488);
                bool _494 = _490 || _492;
                bool _496 = isnan(9.9999999747524270787835121154785e-07);
                bool _498 = _494 || _496;
                if (!_498)
                {
                    float _500 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _502 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _500);
                    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _502);
                    float _506 = rsqrt(_504);
                    float _508 = _506 * 9.9999999747524270787835121154785e-07;
                    float _510 = _508 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _512 = _508 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _514 = _508 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _418 = _512;
                    _420 = _510;
                    _422 = _514;
                    _462 = true;
                }
                else
                {
                    float _516 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _520 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _522 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _516);
                    float _524 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _518);
                    float _526 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _520);
                    float _528 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _522);
                    float _530 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _524);
                    float _532 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _526);
                    float _534 = _528 * _528;
                    float _536 = fma(_530, _530, _534);
                    float _538 = fma(_532, _532, _536);
                    float _540 = rsqrt(_538);
                    float _542 = _540 * 9.9999999747524270787835121154785e-07;
                    float _544 = _530 * _542;
                    float _546 = _528 * _542;
                    float _548 = _532 * _542;
                    _418 = _546;
                    _420 = _544;
                    _422 = _548;
                    _462 = true;
                }
            }
            else
            {
                float _550 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _552 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _554 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _556 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _550);
                float _558 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _552);
                float _560 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _554);
                float _562 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _556);
                float _564 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _558);
                float _566 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _560);
                float _568 = _562 * _562;
                float _570 = fma(_564, _564, _568);
                float _572 = fma(_566, _566, _570);
                float _574 = rsqrt(_572);
                float _576 = _574 * 9.9999999747524270787835121154785e-07;
                float _578 = _564 * _576;
                float _580 = _562 * _576;
                float _582 = _566 * _576;
                _418 = _580;
                _420 = _578;
                _422 = _582;
            }
        }
    }
    _462 = false;
    float _584 = _418;
    float _586 = _420;
    float _588 = _422;
    bool _590 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _592 = !_590;
    float _610;
    if (!_592)
    {
        float _594 = in.m_53.x;
        float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _598 = _594 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _602 = _600 * _596;
        float _604 = floor(_602);
        float _606 = -_604;
        float _608 = _602 + _606;
        _610 = _608;
        _612 = true;
    }
    else
    {
        float _614 = float(_88);
        float _616 = 1.0 / _614;
        float _618 = _122 * _616;
        _610 = _618;
    }
    _612 = false;
    float _620 = _610;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _624 = _620 + _622;
    bool _626 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _628 = isnan(_620);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _638;
    float _642 = -_636;
    float _644 = _642 + 1.0;
    bool _646 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _648 = isnan(_620);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = 1.0 / _640;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _664;
    bool _668 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _670 = _656 * _644;
    float _672 = -_656;
    float _674 = _672 + 1.0;
    float _676 = _624 * _658;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _678;
    float _682 = in.m_51.x;
    float _684 = in.m_51.y;
    float _686 = in.m_51.z;
    float _688 = fma(_662, _676, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _690 = fma(_680, _676, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _692 = fma(_666, _676, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _694 = _688 * _670;
    float _696 = _690 * _670;
    float _698 = _692 * _670;
    float _700 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].x, _694);
    float _702 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].y, _696);
    float _704 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[143].z, _698);
    float _706 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[144].x, _700);
    float _708 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[144].y, _702);
    float _710 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[144].z, _704);
    float _712 = _706 * _682;
    float _714 = _708 * _684;
    float _716 = _710 * _686;
    bool _718 = !_668;
    float _736;
    if (!_718)
    {
        float _720 = in.m_53.x;
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _724 = _720 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _728 = _726 * _722;
        float _730 = floor(_728);
        float _732 = -_730;
        float _734 = _728 + _732;
        _736 = _734;
        _738 = true;
    }
    else
    {
        float _740 = float(_88);
        float _742 = 1.0 / _740;
        float _744 = _122 * _742;
        _736 = _744;
    }
    _738 = false;
    float _746 = _736;
    float _748 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _750 = _584 * _584;
    float _752 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _754 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _748);
    float _756 = fma(_586, _586, _750);
    float _758 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _760 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _762 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _752);
    float _764 = fma(_588, _588, _756);
    float _766 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _758);
    float _768 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _770 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _762);
    float _772 = rsqrt(_764);
    float _774 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _754);
    float _776 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _768);
    float _778 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _760);
    float _780 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _766);
    float _782 = _770 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _784 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _776);
    float _786 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _778);
    float _788 = _774 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _782 + _790;
    float _794 = _784 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _798 = _788 + _796;
    float _800 = _792 * _792;
    float _802 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _806 = _794 + _804;
    float _808 = sqrt(_780);
    float _810 = fma(_798, _798, _800);
    float _812 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _802);
    float _814 = _772 * _584;
    float _816 = _772 * _586;
    float _818 = fma(_806, _806, _810);
    float _820 = _772 * _588;
    float _822 = _814 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _826 = in.m_53.w;
    float _828 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[8].y, _822);
    float _830 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _832 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _812);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[10].y, _828);
    float _836 = sqrt(_786);
    float _838 = in.m_53.y;
    float _840 = fma(_808, _808, _832);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _844 = _842 != 0;
    float _846 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _848 = abs(_834);
    bool _850 = _848 > 0.99989998340606689453125;
    float _852 = in.m_55.z;
    float _854 = rsqrt(_818);
    float _856 = _824 * _584;
    float _858 = _856 * 8.0;
    float _860 = _824 * _586;
    float _862 = _860 * 8.0;
    float _864 = _824 * _588;
    float _866 = _864 * 8.0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _870 = _868 != 0;
    float _872 = in.m_55.x;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _876 = _874 != 0;
    float _878 = _862 * _862;
    float _880 = fma(_836, _836, _840);
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _884 = _882 != 0;
    float _886 = sqrt(_832);
    float _888 = 0.0;
    float _890 = (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _892 = _806;
    bool _894 = _850;
    if (_850)
    {
        _888 = 0.001000000047497451305389404296875;
    }
    float _896 = _888;
    float _898 = fma(_866, _866, _878);
    if (!_850)
    {
        _890 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _900 = _890;
    float _902 = fma(_858, _858, _878);
    float _904 = _792 * _854;
    float _906 = _798 * _854;
    float _908 = _900;
    if (_850)
    {
        float _910 = fma(_896, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _908 = _910;
    }
    float _912 = _908;
    float _914 = sqrt(_880);
    float _916 = -_904;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _920 = -_906;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _924 = _918 * _918;
    bool _926 = _826 > 0.5;
    float _928 = fma(_922, _922, _924);
    float _930 = _806 * _854;
    float _932 = _924;
    bool _934 = _926;
    if (!_850)
    {
        _932 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _936 = _932;
    float _938 = _936;
    if (_850)
    {
        float _940 = fma(_896, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _938 = _940;
    }
    float _942 = _938;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _948 = -_930;
    float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _806);
    if (!_850)
    {
        _892 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _952 = _892;
    float _954 = _952;
    if (_850)
    {
        float _956 = fma(_896, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _954 = _956;
    }
    float _958 = _954;
    float _960 = sqrt(_898);
    float _962 = fma(_950, _950, _928);
    float _964 = -_912;
    float _966 = _820 * _964;
    float _968 = -_958;
    float _970 = _816 * _968;
    float _972 = _914 + 9.9999997473787516355514526367188e-06;
    bool _974 = _838 > 0.5;
    float _976 = -_942;
    float _978 = -_966;
    float _980 = fma(_816, _976, _978);
    float _982 = -_942;
    float _984 = _814 * _982;
    float _986 = sqrt(_962);
    float _988 = -_912;
    float _990 = -_970;
    float _992 = fma(_814, _988, _990);
    float _994 = -_958;
    float _996 = -_984;
    float _998 = fma(_820, _994, _996);
    float _1000 = _980 * _980;
    float _1002 = _886 * 0.800000011920928955078125;
    float _1004 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1006 = precise::clamp(_1004, 0.0, 1.0);
    float _1008 = 1.0 / _946;
    float _1010 = fma(_998, _998, _1000);
    float _1012 = fma(_1006, -0.64999997615814208984375, 1.0);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1014;
    float _1018 = fma(_992, _992, _1010);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1024 = _886 * (-0.4000000059604644775390625);
    float _1026 = 1.0 / _972;
    float _1028 = _854 * _986;
    float _1030 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1032 = _830 * _1028;
    float _1034 = _846 * _1028;
    float _1036 = fma(_960, 4.999999523162841796875, -0.4999999701976776123046875);
    float _1038 = precise::clamp(_1036, 0.0, 1.0);
    float _1040 = abs(_858);
    float _1042 = 1.0 / _1040;
    float _1044 = in.m_55.y;
    float _1046 = _1016 * _1008;
    float _1048 = 1.0 / _1002;
    float _1050 = _1026 * _852;
    float _1052 = _1038 * _1038;
    float _1054 = rsqrt(_1018);
    float _1056 = _960 * _1042;
    float _1058 = _1056 * 0.25;
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = fma(_1038, -2.0, 3.0);
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1050);
    float _1066 = _1030 * _1028;
    float _1068 = _1026 * _872;
    float _1070 = _1062 * _1052;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1074 = _746 + _1072;
    float _1076 = _960 * _1048;
    float _1078 = _1066 * _1064;
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1044);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1068);
    float _1084 = fma(_866, _866, _902);
    bool _1086 = _1076 < 0.5;
    float _1088 = float(_1086);
    float _1090 = _1032 * _1080;
    float _1092 = _1034 * _1082;
    float _1094 = _980 * _1054;
    float _1096 = _992 * _1054;
    float _1098 = _998 * _1054;
    float _1100 = _1090 * _820;
    float _1102 = _816 * _1094;
    float _1104 = _814 * _1096;
    float _1106 = _1090 * _816;
    float _1108 = _1054;
    float _1110 = _1012;
    if (_844)
    {
        float _1112 = in.m_53.x;
        _1108 = _1112;
    }
    float _1114 = _1108;
    float _1116 = -_1102;
    float _1118 = fma(_814, _1098, _1116);
    float _1120 = _1090 * _814;
    float _1122 = -_1104;
    float _1124 = fma(_820, _1094, _1122);
    float _1126 = _820 * _1098;
    float _1128 = fma(_1092, _1098, _1106);
    float _1130 = rsqrt(_1084);
    float _1132 = fma(_1092, _1094, _1120);
    float _1134 = -_1126;
    float _1136 = fma(_816, _1096, _1134);
    float _1138 = fma(_1092, _1096, _1100);
    float _1140 = fma(_1078, _1124, _1128);
    float _1142 = fma(_1078, _1118, _1138);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1148 = fma(_1078, _1136, _1132);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1154 = _1060 * _1060;
    float _1156 = in.m_57.y;
    float _1158 = -_1070;
    float _1160 = _1158 + 1.0;
    float _1162 = 1.0 / _1146;
    float _1164 = _858 * _1130;
    float _1166 = _862 * _1130;
    float _1168 = fma(_1060, -2.0, 3.0);
    float _1170 = _866 * _1130;
    float _1172 = _1148 * _1164;
    if (_844)
    {
        bool _1174 = _1114 > 0.5;
        _894 = _1174;
    }
    bool _1176 = _894;
    float _1178 = fma(_1168, _1154, _1160);
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = 1.0 / _1152;
    float _1184 = fma(_1140, _1166, _1172);
    float _1186 = _1146;
    if (_870)
    {
        float _1188 = in.m_53.z;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = -_1088;
    float _1194 = fma(_1192, _1180, 1.0);
    float _1196 = fma(_1142, _1170, _1184);
    bool _1198 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1200 = isnan(_746);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = _1166 * _1196;
    float _1212 = _1170 * _1196;
    float _1214 = fma(_1194, 0.89999997615814208984375, 0.100000001490116119384765625);
    bool _1216 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1218 = isnan(_746);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    float _1228 = -_1210;
    float _1230 = _1140 + _1228;
    float _1232 = -_1212;
    float _1234 = _1142 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1236;
    float _1240 = _1022 * _1162;
    float _1242 = fma(_1210, _1214, _1230);
    float _1244 = fma(_1212, _1214, _1234);
    float _1246 = -_1156;
    float _1248 = _1246 + 1.0;
    float _1250 = _1238 * _1182;
    float _1252 = _788 + _1242;
    float _1254 = _794 + _1244;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1258 = _746 + _1256;
    int _1260 = _926 ? as_type<int>(_1248) : as_type<int>(_1156);
    float _1262 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1264 = _1252 + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1268 = _1254 + _1266;
    float _1270 = _1156;
    if (_870)
    {
        bool _1272 = _1190 > 0.5;
        _934 = _1272;
    }
    bool _1274 = _934;
    float _1276 = fma(_1046, _1258, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1278 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1280 = isnan(_746);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = fma(_1264, _1012, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1292 = fma(_1268, _1012, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1294 = fma(_1240, _1074, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1296 = -_1208;
    float _1298 = _1296 + 1.0;
    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1302 = _1290 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1306 = _1292 + _1304;
    float _1308 = -_1288;
    float _1310 = _1308 + 1.0;
    float _1312 = _1226 * _1298;
    float _1314 = _1302 * _1302;
    float _1316 = _1306 * _1306;
    float _1318 = _1208 * _1310;
    float _1320 = _1032 * _1044;
    float _1322 = -_1226;
    float _1324 = _1322 + 1.0;
    float _1326 = _1314 + _1316;
    float _1328 = _1164 * _1196;
    float _1330 = _1214 * _1320;
    bool _1332 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1334 = isnan(_746);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = sqrt(_1326);
    float _1346 = -_1328;
    float _1348 = _1148 + _1346;
    float _1350 = _1130 * _1330;
    float _1352 = in.m_57.x;
    float _1354 = _1342 * _1324;
    float _1356 = fma(_1194, 0.5, 0.5);
    float _1358 = _1350 * _1350;
    float _1360 = _876 ? as_type<float>(_1260) : _1156;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1364 = _1070 * _1356;
    float _1366 = _1024 * _1358;
    float _1368 = _1366 * 0.5;
    float _1370 = fma(_1328, _1214, _1348);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1374 = _746 + _1372;
    float _1376 = _1364 * _1364;
    float _1378 = _1276 * _1354;
    float _1380 = _782 + _1370;
    bool _1382 = _1344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1386 = -_1342;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_1368, _1376, _1380);
    float _1392 = fma(_1250, _1374, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1394 = _1380;
    float _1396 = _1314;
    int _1398 = as_type<int>(_1344);
    float _1400 = _1316;
    float _1402 = _1290;
    float _1404 = _1292;
    float _1406 = _1326;
    if (_884)
    {
        float _1408 = _974 ? _1248 : _1156;
        _1270 = _1408;
    }
    float _1410 = _1270;
    float _1412 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1378);
    float _1414 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1416 = _1390 + _1414;
    float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1420 = fma(_1294, _1312, _1412);
    float _1422 = fma(_1416, _1012, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    int _1424 = as_type<int>(_1416);
    float _1426 = _1352;
    if (!_844)
    {
        _1394 = _1352;
    }
    float _1428 = _1394;
    float _1430 = _1428;
    if (!_1382)
    {
        _1110 = _1422;
    }
    float _1432 = _1110;
    bool _1434 = !_1382;
    float _1436 = _1432;
    float _1438 = _1418;
    if (!_1434)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1344 + _1442;
        float _1446 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = rsqrt(_1326);
        float _1450 = _1444 * _1440;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = cos(_1458);
        float _1462 = fma(_1456, _1446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1464 = _1448 * _1462;
        float _1466 = fma(_1302, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = _1460 + (-1.0);
        float _1470 = fma(_1306, _1464, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1474 = _1466 + _1472;
        float _1476 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1480 = _1470 + _1478;
        float _1482 = _1474 * _1474;
        float _1484 = fma(_1422, _1460, _1476);
        float _1486 = _1480 * _1480;
        _1436 = _1484;
        _1396 = _1482;
        _1398 = as_type<int>(_1476);
        _1400 = _1486;
        _1424 = as_type<int>(_1452);
        _1402 = _1466;
        _1404 = _1470;
        _1406 = _1448;
    }
    float _1488 = _1436;
    float _1490 = _1396;
    int _1492 = _1398;
    float _1494 = _1400;
    int _1496 = _1424;
    float _1498 = _1402;
    float _1500 = _1404;
    float _1502 = _1406;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1506 = _1488 + _1504;
    float _1508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1510 = _1492;
    int _1512 = _1496;
    float _1514 = _1502;
    if (_844)
    {
        float _1516 = -_1352;
        float _1518 = _1516 + 1.0;
        _1510 = as_type<int>(_1518);
    }
    int _1520 = _1510;
    if (_870)
    {
        float _1522 = -_1352;
        float _1524 = _1522 + 1.0;
        _1512 = as_type<int>(_1524);
    }
    int _1526 = _1512;
    float _1528 = fma(_1506, _1506, _1490);
    float _1530 = fma(_1392, _1318, _1420);
    out.m_59.x = _1034;
    out.m_59.y = _1032;
    if (_844)
    {
        float _1532 = _1176 ? as_type<float>(_1520) : _1352;
        _1430 = _1532;
    }
    float _1534 = _1430;
    float _1536 = _1528 + _1494;
    if (_870)
    {
        float _1538 = _1274 ? as_type<float>(_1526) : _1352;
        _1426 = _1538;
    }
    float _1540 = _1426;
    float _1542 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1530);
    float _1544 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1546 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1548 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1550 = sqrt(_1536);
    float _1552 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1554 = _1544 * _1384;
    float _1556 = _1546 * _1508;
    float _1558 = _1548 * _1362;
    float _1560 = _1552 * _1418;
    float _1562 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1558;
    out.m_61.y = _1554;
    out.m_61.z = _1560;
    out.m_61.w = _1556;
    out.m_63.w = _1562;
    bool _1564 = _1550 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1566 = isnan(_1550);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1572 = _1568 || _1570;
    float _1574 = _1556;
    float _1576 = _1508;
    if (!_1572)
    {
        _1438 = 1.0;
    }
    float _1578 = _1438;
    bool _1580 = !_1572;
    float _1582 = _1578;
    if (!_1580)
    {
        bool _1584 = _1550 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1586 = isnan(_1550);
        bool _1588 = _1584 || _1586;
        bool _1590 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1592 = _1588 || _1590;
        if (!_1592)
        {
            float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1596 = _1550 + _1594;
            float _1598 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1600 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1598;
            float _1602 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1604 = _1602 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1606 = 1.0 / _1600;
            float _1608 = _1596 * _1606;
            float _1610 = fma(_1608, _1604, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1582 = _1610;
            _1612 = true;
        }
        else
        {
            bool _1614 = _1550 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1616 = isnan(_1550);
            bool _1618 = _1614 || _1616;
            bool _1620 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1622 = _1618 || _1620;
            if (!_1622)
            {
                float _1624 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1626 = _1550 + _1624;
                float _1628 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1630 = _1628 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1632 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1634 = _1632 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1636 = 1.0 / _1630;
                float _1638 = _1626 * _1636;
                float _1640 = fma(_1638, _1634, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1582 = _1640;
                _1612 = true;
            }
            else
            {
                _1582 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1612 = false;
    float _1642 = _1582;
    float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1646 = _1488 + _1644;
    float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1650 = _1498 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1654 = _1500 + _1652;
    float _1656 = fma(_1646, _1642, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1658 = fma(_1650, _1642, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1660 = fma(_1654, _1642, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1662 = -_904;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1656);
    float _1666 = -_906;
    float _1668 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1658);
    float _1670 = -_930;
    float _1672 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1660);
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1676 = _1664 + _1674;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1680 = _1668 + _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1684 = _1672 + _1682;
    float _1686 = _1676 * _1676;
    float _1688 = fma(_1680, _1680, _1686);
    float _1690 = fma(_1684, _1684, _1688);
    float _1692 = rsqrt(_1690);
    float _1694 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1696 = _1680 * _1694;
    float _1698 = _1684 * _1694;
    float _1700 = _1696 * _1696;
    float _1702 = _1698 * _1698;
    float _1704 = _1700 + _1702;
    float _1706 = sqrt(_1704);
    bool _1708 = _1706 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1712 = _1706 + _1710;
    float _1714 = _1684;
    float _1716 = _1704;
    float _1718 = _1712;
    float _1720 = _1676;
    if (_1708)
    {
        float _1722 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1714 = _1722;
    }
    float _1724 = _1714;
    if (_1708)
    {
        float _1726 = rsqrt(_1704);
        _1716 = _1726;
    }
    float _1728 = _1716;
    float _1730 = _1728;
    if (_1708)
    {
        float _1732 = _1712 * _1724;
        _1718 = _1732;
    }
    float _1734 = _1718;
    if (_1708)
    {
        float _1736 = _1734 * 0.15915493667125701904296875;
        _1574 = _1736;
    }
    float _1738 = _1574;
    float _1740 = _1724;
    if (_1708)
    {
        float _1742 = _1738 * 6.283185482025146484375;
        float _1744 = sin(_1742);
        _1740 = _1744;
    }
    float _1746 = _1740;
    float _1748 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1750 = precise::max(0.0, _1748);
    float _1752 = _1686;
    float _1754 = _1750;
    if (_1708)
    {
        float _1756 = _1738 * 6.283185482025146484375;
        float _1758 = cos(_1756);
        _1752 = _1758;
    }
    float _1760 = _1752;
    float _1762 = -_1694;
    float _1764 = -_1750;
    float _1766 = fma(_1676, _1762, _1764);
    if (_1708)
    {
        float _1768 = _1766 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1754 = _1768;
    }
    float _1770 = _1754;
    float _1772 = sqrt(_1690);
    float _1774 = _1746;
    float _1776 = _1770;
    if (_1708)
    {
        float _1778 = fma(_1746, _1770, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1720 = _1778;
    }
    float _1780 = _1720;
    float _1782 = _1780;
    if (!_1708)
    {
        _1774 = _1696;
    }
    float _1784 = _1774;
    float _1786 = _1784;
    float _1788 = _1760;
    if (_1708)
    {
        float _1790 = _1760 + (-1.0);
        _1776 = _1790;
    }
    float _1792 = _1776;
    float _1794 = _1792;
    if (_1708)
    {
        float _1796 = _1728 * _1780;
        _1514 = _1796;
    }
    float _1798 = _1514;
    if (!_1708)
    {
        _1782 = _1766;
    }
    float _1800 = _1782;
    float _1802 = _1800;
    if (_1708)
    {
        float _1804 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1804;
    }
    float _1806 = _1576;
    if (_1708)
    {
        float _1808 = _1696 * _1798;
        _1786 = _1808;
    }
    float _1810 = _1786;
    if (!_1708)
    {
        _1794 = _1698;
    }
    float _1812 = _1794;
    float _1814 = _1812;
    if (_1708)
    {
        float _1816 = _1698 * _1798;
        _1814 = _1816;
    }
    float _1818 = _1814;
    if (!_1708)
    {
        _1730 = _1700;
    }
    float _1820 = _1730;
    float _1822 = _1820;
    if (_1708)
    {
        float _1824 = fma(_1766, _1760, _1806);
        _1802 = _1824;
    }
    float _1826 = _1802;
    if (_1708)
    {
        float _1828 = _1810 * _1810;
        _1822 = _1828;
    }
    float _1830 = _1822;
    if (!_1708)
    {
        _1788 = _1702;
    }
    float _1832 = _1788;
    float _1834 = _1832;
    if (_1708)
    {
        float _1836 = _1818 * _1818;
        _1834 = _1836;
    }
    float _1838 = _1834;
    float _1840 = fma(_1826, _1826, _1830);
    float _1842 = _1840 + _1838;
    float _1844 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1848 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1846);
    float _1850 = precise::clamp(_1848, 0.0, 1.0);
    float _1852 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1854 = rsqrt(_1842);
    float _1856 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1844);
    float _1858 = -_1850;
    float _1860 = _1858 + 1.0;
    float _1862 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1852);
    float _1864 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1866 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1856);
    float _1868 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1870 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1862);
    float _1872 = abs(_1860);
    float _1874 = log2(_1872);
    float _1876 = _1866 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1878 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1868);
    float _1880 = _1870 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1882 = _1664 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1884 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1886 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1878);
    float _1888 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1882);
    float _1890 = -_1884;
    float _1892 = fma(_1890, _1864, 1.0);
    float _1894 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1898 = _1854 * _1810;
    float _1900 = _1854 * _1826;
    float _1902 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1888);
    float _1904 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1896);
    float _1906 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1908 = _1854 * _1818;
    float _1910 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1912 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1914 = -_1906;
    float _1916 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1914);
    float _1918 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1904);
    float _1920 = log2(_1892);
    float _1922 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1924 = -_1908;
    float _1926 = fma(_1924, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1916);
    float _1928 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1918);
    float _1930 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1932 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1922);
    float _1934 = fma(_1926, -0.5, 0.5);
    float _1936 = fma(_1926, 0.5, 0.5);
    float _1938 = exp2(_1912);
    float _1940 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1930);
    float _1942 = _1900 + 1.0;
    float _1944 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1932);
    float _1946 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1940);
    float _1948 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1944);
    float _1950 = 1.0 / _1928;
    float _1952 = fma(_1936, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1954 = _1920 * 0.693147182464599609375;
    float _1956 = fma(_1936, _1952, -0.212114393711090087890625);
    float _1958 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1960 = sqrt(_1934);
    float _1962 = -_1900;
    float _1964 = fma(_1938, _1942, _1962);
    float _1966 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1946);
    float _1968 = fma(_1936, _1956, 1.570728778839111328125);
    float _1970 = fma(_1964, 0.5, 0.5);
    float _1972 = _1966 * _1950;
    float _1974 = _1948 * _1950;
    float _1976 = fma(_1972, 0.5, 0.5);
    float _1978 = fma(_1974, -0.5, 0.5);
    float _1980 = _1960 * 0.636619746685028076171875;
    float _1982 = -_1968;
    float _1984 = fma(_1980, _1982, 1.0);
    float3 _5374 = float3(_1976, _1978, _1958);
    float _1986 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5374, float3(0.0), isnan(_5374)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5374, float3(0.0), isnan(_5374)), level(0.0)).x;
    float3 _5385 = float3(_1976, _1978, _1958);
    float4 _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5385, float3(0.0), isnan(_5385)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5385, float3(0.0), isnan(_5385)), level(0.0)).xyzw;
    float _1991 = _1989.x;
    float _1993 = _1989.y;
    float _1995 = _1989.z;
    float _1997 = _1989.w;
    float2 _5402 = float2(_1984, _1970);
    float3 _2001 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5402, float2(0.0), isnan(_5402)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5402, float2(0.0), isnan(_5402)), level(0.0)).xyz;
    float _2003 = _2001.x;
    float _2005 = _2001.y;
    float _2007 = _2001.z;
    float _2009 = -_904;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _2013 = -_906;
    float _2015 = fma(_2013, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _2017 = -_930;
    float _2019 = fma(_2017, (*spvDescriptorSet0.vp_c9)._m0[18].w, _794);
    float _2021 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2023 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2025 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2027 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2023);
    float _2029 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2025);
    float _2031 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2027);
    float _2033 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2029);
    float _2035 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2037 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2039 = 1.0 / _2035;
    float _2041 = _2037 + _2035;
    float _2043 = _2041 * _2039;
    float _2045 = _2043 * 0.5;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2049 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2047);
    bool _2051 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.5);
    bool _2059 = _2055 || _2057;
    float _2061 = _1880 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2063 = 1.0 / _2049;
    float _2065 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2061);
    float _2067 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2065);
    float _2069 = exp2(_2021);
    float _2071 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2067);
    float _2073 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2075 = _2045;
    if (_2059)
    {
        _2073 = 1.0;
    }
    float _2077 = _2073;
    float _2079 = _2077;
    if (_2059)
    {
        _2075 = 1.0;
    }
    float _2081 = _2075;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2085 = _2063 * _2083;
    float _2087 = _2081;
    if (!_2059)
    {
        float _2089 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2091 = _2089 * 0.15915493667125701904296875;
        float _2093 = _2091 * 6.283185482025146484375;
        float _2095 = cos(_2093);
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2099 = _2097 * 0.15915493667125701904296875;
        float _2101 = _2091 * 6.283185482025146484375;
        float _2103 = sin(_2101);
        float _2105 = 1.0 / _2095;
        float _2107 = _2099 * 6.283185482025146484375;
        float _2109 = cos(_2107);
        float _2111 = _2103 * _2105;
        float _2113 = _2099 * 6.283185482025146484375;
        float _2115 = sin(_2113);
        float _2117 = _2109 * _2111;
        float _2119 = 1.0 / _2117;
        float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2123 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2121;
        float _2125 = 1.0 / _2123;
        float _2127 = _2115 * _2119;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2131 = fma(_2085, _2127, _2129);
        float _2133 = _2131 * _2125;
        float _2135 = precise::clamp(_2133, 0.0, 1.0);
        _2079 = _2135;
    }
    float _2137 = _2079;
    if (!_2059)
    {
        float _2139 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2141 = _2139 * 0.15915493667125701904296875;
        float _2143 = _2141 * 6.283185482025146484375;
        float _2145 = cos(_2143);
        float _2147 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2149 = _2147 * 0.15915493667125701904296875;
        float _2151 = _2141 * 6.283185482025146484375;
        float _2153 = sin(_2151);
        float _2155 = 1.0 / _2145;
        float _2157 = _2149 * 6.283185482025146484375;
        float _2159 = cos(_2157);
        float _2161 = _2153 * _2155;
        float _2163 = _2149 * 6.283185482025146484375;
        float _2165 = sin(_2163);
        float _2167 = _2159 * _2161;
        float _2169 = 1.0 / _2167;
        float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2173 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2171;
        float _2175 = 1.0 / _2173;
        float _2177 = _2165 * _2169;
        float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2181 = fma(_2085, _2177, _2179);
        float _2183 = _2181 * _2175;
        float _2185 = precise::clamp(_2183, 0.0, 1.0);
        float _2187 = -_2185;
        float _2189 = _2187 + 1.0;
        _2087 = _2189;
    }
    float _2191 = _2087;
    float _2193 = _2137 * _2191;
    float _2195 = _2071 + _1928;
    float _2197 = -_2069;
    float _2199 = _2197 + 1.0;
    bool _2201 = _2137 > 0.0;
    bool _2203 = isnan(_2137);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(0.0);
    bool _2209 = _2205 || _2207;
    float _2211 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2213 = _2195 * 0.5;
    float _2215 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2217 = _2191 <= 0.0;
    bool _2219 = !_2209;
    bool _2221 = _2217 || _2219;
    out.m_65.x = _1668;
    out.m_65.y = _1664;
    out.m_65.z = _1672;
    float _2223 = _2215 * _1986;
    float _2225 = -_2215;
    float _2227 = _2225 + 1.0;
    float _2229 = _2211 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2231 = _1997 * _2223;
    float _2233 = _2007 * _2223;
    float _2235 = _1997 * _2227;
    out.gl_Position.x = _1966;
    out.gl_Position.y = _1948;
    out.gl_Position.z = _2071;
    out.gl_Position.w = _1928;
    float _2237 = fma(_2003, _2231, _1991);
    float _2239 = fma(_2005, _2231, _1993);
    float _2241 = fma(_1997, _2233, _1995);
    out.m_67.z = _2213;
    out.m_67.w = _1928;
    out.m_47.x = _2229;
    out.m_69.x = _2237;
    out.m_69.y = _2239;
    out.m_69.z = _2241;
    out.m_69.w = _2235;
    if (!_2221)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2243 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2243;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

