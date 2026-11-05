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
    float4 m_53 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_71 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1488 = false;
    bool _1274 = false;
    bool _1058 = false;
    bool _614 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3357 = as_type<float>(_106);
        out.gl_Position.z = _3357;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    float _112 = float(_90);
    float _114 = -_110;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_110);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    bool _128 = _116 >= _112;
    bool _130 = !_126;
    bool _132 = _128 || _130;
    float _134 = 0.0;
    if (_132)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _108 = as_type<int>(_138);
    }
    int _140 = _108;
    float _142 = as_type<float>(_140);
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_140);
        out.gl_Position.z = _3422;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_47.x;
    float _146 = in.m_47.y;
    float _148 = in.m_47.z;
    float _150 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = _150;
    if (!_160)
    {
        float _164 = _150 * _150;
        float _166 = _164 * 0.5;
        _142 = _166;
    }
    float _168 = _142;
    float _170 = 0.0;
    float _172 = _168;
    if (!_160)
    {
        float _174 = _116 * _116;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    if (!_160)
    {
        float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _180;
    }
    float _182 = _172;
    bool _184 = !_160;
    float _186 = _182;
    float _188 = 0.0;
    if (!_184)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _150 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _150);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _134 = _206;
        _186 = _218;
        _188 = _208;
    }
    float _220 = _134;
    float _222 = _186;
    float _224 = _188;
    bool _226 = !_160;
    float _228 = _220;
    float _230 = _224;
    if (!_226)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _150 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _228 = _244;
        _230 = _238;
        _162 = _250;
    }
    float _252 = _228;
    float _254 = _230;
    float _256 = _162;
    float _258 = _254;
    float _260 = _252;
    if (!_160)
    {
        _258 = _116;
    }
    float _262 = _258;
    float _264 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _262;
    if (!_160)
    {
        float _268 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _268;
    }
    float _270 = _260;
    bool _272 = !_160;
    float _274 = _270;
    if (!_272)
    {
        float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = log2(_276);
        float _280 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _282 = _280 + 1.0;
        float _284 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = _116 * _278;
        float _288 = exp2(_286);
        float _290 = _284 * 0.693147182464599609375;
        float _292 = 1.0 / _290;
        float _294 = 1.0 / _282;
        float _296 = _288 + (-1.0);
        float _298 = -_296;
        float _300 = fma(_298, _292, _116);
        float _302 = _300 * _294;
        float _304 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _304;
    }
    float _306 = _274;
    bool _308 = !_160;
    if (!_308)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _316 = _314 + 1.0;
        float _318 = 1.0 / _316;
        float _320 = _116 * _312;
        float _322 = exp2(_320);
        float _324 = -_322;
        float _326 = _324 + 1.0;
        float _328 = _326 * _318;
        _266 = _328;
    }
    float _330 = _266;
    float _332 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _336 = fma(_256, _146, _264);
    float _338 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = fma(_330, _146, _332);
    float _342 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _344 = fma(_256, _144, _334);
    float _346 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = fma(_330, _144, _338);
    float _350 = -_340;
    float _352 = _336 + _350;
    float _354 = fma(_256, _148, _342);
    float _356 = fma(_330, _148, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = _352 * _352;
    float _364 = in.m_49.w;
    float _366 = -_356;
    float _368 = _354 + _366;
    float _370 = 1.0 / _112;
    float _372 = fma(_360, _360, _362);
    float _374 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_368, _368, _372);
    float _382 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _392 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = sqrt(_380);
    float _396 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _398 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].z, _390);
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _402 = _116 * _370;
    bool _404 = _394 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_394);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_344, _364, _384);
    float _416 = fma(_336, _364, _386);
    float _418 = fma(_354, _364, _388);
    float _420 = _398;
    float _422 = _396;
    float _424 = _400;
    if (!_412)
    {
        bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _428 = !_426;
        if (!_428)
        {
            float _430 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _430);
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _440);
            float _448 = _442 * _442;
            float _450 = fma(_444, _444, _448);
            float _452 = fma(_446, _446, _450);
            float _454 = rsqrt(_452);
            float _456 = _454 * 9.9999999747524270787835121154785e-07;
            float _458 = _444 * _456;
            float _460 = _442 * _456;
            float _462 = _446 * _456;
            _420 = _460;
            _422 = _458;
            _424 = _462;
            _464 = true;
        }
        else
        {
            float _466 = _146 * _146;
            float _468 = fma(_144, _144, _466);
            float _470 = fma(_148, _148, _468);
            float _472 = sqrt(_470);
            bool _474 = _472 >= 9.9999999747524270787835121154785e-07;
            bool _476 = isnan(_472);
            bool _478 = _474 || _476;
            bool _480 = isnan(9.9999999747524270787835121154785e-07);
            bool _482 = _478 || _480;
            if (!_482)
            {
                float _484 = _386 * _386;
                float _486 = fma(_384, _384, _484);
                float _488 = fma(_388, _388, _486);
                float _490 = sqrt(_488);
                bool _492 = _490 >= 9.9999999747524270787835121154785e-07;
                bool _494 = isnan(_490);
                bool _496 = _492 || _494;
                bool _498 = isnan(9.9999999747524270787835121154785e-07);
                bool _500 = _496 || _498;
                if (!_500)
                {
                    float _502 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _502);
                    float _506 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _504);
                    float _508 = rsqrt(_506);
                    float _510 = _508 * 9.9999999747524270787835121154785e-07;
                    float _512 = _510 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _514 = _510 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _516 = _510 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _420 = _514;
                    _422 = _512;
                    _424 = _516;
                    _464 = true;
                }
                else
                {
                    float _518 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _522 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _524 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].x, _518);
                    float _526 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
                    float _528 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
                    float _532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
                    float _534 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
                    float _536 = _530 * _530;
                    float _538 = fma(_532, _532, _536);
                    float _540 = fma(_534, _534, _538);
                    float _542 = rsqrt(_540);
                    float _544 = _542 * 9.9999999747524270787835121154785e-07;
                    float _546 = _532 * _544;
                    float _548 = _530 * _544;
                    float _550 = _534 * _544;
                    _420 = _548;
                    _422 = _546;
                    _424 = _550;
                    _464 = true;
                }
            }
            else
            {
                float _552 = _146 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _554 = _146 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _556 = _146 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _558 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _552);
                float _560 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
                float _562 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
                float _564 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].z, _558);
                float _566 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
                float _570 = _564 * _564;
                float _572 = fma(_566, _566, _570);
                float _574 = fma(_568, _568, _572);
                float _576 = rsqrt(_574);
                float _578 = _576 * 9.9999999747524270787835121154785e-07;
                float _580 = _566 * _578;
                float _582 = _564 * _578;
                float _584 = _568 * _578;
                _420 = _582;
                _422 = _580;
                _424 = _584;
            }
        }
    }
    _464 = false;
    float _586 = _420;
    float _588 = _422;
    float _590 = _424;
    bool _592 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _594 = !_592;
    float _612;
    if (!_594)
    {
        float _596 = in.m_51.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        _612 = _402;
    }
    _614 = false;
    float _616 = _612;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _630;
    float _634 = 1.0 / _620;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _648 = 1.0 / _632;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _652 = _616 + _650;
    bool _654 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _656 = isnan(_616);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_664;
    float _668 = _666 + 1.0;
    float _670 = 1.0 / _624;
    float _672 = _652 * _634;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _676 = _616 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _680 = _616 + _678;
    bool _682 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _684 = isnan(_616);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _638;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _698 = 1.0 / _628;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _702 = _616 + _700;
    float _704 = 1.0 / _642;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _708 = _616 + _706;
    float _710 = _676 * _694;
    bool _712 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _714 = isnan(_616);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = _708 * _648;
    float _726 = _702 * _670;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _730 = _616 + _728;
    float _732 = 1.0 / _646;
    float _734 = _680 * _698;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _738 = _616 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _740;
    float _744 = -_722;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    float _752 = _730 * _704;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _754;
    float _758 = fma(_742, _672, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _764 = fma(_750, _672, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _766 = fma(_756, _672, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _776 = _738 * _732;
    bool _778 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _780 = isnan(_616);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = _664 * _746;
    float _792 = fma(_774, _734, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _794 = fma(_762, _734, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _796 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _798 = isnan(_616);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = -_788;
    float _810 = _808 + 1.0;
    float _812 = fma(_770, _734, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _814 = _788 * _668;
    bool _816 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _818 = isnan(_616);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = _806 * _810;
    float _830 = -_806;
    float _832 = _830 + 1.0;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _838;
    float _842 = -_826;
    float _844 = _842 + 1.0;
    float _846 = _826 * _832;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _848;
    bool _852 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _854 = isnan(_616);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = fma(_836, _724, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _866 = fma(_840, _724, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _868 = fma(_850, _724, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _870 = _692 * _844;
    bool _872 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _874 = isnan(_616);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -_862;
    float _886 = _884 + 1.0;
    float _888 = -_692;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _896 = _882 * _886;
    float _898 = _862 * _890;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _908 = -_882;
    float _910 = _908 + 1.0;
    float _912 = _764 * _896;
    float _914 = fma(_894, _710, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _916 = fma(_902, _710, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _918 = fma(_906, _710, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _920 = _766 * _896;
    float _922 = _758 * _896;
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].x, _912);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].y, _920);
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].z, _922);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _930;
    float _934 = fma(_812, _898, _924);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _940;
    float _944 = fma(_794, _898, _926);
    float _946 = fma(_932, _726, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _948 = fma(_938, _726, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _950 = fma(_942, _726, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _952 = fma(_792, _898, _928);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _966 = fma(_868, _870, _934);
    float _968 = fma(_864, _870, _944);
    float _970 = fma(_866, _870, _952);
    float _972 = fma(_956, _776, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _974 = fma(_960, _776, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _976 = fma(_964, _776, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _978 = fma(_914, _846, _966);
    float _980 = in.m_49.x;
    float _982 = in.m_49.y;
    float _984 = in.m_49.z;
    float _986 = fma(_916, _846, _968);
    float _988 = fma(_918, _846, _970);
    float _990 = fma(_948, _828, _978);
    float _992 = fma(_946, _828, _986);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _994;
    float _998 = fma(_950, _828, _988);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1000;
    float _1004 = fma(_972, _814, _990);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _1006;
    float _1010 = fma(_996, _752, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1012 = fma(_1002, _752, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1014 = fma(_974, _814, _992);
    float _1016 = fma(_1008, _752, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _1018 = fma(_976, _814, _998);
    float _1020 = fma(_1010, _790, _1004);
    float _1022 = fma(_1012, _790, _1014);
    float _1024 = fma(_1016, _790, _1018);
    float _1026 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1020);
    float _1028 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1022);
    float _1030 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[150].z, _1024);
    float _1032 = _1026 * _980;
    float _1034 = _1028 * _982;
    float _1036 = _1030 * _984;
    bool _1038 = !_696;
    float _1056;
    if (!_1038)
    {
        float _1040 = in.m_51.x;
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1044 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _1048 = _1046 * _1042;
        float _1050 = floor(_1048);
        float _1052 = -_1050;
        float _1054 = _1048 + _1052;
        _1056 = _1054;
        _1058 = true;
    }
    else
    {
        _1056 = _402;
    }
    _1058 = false;
    float _1060 = _1056;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1064 = _1060 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1068 = _1060 + _1066;
    bool _1070 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1072 = isnan(_1060);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1088 = _1060 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1098 = 1.0 / _1084;
    bool _1100 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1102 = 1.0 / _1096;
    float _1104 = 1.0 / _1092;
    float _1106 = _1064 * _1098;
    bool _1108 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1110 = isnan(_1060);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = -_1080;
    float _1122 = _1120 + 1.0;
    float _1124 = _1118 * _1122;
    float _1126 = _1068 * _1102;
    bool _1128 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1130 = isnan(_1060);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1140;
    bool _1144 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1146 = isnan(_1060);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1160 = -_1118;
    float _1162 = _1160 + 1.0;
    float _1164 = -_1138;
    float _1166 = _1164 + 1.0;
    float _1168 = _1088 * _1104;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1174;
    float _1178 = _1154 * _1166;
    float _1180 = fma(_1142, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1182 = fma(_1172, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1184 = fma(_1176, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1186 = _1138 * _1162;
    float _1188 = -_1154;
    float _1190 = _1188 + 1.0;
    float _1192 = _1182 * _1178;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1202 = _1184 * _1178;
    float _1204 = _1180 * _1178;
    float _1206 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1192);
    float _1208 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1202);
    float _1210 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1204);
    float _1212 = fma(_1158, _1126, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1214 = fma(_1196, _1126, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1216 = fma(_1200, _1126, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1226;
    float _1230 = fma(_1212, _1186, _1206);
    float _1232 = fma(_1220, _1106, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1234 = fma(_1224, _1106, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1236 = fma(_1228, _1106, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1238 = fma(_1214, _1186, _1208);
    float _1240 = fma(_1216, _1186, _1210);
    float _1242 = fma(_1232, _1124, _1230);
    float _1244 = fma(_1234, _1124, _1238);
    float _1246 = fma(_1236, _1124, _1240);
    float _1248 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[110].x, _1242);
    float _1250 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[110].y, _1244);
    float _1252 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[110].z, _1246);
    bool _1254 = !_1100;
    float _1272;
    if (!_1254)
    {
        float _1256 = in.m_51.x;
        float _1258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1260 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _1264 = _1262 * _1258;
        float _1266 = floor(_1264);
        float _1268 = -_1266;
        float _1270 = _1264 + _1268;
        _1272 = _1270;
        _1274 = true;
    }
    else
    {
        _1272 = _402;
    }
    _1274 = false;
    float _1276 = _1272;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1280 = _1276 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1290 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1292 = isnan(_1276);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1302;
    float _1306 = 1.0 / _1284;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1312 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1314 = isnan(_1276);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1320 = _1316 || _1318;
    float _1322 = float(_1320);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1328 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1330 = isnan(_1276);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = 1.0 / _1288;
    float _1342 = -_1322;
    float _1344 = _1342 + 1.0;
    bool _1346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1348 = _1300 * _1344;
    float _1350 = _1304 * _1306;
    bool _1352 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1354 = isnan(_1276);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = -_1300;
    float _1366 = _1364 + 1.0;
    float _1368 = 1.0 / _1310;
    float _1370 = fma(_1350, _1280, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1372;
    float _1376 = _1362 * _1366;
    float _1378 = -_1362;
    float _1380 = _1378 + 1.0;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1384 = _1382 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1386 = 1.0 / _1326;
    float _1388 = _1338 * _1380;
    float _1390 = _1384 * _1340;
    float _1392 = -_1338;
    float _1394 = _1392 + 1.0;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1398 = _1276 + _1396;
    float _1400 = _1370 * _1388;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1404 = _1276 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1410 = _1374 * _1368;
    bool _1412 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1414 = isnan(_1276);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = fma(_1390, _1404, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1426 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1400);
    float _1428 = fma(_1410, _1398, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1432 = _1276 + _1430;
    float _1434 = -_1422;
    float _1436 = _1434 + 1.0;
    float _1438 = fma(_1424, _1376, _1426);
    float _1440 = _1408 * _1386;
    float _1442 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1444 = _1322 * _1436;
    float _1446 = fma(_1428, _1348, _1438);
    float _1448 = fma(_1440, _1432, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1450 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1452 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1454 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1456 = fma(_1448, _1444, _1446);
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1462 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1456);
    float _1464 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1454;
    out.m_53.y = _1458;
    out.m_53.z = _1460;
    out.m_53.w = _1464;
    bool _1466 = !_1346;
    float _1468 = _1460;
    float _1486;
    if (!_1466)
    {
        float _1470 = in.m_51.x;
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1474 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _1478 = _1476 * _1472;
        float _1480 = floor(_1478);
        float _1482 = -_1480;
        float _1484 = _1478 + _1482;
        _1486 = _1484;
        _1488 = true;
    }
    else
    {
        _1486 = _402;
    }
    _1488 = false;
    float _1490 = _1486;
    float _1492 = _586 * _586;
    float _1494 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1496 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1498 = in.m_51.x;
    float _1500 = fma(_588, _588, _1492);
    float _1502 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1504 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1496);
    float _1506 = in.m_55.z;
    float _1508 = fma(_590, _590, _1500);
    float _1510 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1512 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1494);
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1516 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1510);
    float _1518 = rsqrt(_1508);
    float _1520 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1512);
    float _1522 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1516);
    float _1524 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1504);
    float _1526 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1528 = _1522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1530 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1534 = _1526 + _1532;
    float _1536 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1530 + _1538;
    float _1542 = _1534 * _1534;
    float _1544 = _1518 * _586;
    float _1546 = _1518 * _588;
    float _1548 = _1518 * _590;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1552 = _1528 + _1550;
    float _1554 = _1544 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1556 = fma(_1546, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1554);
    float _1558 = fma(_1552, _1552, _1542);
    float _1560 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0500000007450580596923828125, _1498);
    float _1562 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1556);
    float _1564 = fma(_1540, _1540, _1558);
    float _1566 = rsqrt(_1564);
    float _1568 = abs(_1562);
    bool _1570 = _1568 > 0.99989998340606689453125;
    float _1572 = _1496;
    float _1574 = _1564;
    float _1576 = _1562;
    float _1578 = _1544;
    float _1580 = _1530;
    if (_1570)
    {
        _1468 = 0.001000000047497451305389404296875;
    }
    float _1582 = _1468;
    float _1584 = _1514 * _1566;
    if (!_1570)
    {
        _1572 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1586 = _1572;
    float _1588 = _1586;
    if (_1570)
    {
        float _1590 = fma(_1582, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1588 = _1590;
    }
    float _1592 = _1588;
    float _1594 = _1534 * _1584;
    float _1596 = _1594;
    if (!_1570)
    {
        _1574 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1598 = _1574;
    float _1600 = _1560 + _1506;
    float _1602 = _1598;
    if (_1570)
    {
        float _1604 = fma(_1582, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1602 = _1604;
    }
    float _1606 = _1602;
    float _1608 = _1552 * _1584;
    float _1610 = -_1594;
    float _1612 = _1534 + _1610;
    float _1614 = -_1592;
    float _1616 = _1548 * _1614;
    if (!_1570)
    {
        _1576 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1618 = _1576;
    float _1620 = _1600 * 2.0;
    float _1622 = -_1608;
    float _1624 = _1552 + _1622;
    float _1626 = _1612 * _1612;
    float _1628 = -_1606;
    float _1630 = -_1616;
    float _1632 = fma(_1546, _1628, _1630);
    float _1634 = _1618;
    if (_1570)
    {
        float _1636 = fma(_1582, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = -_1606;
    float _1642 = _1544 * _1640;
    float _1644 = _1540 * _1584;
    float _1646 = _1620 * 0.15915493667125701904296875;
    float _1648 = fma(_1624, _1624, _1626);
    float _1650 = -_1638;
    float _1652 = -_1642;
    float _1654 = fma(_1548, _1650, _1652);
    float _1656 = -_1638;
    float _1658 = _1546 * _1656;
    float _1660 = _1632 * _1632;
    float _1662 = -_1644;
    float _1664 = _1540 + _1662;
    float _1666 = in.m_55.x;
    float _1668 = -_1592;
    float _1670 = -_1658;
    float _1672 = fma(_1544, _1668, _1670);
    float _1674 = fma(_1654, _1654, _1660);
    float _1676 = _1646 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = fma(_1664, _1664, _1648);
    float _1682 = in.m_55.y;
    float _1684 = fma(_1672, _1672, _1674);
    float _1686 = precise::max(_402, 0.300000011920928955078125);
    float _1688 = sqrt(_1680);
    float _1690 = precise::min(_1686, 0.800000011920928955078125);
    float _1692 = fma(_1690, 2.0, -0.60000002384185791015625);
    float _1694 = rsqrt(_1684);
    float _1696 = _1678 * 0.2599999904632568359375;
    float _1698 = fma(_1696, _1692, _1666);
    float _1700 = _1566 * _1688;
    float _1702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1506);
    float _1704 = _1536 * _1700;
    float _1706 = _1502 * _1700;
    float _1708 = _1672 * _1694;
    float _1710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1682);
    float _1712 = _1654 * _1694;
    float _1714 = _1632 * _1694;
    float _1716 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1698);
    float _1720 = _1704 * _1710;
    float _1722 = _1546 * _1714;
    float _1724 = _1716 * _1700;
    float _1726 = _1706 * _1718;
    float _1728 = _1720 * _1548;
    float _1730 = _1544 * _1708;
    float _1732 = _1724 * _1702;
    float _1734 = -_1722;
    float _1736 = fma(_1544, _1712, _1734);
    float _1738 = _1720 * _1546;
    float _1740 = fma(_1726, _1708, _1728);
    float _1742 = -_1730;
    float _1744 = fma(_1548, _1714, _1742);
    float _1746 = fma(_1726, _1712, _1738);
    float _1748 = fma(_1732, _1736, _1740);
    float _1750 = _1548 * _1712;
    float _1752 = fma(_1732, _1744, _1746);
    float _1754 = _1530 + _1748;
    float _1756 = -_1750;
    float _1758 = fma(_1546, _1708, _1756);
    float _1760 = _1528 + _1752;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1764 = _1754 + _1762;
    bool _1766 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1768 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan(0.5);
    bool _1774 = _1770 || _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1778 = _1760 + _1776;
    float _1780 = _1764 * _1764;
    float _1782 = fma(_1778, _1778, _1780);
    float _1784 = _1720 * _1544;
    float _1786 = sqrt(_1782);
    float _1788 = fma(_1726, _1714, _1784);
    float _1790 = fma(_1732, _1758, _1788);
    float _1792 = _1526 + _1790;
    float _1794 = -_1608;
    float _1796 = _1528 + _1794;
    bool _1798 = _1786 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1800 = _1788;
    float _1802 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1804 = _1700;
    float _1806 = _1708;
    if (!_1798)
    {
        _1578 = _1760;
    }
    float _1808 = _1578;
    float _1810 = _1808;
    if (!_1798)
    {
        _1800 = _1754;
    }
    float _1812 = _1800;
    float _1814 = _1812;
    if (!_1798)
    {
        _1802 = _1792;
    }
    float _1816 = _1802;
    bool _1818 = !_1798;
    float _1820 = _1816;
    if (!_1818)
    {
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1826 = _1786 + _1824;
        float _1828 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1830 = rsqrt(_1782);
        float _1832 = _1826 * _1822;
        float _1834 = _1832 * 0.15915493667125701904296875;
        float _1836 = _1834 * 6.283185482025146484375;
        float _1838 = cos(_1836);
        float _1840 = _1834 * 6.283185482025146484375;
        float _1842 = sin(_1840);
        float _1844 = _1838 + (-1.0);
        float _1846 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1848 = fma(_1842, _1828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1850 = fma(_1792, _1838, _1846);
        float _1852 = _1830 * _1848;
        float _1854 = fma(_1778, _1852, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1856 = fma(_1764, _1852, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1810 = _1854;
        _1814 = _1856;
        _1820 = _1850;
    }
    float _1858 = _1810;
    float _1860 = _1814;
    float _1862 = _1820;
    float _1864 = -_1608;
    float _1866 = _1864 + _1858;
    float _1868 = -_1644;
    float _1870 = _1868 + _1860;
    float _1872 = -_1594;
    float _1874 = _1872 + _1862;
    float _1876 = -_1594;
    float _1878 = _1526 + _1876;
    float _1880 = -_1644;
    float _1882 = _1530 + _1880;
    float _1884 = _1866;
    float _1886 = _1874;
    float _1888 = _1858;
    if (_1774)
    {
        _1596 = _1866;
    }
    float _1890 = _1596;
    float _1892 = _1890;
    if (_1774)
    {
        _1884 = _1870;
    }
    float _1894 = _1884;
    float _1896 = _1894;
    if (!_1774)
    {
        float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1900 = _1878 + _1898;
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1904 = _1796 + _1902;
        float _1906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1908 = -_1530;
        float _1910 = _1908 + _1860;
        float _1912 = _1900 * _1900;
        float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1916 = _1882 + _1914;
        float _1918 = -_1528;
        float _1920 = _1918 + _1858;
        float _1922 = -_1526;
        float _1924 = _1922 + _1862;
        float _1926 = fma(_1904, _1904, _1912);
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1930 = fma(_1916, _1916, _1926);
        float _1932 = sqrt(_1930);
        float _1934 = 1.0 / _1700;
        float _1936 = precise::min(_1932, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1938 = _1936 * _1906;
        float _1940 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1942 = _1938 * _1934;
        float _1944 = _1940 * _1942;
        float _1946 = _1910 * _1942;
        float _1948 = fma(_1920, _1944, _1796);
        float _1950 = fma(_1924, _1944, _1878);
        float _1952 = fma(_1940, _1946, _1882);
        _1886 = _1950;
        _1892 = _1948;
        _1896 = _1952;
        _1804 = _1934;
        _1580 = _1946;
    }
    float _1954 = _1886;
    float _1956 = _1892;
    float _1958 = _1896;
    float _1960 = _1804;
    float _1962 = _1580;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1966 = _1954 + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1970 = _1956 + _1968;
    float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1974 = _1958 + _1972;
    float _1976 = _1966 * _1966;
    float _1978 = fma(_1970, _1970, _1976);
    float _1980 = fma(_1974, _1974, _1978);
    float _1982 = rsqrt(_1980);
    float _1984 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1986 = _1970 * _1984;
    float _1988 = _1974 * _1984;
    float _1990 = _1986 * _1986;
    float _1992 = _1988 * _1988;
    float _1994 = _1990 + _1992;
    float _1996 = sqrt(_1994);
    bool _1998 = _1996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2002 = _1996 + _2000;
    float _2004 = _1960;
    float _2006 = _2002;
    float _2008 = _1966;
    float _2010 = _1986;
    if (_1998)
    {
        float _2012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2004 = _2012;
    }
    float _2014 = _2004;
    float _2016 = _2014;
    if (_1998)
    {
        float _2018 = _2002 * _2014;
        _2006 = _2018;
    }
    float _2020 = _2006;
    if (_1998)
    {
        float _2022 = rsqrt(_1994);
        _2016 = _2022;
    }
    float _2024 = _2016;
    float _2026 = _2024;
    if (_1998)
    {
        float _2028 = _2020 * 0.15915493667125701904296875;
        _1888 = _2028;
    }
    float _2030 = _1888;
    float _2032 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2034 = _1974;
    if (_1998)
    {
        float _2036 = _2030 * 6.283185482025146484375;
        float _2038 = sin(_2036);
        _2034 = _2038;
    }
    float _2040 = _2034;
    float _2042 = precise::max(0.0, _2032);
    float _2044 = _1962;
    float _2046 = _2042;
    if (_1998)
    {
        float _2048 = _2030 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        _2044 = _2050;
    }
    float _2052 = _2044;
    float _2054 = -_1984;
    float _2056 = -_2042;
    float _2058 = fma(_1966, _2054, _2056);
    if (_1998)
    {
        float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2008 = _2060;
    }
    float _2062 = _2008;
    float _2064 = sqrt(_1980);
    float _2066 = _2040;
    float _2068 = _2062;
    if (_1998)
    {
        float _2070 = fma(_2040, _2062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2066 = _2070;
    }
    float _2072 = _2066;
    float _2074 = _2072;
    if (!_1998)
    {
        _2068 = _1990;
    }
    float _2076 = _2068;
    float _2078 = _2076;
    if (_1998)
    {
        float _2080 = _2024 * _2072;
        _1806 = _2080;
    }
    float _2082 = _1806;
    if (!_1998)
    {
        _2074 = _2058;
    }
    float _2084 = _2074;
    float _2086 = _2084;
    float _2088 = _2052;
    if (_1998)
    {
        float _2090 = _2052 + (-1.0);
        _2046 = _2090;
    }
    float _2092 = _2046;
    float _2094 = _2092;
    if (_1998)
    {
        float _2096 = _1986 * _2082;
        _2010 = _2096;
    }
    float _2098 = _2010;
    float _2100 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1998)
    {
        float _2102 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2026 = _2102;
    }
    float _2104 = _2026;
    if (!_1998)
    {
        _2094 = _1988;
    }
    float _2106 = _2094;
    float _2108 = _2106;
    if (_1998)
    {
        float _2110 = _1988 * _2082;
        _2108 = _2110;
    }
    float _2112 = _2108;
    if (_1998)
    {
        float _2114 = _2098 * _2098;
        _2078 = _2114;
    }
    float _2116 = _2078;
    if (_1998)
    {
        float _2118 = fma(_2058, _2052, _2104);
        _2086 = _2118;
    }
    float _2120 = _2086;
    if (!_1998)
    {
        _2088 = _1992;
    }
    float _2122 = _2088;
    float _2124 = _2122;
    if (_1998)
    {
        float _2126 = _2112 * _2112;
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = fma(_2120, _2120, _2116);
    float _2132 = _2130 + _2128;
    float _2134 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2138 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2136);
    float _2140 = precise::clamp(_2138, 0.0, 1.0);
    float _2142 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2144 = rsqrt(_2132);
    float _2146 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2134);
    float _2148 = -_2140;
    float _2150 = _2148 + 1.0;
    float _2152 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2154 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2142);
    float _2156 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2146);
    float _2158 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2160 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2152);
    float _2162 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2154);
    float _2164 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2166 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2158);
    float _2168 = abs(_2150);
    float _2170 = log2(_2168);
    float _2172 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2160);
    float _2174 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2176 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2166);
    float _2180 = _2144 * _2098;
    float _2182 = -_2174;
    float _2184 = fma(_2182, _2100, 1.0);
    float _2186 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2188 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = _2144 * _2120;
    float _2192 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2194 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2196 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2198 = _2144 * _2112;
    float _2200 = -_2192;
    float _2202 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2200);
    float _2204 = log2(_2184);
    float _2206 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2208 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2196);
    float _2210 = -_2198;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2202);
    float _2214 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2216 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2218 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2208);
    float _2220 = fma(_2212, -0.5, 0.5);
    float _2222 = exp2(_2206);
    float _2224 = fma(_2212, 0.5, 0.5);
    float _2226 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2214);
    float _2228 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2216);
    float _2230 = _2190 + 1.0;
    float _2232 = fma(_2224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2226);
    float _2236 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2228);
    float _2238 = 1.0 / _2218;
    float _2240 = fma(_2224, _2232, -0.212114393711090087890625);
    float _2242 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2234);
    float _2244 = _2204 * 0.693147182464599609375;
    float _2246 = fma(_2224, _2240, 1.570728778839111328125);
    float _2248 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2250 = sqrt(_2220);
    float _2252 = -_2190;
    float _2254 = fma(_2222, _2230, _2252);
    float _2256 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2236);
    float _2258 = fma(_2254, 0.5, 0.5);
    float _2260 = _2242 * _2238;
    float _2262 = _2256 * _2238;
    float _2264 = fma(_2260, 0.5, 0.5);
    float _2266 = fma(_2262, -0.5, 0.5);
    float _2268 = _2250 * 0.636619746685028076171875;
    float _2270 = -_2246;
    float _2272 = fma(_2268, _2270, 1.0);
    float3 _6907 = float3(_2264, _2266, _2248);
    float _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6907, float3(0.0), isnan(_6907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6907, float3(0.0), isnan(_6907)), level(0.0)).x;
    float3 _6918 = float3(_2264, _2266, _2248);
    float4 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6918, float3(0.0), isnan(_6918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6918, float3(0.0), isnan(_6918)), level(0.0)).xyzw;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = _2277.w;
    float2 _6935 = float2(_2272, _2258);
    float3 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6935, float2(0.0), isnan(_6935)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6935, float2(0.0), isnan(_6935)), level(0.0)).xyz;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = in.m_57.x;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2301 = _1490 + _2299;
    float _2303 = in.m_57.y;
    int _2305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2307 = _2305 != 0;
    float _2309 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2311 = _1490 + _2309;
    float _2313 = in.m_51.y;
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2317 = _1490 + _2315;
    float _2319 = in.m_51.z;
    float _2321 = in.m_51.w;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2325 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2329 = _2327 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _2331 = false;
    float _2333 = _2264;
    int _2335 = 1065353216;
    if (_2307)
    {
        bool _2337 = _1498 > 0.5;
        _2331 = _2337;
    }
    bool _2339 = _2331;
    float _2341 = 1.0 / _2325;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2345 = _2343 != 0;
    float _2347 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2349 = _2297;
    float _2351 = _2347;
    if (!_2307)
    {
        _2333 = _2297;
    }
    float _2353 = _2333;
    int _2355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2357 = _2355 != 0;
    float _2359 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2347);
    int _2361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2363 = _2361 != 0;
    float _2365 = 1.0 / _2329;
    int _2367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2369 = _2367 != 0;
    float _2371 = _2353;
    if (_2307)
    {
        float _2373 = -_2297;
        float _2375 = _2373 + 1.0;
        _2335 = as_type<int>(_2375);
    }
    int _2377 = _2335;
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2381 = _2379 != 0;
    float _2383 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2385 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2383;
    float _2387 = -_2303;
    float _2389 = _2387 + 1.0;
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2393 = _2391 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2395 = _2303;
    if (_2307)
    {
        float _2397 = _2339 ? as_type<float>(_2377) : _2297;
        _2371 = _2397;
    }
    float _2399 = _2371;
    float _2401 = 1.0 / _2385;
    bool _2403 = _2313 > 0.5;
    float _2405 = _2301 * _2341;
    int _2407 = 0;
    float _2409 = _2313;
    if (_2357)
    {
        float _2411 = -_2297;
        float _2413 = _2411 + 1.0;
        _2407 = as_type<int>(_2413);
    }
    int _2415 = _2407;
    bool _2417 = _2319 > 0.5;
    float _2419 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2421 = _2419 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _2423 = _2403 ? as_type<int>(_2389) : as_type<int>(_2303);
    float _2425 = 1.0 / _2393;
    int _2427 = _2417 ? as_type<int>(_2389) : as_type<int>(_2303);
    float _2429 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2431 = _2429 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2433 = _2363 ? as_type<float>(_2423) : _2303;
    bool _2435 = _2321 > 0.5;
    float _2437 = _2311 * _2401;
    float _2439 = 1.0 / _2421;
    float _2441 = _2369 ? as_type<float>(_2427) : _2303;
    float _2443 = _2319;
    if (_2381)
    {
        float _2445 = _2435 ? _2389 : _2303;
        _2395 = _2445;
    }
    float _2447 = _2395;
    float _2449 = 1.0 / _2431;
    float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2459 = _2457 != 0;
    float _2461 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2463 = 1.0 / _2453;
    bool _2465 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan(0.5);
    bool _2473 = _2469 || _2471;
    float _2475 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2477 = _2475 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2481 = _1490 + _2479;
    float _2483 = -_2455;
    float _2485 = fma(_2461, 2.0, _2483);
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2489 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2491 = _2481 * _2365;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2497 = fma(_2489, -2.0, _2487);
    float _2499 = 1.0 / _2477;
    float _2501 = _2317 * _2425;
    float _2503 = -_116;
    float _2505 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2485);
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2507;
    float _2511 = 1.0 / _2495;
    float _2513 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2515 = _2513 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2517;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2523 = _2521 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2525 = _2509 * _2463;
    float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2527;
    float _2531 = _2519 * _2439;
    float _2533 = 1.0 / _2515;
    float _2535 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2537 = _2535 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _2539 = _2523 * _2449;
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2545 = 1.0 / _2537;
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2549 = _2547 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2551 = _2529 * _2511;
    float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2555 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2553;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2557;
    float _2561 = _2543 * _2499;
    float _2563 = fma(_2555, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2565;
    float _2569 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2569;
    float _2573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2575 = _2549 * _2533;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2581 = fma(_2571, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2585 = _2583 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2587 = _2567 * _2545;
    float _2589 = fma(_2559, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2593 = _2591 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2595 = fma(_2585, _2491, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2597;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2603 = _2601 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2605;
    float _2609 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2611 = _2609 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2621 = fma(_2593, _2491, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2625 = fma(_2579, _2491, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2627 = fma(_2599, _2437, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2629 = fma(_2607, _2437, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2631 = fma(_2615, _2437, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2635 = _402 + _2633;
    float _2637 = fma(_2603, _2501, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2639 = _2573 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2643 = _402 + _2641;
    float _2645 = fma(_2531, _2635, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2647 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2649 = _402 + _2647;
    float _2651 = fma(_2639, _2433, -0.5);
    float _2653 = fma(_2525, _2643, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2657 = _402 + _2655;
    float _2659 = fma(_2539, _2649, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2661 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2663 = _402 + _2661;
    float _2665 = _2623 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2667 = fma(_2575, _2657, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2671 = _402 + _2669;
    bool _2673 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2675 = isnan(_402);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = fma(_2441, _2665, -0.5);
    bool _2687 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2689 = isnan(_402);
    bool _2691 = _2687 || _2689;
    bool _2693 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2695 = _2691 || _2693;
    float _2697 = float(_2695);
    float _2699 = fma(_2587, _2663, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2701 = fma(_2561, _2671, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _2703 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2705 = isnan(_1490);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = -_2683;
    float _2717 = _2715 + 1.0;
    float _2719 = -_2697;
    float _2721 = _2719 + 1.0;
    bool _2723 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2725 = isnan(_402);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2731 = _2727 || _2729;
    float _2733 = float(_2731);
    float _2735 = fma(_2611, _2501, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2737 = -_2713;
    float _2739 = _2737 + 1.0;
    bool _2741 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2743 = isnan(_1490);
    bool _2745 = _2741 || _2743;
    bool _2747 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2749 = _2745 || _2747;
    float _2751 = float(_2749);
    float _2753 = fma(_2619, _2501, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _2755 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2757 = isnan(_1490);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2763 = _2759 || _2761;
    float _2765 = float(_2763);
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2769 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2771 = isnan(_1490);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = -_2751;
    float _2783 = _2781 + 1.0;
    bool _2785 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2787 = isnan(_1490);
    bool _2789 = _2785 || _2787;
    bool _2791 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2793 = _2789 || _2791;
    float _2795 = float(_2793);
    float _2797 = _2683 * _2721;
    bool _2799 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2801 = isnan(_402);
    bool _2803 = _2799 || _2801;
    bool _2805 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2807 = _2803 || _2805;
    float _2809 = float(_2807);
    float _2811 = _2733 * _2717;
    float _2813 = -_2733;
    float _2815 = _2813 + 1.0;
    bool _2817 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2819 = isnan(_402);
    bool _2821 = _2817 || _2819;
    bool _2823 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2825 = _2821 || _2823;
    float _2827 = float(_2825);
    float _2829 = _2751 * _2739;
    float _2831 = -_2809;
    float _2833 = _2831 + 1.0;
    float _2835 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2767);
    float _2837 = _2809 * _2815;
    float _2839 = _2795 * _2783;
    float _2841 = -_2795;
    float _2843 = _2841 + 1.0;
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2847 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2849 = isnan(_402);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2855 = _2851 || _2853;
    float _2857 = float(_2855);
    float _2859 = _2827 * _2833;
    float _2861 = -_2827;
    float _2863 = _2861 + 1.0;
    float _2865 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2835);
    float _2867 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2497);
    bool _2869 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2871 = isnan(_402);
    bool _2873 = _2869 || _2871;
    bool _2875 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2877 = _2873 || _2875;
    float _2879 = float(_2877);
    float _2881 = _2779 * _2843;
    float _2883 = -_2779;
    float _2885 = _2883 + 1.0;
    float _2887 = _2857 * _2863;
    float _2889 = -_2867;
    float _2891 = fma(_2865, _2651, _2889);
    float _2893 = -_2857;
    float _2895 = _2893 + 1.0;
    bool _2897 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2899 = isnan(_402);
    bool _2901 = _2897 || _2899;
    bool _2903 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2905 = _2901 || _2903;
    float _2907 = float(_2905);
    float _2909 = _2765 * _2885;
    float _2911 = -_2879;
    float _2913 = _2911 + 1.0;
    float _2915 = _2879 * _2895;
    float _2917 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2919 = _402 + _2917;
    float _2921 = _2581 * _2909;
    float _2923 = _2563 * _2909;
    float _2925 = _2589 * _2909;
    float _2927 = _2907 * _2913;
    int _2929 = as_type<int>(_2909);
    float _2931 = _2645;
    float _2933 = _2589;
    float _2935 = _2713;
    float _2937 = _2667;
    if (_2345)
    {
        float _2939 = -_2297;
        float _2941 = _2939 + 1.0;
        _2929 = as_type<int>(_2941);
    }
    int _2943 = _2929;
    float _2945 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2947 = _2645 * _2927;
    float _2949 = -_2765;
    float _2951 = _2949 + 1.0;
    float _2953 = 0.0;
    if (!_2459)
    {
        _2953 = _2313;
    }
    float _2955 = _2953;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2959 = _2955;
    if (!_2345)
    {
        _2931 = _2297;
    }
    float _2961 = _2931;
    float _2963 = fma(_2551, _2919, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2965 = _2961;
    if (_2345)
    {
        float _2967 = _2417 ? as_type<float>(_2943) : _2297;
        _2965 = _2967;
    }
    float _2969 = _2965;
    float _2971 = fma(_2945, _2447, -0.5);
    if (_2459)
    {
        _2959 = _1498;
    }
    float _2973 = _2959;
    float _2975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_2357)
    {
        float _2977 = _2403 ? as_type<float>(_2415) : _2297;
        _2349 = _2977;
    }
    float _2979 = _2349;
    float _2981 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2921);
    float _2983 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2923);
    float _2985 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2925);
    float _2987 = fma(_2973, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2957);
    float _2989 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2991 = -_2907;
    float _2993 = _2991 + 1.0;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2997 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3001 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3003 = _2993;
    if (_2459)
    {
        _2933 = _1498;
    }
    float _3005 = _2933;
    float _3007 = fma(_2993, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2947);
    float _3009 = -_2995;
    float _3011 = fma(_2989, 2.0, _3009);
    float _3013 = _3005;
    if (!_2459)
    {
        _3013 = _2319;
    }
    float _3015 = _3013;
    float _3017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_2459)
    {
        _3003 = _2319;
    }
    float _3019 = _3003;
    float _3021 = fma(_2595, _2881, _2981);
    float _3023 = fma(_2621, _2881, _2983);
    float _3025 = fma(_2625, _2881, _2985);
    float _3027 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2997);
    float _3029 = _3019;
    if (_2459)
    {
        _3029 = _2313;
    }
    float _3031 = _3029;
    float _3033 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_2459)
    {
        _2443 = _2313;
    }
    float _3035 = _2443;
    float _3037 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2999);
    float _3039 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3001);
    if (!_2459)
    {
        _2409 = _1498;
    }
    float _3041 = _2409;
    float _3043 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3033);
    float _3045 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3047 = _2975 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3049 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3043);
    float _3051 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3055 = fma(_3047, _2399, -0.5);
    float _3057 = _3017 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3059 = fma(_2627, _2839, _3021);
    float _3061 = fma(_3045, -2.0, _3053);
    float _3063 = _3049 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3065 = fma(_2629, _2839, _3023);
    float _3067 = fma(_2631, _2839, _3025);
    float _3069 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3051);
    float _3071 = 1.0 / _3063;
    float _3073 = fma(_3057, _2979, -0.5);
    float _3075 = _3015 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3077 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3069);
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3081 = _3041 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3083 = _3077 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3085 = -_3079;
    float _3087 = fma(_3075, 2.0, _3085);
    float _3089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3091 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3093 = _3083 + _3063;
    float _3095 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3037);
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3099 = fma(_3081, -2.0, _3091);
    float _3101 = _3091;
    float _3103 = _3099;
    if (!_2473)
    {
        _3101 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3105 = _3101;
    float _3107 = _3093 * _3071;
    float _3109 = _3107 * 0.5;
    float _3111 = fma(_3095, _3055, _2505);
    float _3113 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2987);
    float _3115 = -_116;
    float _3117 = fma(_3115, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3011);
    float _3119 = _3105;
    if (!_2473)
    {
        float _3121 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3123 = fma(_3109, _3105, _3121);
        _3119 = _3123;
    }
    float _3125 = _3119;
    float _3127 = fma(_3031, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3097);
    float _3129 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3039);
    float _3131 = -_116;
    float _3133 = fma(_3131, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3087);
    float _3135 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3061);
    float _3137 = _3089 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3139 = _3125;
    if (!_2473)
    {
        float _3141 = 1.0 / _3125;
        _3139 = _3141;
    }
    float _3143 = _3139;
    float _3145 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3027);
    float _3147 = fma(_2659, _2915, _3007);
    float _3149 = fma(_3137, _2969, -0.5);
    float _3151 = fma(_2637, _2829, _3059);
    float _3153 = fma(_2735, _2829, _3065);
    float _3155 = fma(_2753, _2829, _3067);
    float _3157 = fma(_3113, _3149, _3117);
    float _3159 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3127);
    float _3161 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3099);
    if (!_2473)
    {
        _3103 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3163 = _3103;
    float _3165 = fma(_2653, _2887, _3147);
    float _3167 = fma(_2713, (*spvDescriptorSet0.vp_c9)._m0[127].x, _3151);
    float _3169 = fma(_2713, (*spvDescriptorSet0.vp_c9)._m0[127].y, _3153);
    float _3171 = fma(_2713, (*spvDescriptorSet0.vp_c9)._m0[127].z, _3155);
    float _3173 = fma(_2701, _2859, _3165);
    if (!_2473)
    {
        float _3175 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3177 = -_3163;
        float _3179 = fma(_3143, _3175, _3177);
        _2351 = _3179;
    }
    float _3181 = _2351;
    float _3183 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2359);
    float _3185 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2473)
    {
        float _3187 = -_3163;
        float _3189 = _3187 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2935 = _3189;
    }
    float _3191 = _2935;
    float _3193 = -_3135;
    float _3195 = fma(_3159, _2971, _3193);
    float _3197 = fma(_2963, _2837, _3173);
    float _3199 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3183);
    float _3201 = -_3161;
    float _3203 = fma(_3145, _2685, _3201);
    float _3205 = exp2(_3185);
    float _3207 = _3195 + 0.5;
    float _3209 = fma(_2667, _2811, _3197);
    if (_2473)
    {
        _2937 = 1.0;
    }
    float _3211 = _2937;
    float _3213 = fma(_3129, _3073, _3133);
    float _3215 = fma(_2699, _2797, _3209);
    float _3217 = _3167 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3219 = _3191;
    float _3221 = _3211;
    if (!_2473)
    {
        float _3223 = 1.0 / _3191;
        _3219 = _3223;
    }
    float _3225 = _3219;
    float _3227 = _3169 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3229 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3215);
    float _3231 = _3199 + _2218;
    float _3233 = _3171 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.gl_Position.x = _2242;
    out.gl_Position.y = _2256;
    out.gl_Position.z = _3199;
    out.gl_Position.w = _2218;
    float _3235 = _2891 + 0.5;
    float _3237 = _3231 * 0.5;
    float _3239 = -_3205;
    float _3241 = _3239 + 1.0;
    float _3243 = _3111 + 0.5;
    float _3245 = _3157 + 0.5;
    float _3247 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3249 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3251 = _3213 + 0.5;
    float _3253 = _3203 + 0.5;
    float _3255 = _3217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2473)
    {
        float _3257 = _3181 * _3225;
        float _3259 = precise::clamp(_3257, 0.0, 1.0);
        _3221 = _3259;
    }
    float _3261 = _3221;
    float _3263 = _3249 * _2274;
    float _3265 = -_3249;
    float _3267 = _3265 + 1.0;
    float _3269 = _3227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3271 = _3261 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3273 = _3261 > 0.0;
    bool _3275 = isnan(_3261);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan(0.0);
    bool _3281 = _3277 || _3279;
    float _3283 = _2285 * _3263;
    float _3285 = _2295 * _3263;
    float _3287 = _3233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3289 = _3271 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3291 = fma(_2291, _3283, _2279);
    float _3293 = fma(_2293, _3283, _2281);
    float _3295 = _2285 * _3267;
    float _3297 = fma(_2285, _3285, _2283);
    out.m_61.x = _3243;
    out.m_61.y = _3235;
    out.m_61.z = _3245;
    out.m_61.w = _3207;
    out.m_63.x = _3251;
    out.m_63.y = _3253;
    out.m_65.x = _3255;
    out.m_65.y = _3269;
    out.m_65.z = _3287;
    out.m_65.w = _3247;
    out.m_67.x = _3229;
    out.m_69.z = _3237;
    out.m_69.w = _2218;
    out.m_45.x = _3289;
    out.m_71.x = _3291;
    out.m_71.y = _3293;
    out.m_71.z = _3297;
    out.m_71.w = _3295;
    if (_3281)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3299;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1488 = false;
    bool _1274 = false;
    bool _1058 = false;
    bool _614 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3357 = as_type<float>(_106);
        out.gl_Position.z = _3357;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    float _112 = float(_90);
    float _114 = -_110;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_110);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    bool _128 = _116 >= _112;
    bool _130 = !_126;
    bool _132 = _128 || _130;
    float _134 = 0.0;
    if (_132)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _108 = as_type<int>(_138);
    }
    int _140 = _108;
    float _142 = as_type<float>(_140);
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_140);
        out.gl_Position.z = _3422;
    }
    if (_132)
    {
        return out;
    }
    float _144 = in.m_47.x;
    float _146 = in.m_47.y;
    float _148 = in.m_47.z;
    float _150 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = _150;
    if (!_160)
    {
        float _164 = _150 * _150;
        float _166 = _164 * 0.5;
        _142 = _166;
    }
    float _168 = _142;
    float _170 = 0.0;
    float _172 = _168;
    if (!_160)
    {
        float _174 = _116 * _116;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    if (!_160)
    {
        float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _180;
    }
    float _182 = _172;
    bool _184 = !_160;
    float _186 = _182;
    float _188 = 0.0;
    if (!_184)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _150 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _150);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _134 = _206;
        _186 = _218;
        _188 = _208;
    }
    float _220 = _134;
    float _222 = _186;
    float _224 = _188;
    bool _226 = !_160;
    float _228 = _220;
    float _230 = _224;
    if (!_226)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _150 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _228 = _244;
        _230 = _238;
        _162 = _250;
    }
    float _252 = _228;
    float _254 = _230;
    float _256 = _162;
    float _258 = _254;
    float _260 = _252;
    if (!_160)
    {
        _258 = _116;
    }
    float _262 = _258;
    float _264 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _262;
    if (!_160)
    {
        float _268 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _268;
    }
    float _270 = _260;
    bool _272 = !_160;
    float _274 = _270;
    if (!_272)
    {
        float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = log2(_276);
        float _280 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _282 = _280 + 1.0;
        float _284 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = _116 * _278;
        float _288 = exp2(_286);
        float _290 = _284 * 0.693147182464599609375;
        float _292 = 1.0 / _290;
        float _294 = 1.0 / _282;
        float _296 = _288 + (-1.0);
        float _298 = -_296;
        float _300 = fma(_298, _292, _116);
        float _302 = _300 * _294;
        float _304 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _304;
    }
    float _306 = _274;
    bool _308 = !_160;
    if (!_308)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _316 = _314 + 1.0;
        float _318 = 1.0 / _316;
        float _320 = _116 * _312;
        float _322 = exp2(_320);
        float _324 = -_322;
        float _326 = _324 + 1.0;
        float _328 = _326 * _318;
        _266 = _328;
    }
    float _330 = _266;
    float _332 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _336 = fma(_256, _146, _264);
    float _338 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = fma(_330, _146, _332);
    float _342 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _344 = fma(_256, _144, _334);
    float _346 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = fma(_330, _144, _338);
    float _350 = -_340;
    float _352 = _336 + _350;
    float _354 = fma(_256, _148, _342);
    float _356 = fma(_330, _148, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = _352 * _352;
    float _364 = in.m_49.w;
    float _366 = -_356;
    float _368 = _354 + _366;
    float _370 = 1.0 / _112;
    float _372 = fma(_360, _360, _362);
    float _374 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_368, _368, _372);
    float _382 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _392 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = sqrt(_380);
    float _396 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _398 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].z, _390);
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _402 = _116 * _370;
    bool _404 = _394 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_394);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_344, _364, _384);
    float _416 = fma(_336, _364, _386);
    float _418 = fma(_354, _364, _388);
    float _420 = _398;
    float _422 = _396;
    float _424 = _400;
    if (!_412)
    {
        bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _428 = !_426;
        if (!_428)
        {
            float _430 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _430);
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _440);
            float _448 = _442 * _442;
            float _450 = fma(_444, _444, _448);
            float _452 = fma(_446, _446, _450);
            float _454 = rsqrt(_452);
            float _456 = _454 * 9.9999999747524270787835121154785e-07;
            float _458 = _444 * _456;
            float _460 = _442 * _456;
            float _462 = _446 * _456;
            _420 = _460;
            _422 = _458;
            _424 = _462;
            _464 = true;
        }
        else
        {
            float _466 = _146 * _146;
            float _468 = fma(_144, _144, _466);
            float _470 = fma(_148, _148, _468);
            float _472 = sqrt(_470);
            bool _474 = _472 >= 9.9999999747524270787835121154785e-07;
            bool _476 = isnan(_472);
            bool _478 = _474 || _476;
            bool _480 = isnan(9.9999999747524270787835121154785e-07);
            bool _482 = _478 || _480;
            if (!_482)
            {
                float _484 = _386 * _386;
                float _486 = fma(_384, _384, _484);
                float _488 = fma(_388, _388, _486);
                float _490 = sqrt(_488);
                bool _492 = _490 >= 9.9999999747524270787835121154785e-07;
                bool _494 = isnan(_490);
                bool _496 = _492 || _494;
                bool _498 = isnan(9.9999999747524270787835121154785e-07);
                bool _500 = _496 || _498;
                if (!_500)
                {
                    float _502 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _502);
                    float _506 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _504);
                    float _508 = rsqrt(_506);
                    float _510 = _508 * 9.9999999747524270787835121154785e-07;
                    float _512 = _510 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _514 = _510 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _516 = _510 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _420 = _514;
                    _422 = _512;
                    _424 = _516;
                    _464 = true;
                }
                else
                {
                    float _518 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _522 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _524 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].x, _518);
                    float _526 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
                    float _528 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
                    float _532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
                    float _534 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
                    float _536 = _530 * _530;
                    float _538 = fma(_532, _532, _536);
                    float _540 = fma(_534, _534, _538);
                    float _542 = rsqrt(_540);
                    float _544 = _542 * 9.9999999747524270787835121154785e-07;
                    float _546 = _532 * _544;
                    float _548 = _530 * _544;
                    float _550 = _534 * _544;
                    _420 = _548;
                    _422 = _546;
                    _424 = _550;
                    _464 = true;
                }
            }
            else
            {
                float _552 = _146 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _554 = _146 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _556 = _146 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _558 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _552);
                float _560 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
                float _562 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
                float _564 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].z, _558);
                float _566 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
                float _570 = _564 * _564;
                float _572 = fma(_566, _566, _570);
                float _574 = fma(_568, _568, _572);
                float _576 = rsqrt(_574);
                float _578 = _576 * 9.9999999747524270787835121154785e-07;
                float _580 = _566 * _578;
                float _582 = _564 * _578;
                float _584 = _568 * _578;
                _420 = _582;
                _422 = _580;
                _424 = _584;
            }
        }
    }
    _464 = false;
    float _586 = _420;
    float _588 = _422;
    float _590 = _424;
    bool _592 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _594 = !_592;
    float _612;
    if (!_594)
    {
        float _596 = in.m_51.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        _612 = _402;
    }
    _614 = false;
    float _616 = _612;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _630;
    float _634 = 1.0 / _620;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _648 = 1.0 / _632;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _652 = _616 + _650;
    bool _654 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _656 = isnan(_616);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_664;
    float _668 = _666 + 1.0;
    float _670 = 1.0 / _624;
    float _672 = _652 * _634;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _676 = _616 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _680 = _616 + _678;
    bool _682 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _684 = isnan(_616);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _638;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _698 = 1.0 / _628;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _702 = _616 + _700;
    float _704 = 1.0 / _642;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _708 = _616 + _706;
    float _710 = _676 * _694;
    bool _712 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _714 = isnan(_616);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = _708 * _648;
    float _726 = _702 * _670;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _730 = _616 + _728;
    float _732 = 1.0 / _646;
    float _734 = _680 * _698;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _738 = _616 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _740;
    float _744 = -_722;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    float _752 = _730 * _704;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _754;
    float _758 = fma(_742, _672, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _764 = fma(_750, _672, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _766 = fma(_756, _672, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _776 = _738 * _732;
    bool _778 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _780 = isnan(_616);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = _664 * _746;
    float _792 = fma(_774, _734, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _794 = fma(_762, _734, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _796 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _798 = isnan(_616);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = -_788;
    float _810 = _808 + 1.0;
    float _812 = fma(_770, _734, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _814 = _788 * _668;
    bool _816 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _818 = isnan(_616);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = _806 * _810;
    float _830 = -_806;
    float _832 = _830 + 1.0;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _838;
    float _842 = -_826;
    float _844 = _842 + 1.0;
    float _846 = _826 * _832;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _848;
    bool _852 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _854 = isnan(_616);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = fma(_836, _724, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _866 = fma(_840, _724, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _868 = fma(_850, _724, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _870 = _692 * _844;
    bool _872 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _874 = isnan(_616);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -_862;
    float _886 = _884 + 1.0;
    float _888 = -_692;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _896 = _882 * _886;
    float _898 = _862 * _890;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _908 = -_882;
    float _910 = _908 + 1.0;
    float _912 = _764 * _896;
    float _914 = fma(_894, _710, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _916 = fma(_902, _710, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _918 = fma(_906, _710, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _920 = _766 * _896;
    float _922 = _758 * _896;
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].x, _912);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].y, _920);
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].z, _922);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _930;
    float _934 = fma(_812, _898, _924);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _940;
    float _944 = fma(_794, _898, _926);
    float _946 = fma(_932, _726, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _948 = fma(_938, _726, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _950 = fma(_942, _726, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _952 = fma(_792, _898, _928);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _966 = fma(_868, _870, _934);
    float _968 = fma(_864, _870, _944);
    float _970 = fma(_866, _870, _952);
    float _972 = fma(_956, _776, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _974 = fma(_960, _776, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _976 = fma(_964, _776, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _978 = fma(_914, _846, _966);
    float _980 = in.m_49.x;
    float _982 = in.m_49.y;
    float _984 = in.m_49.z;
    float _986 = fma(_916, _846, _968);
    float _988 = fma(_918, _846, _970);
    float _990 = fma(_948, _828, _978);
    float _992 = fma(_946, _828, _986);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _994;
    float _998 = fma(_950, _828, _988);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1000;
    float _1004 = fma(_972, _814, _990);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _1006;
    float _1010 = fma(_996, _752, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1012 = fma(_1002, _752, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1014 = fma(_974, _814, _992);
    float _1016 = fma(_1008, _752, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _1018 = fma(_976, _814, _998);
    float _1020 = fma(_1010, _790, _1004);
    float _1022 = fma(_1012, _790, _1014);
    float _1024 = fma(_1016, _790, _1018);
    float _1026 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1020);
    float _1028 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1022);
    float _1030 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[150].z, _1024);
    float _1032 = _1026 * _980;
    float _1034 = _1028 * _982;
    float _1036 = _1030 * _984;
    bool _1038 = !_696;
    float _1056;
    if (!_1038)
    {
        float _1040 = in.m_51.x;
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1044 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _1048 = _1046 * _1042;
        float _1050 = floor(_1048);
        float _1052 = -_1050;
        float _1054 = _1048 + _1052;
        _1056 = _1054;
        _1058 = true;
    }
    else
    {
        _1056 = _402;
    }
    _1058 = false;
    float _1060 = _1056;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1064 = _1060 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1068 = _1060 + _1066;
    bool _1070 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1072 = isnan(_1060);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1088 = _1060 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1098 = 1.0 / _1084;
    bool _1100 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1102 = 1.0 / _1096;
    float _1104 = 1.0 / _1092;
    float _1106 = _1064 * _1098;
    bool _1108 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1110 = isnan(_1060);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = -_1080;
    float _1122 = _1120 + 1.0;
    float _1124 = _1118 * _1122;
    float _1126 = _1068 * _1102;
    bool _1128 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1130 = isnan(_1060);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1140;
    bool _1144 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1146 = isnan(_1060);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1160 = -_1118;
    float _1162 = _1160 + 1.0;
    float _1164 = -_1138;
    float _1166 = _1164 + 1.0;
    float _1168 = _1088 * _1104;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1174;
    float _1178 = _1154 * _1166;
    float _1180 = fma(_1142, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1182 = fma(_1172, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1184 = fma(_1176, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1186 = _1138 * _1162;
    float _1188 = -_1154;
    float _1190 = _1188 + 1.0;
    float _1192 = _1182 * _1178;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1202 = _1184 * _1178;
    float _1204 = _1180 * _1178;
    float _1206 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1192);
    float _1208 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1202);
    float _1210 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1204);
    float _1212 = fma(_1158, _1126, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1214 = fma(_1196, _1126, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1216 = fma(_1200, _1126, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1226;
    float _1230 = fma(_1212, _1186, _1206);
    float _1232 = fma(_1220, _1106, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1234 = fma(_1224, _1106, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1236 = fma(_1228, _1106, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1238 = fma(_1214, _1186, _1208);
    float _1240 = fma(_1216, _1186, _1210);
    float _1242 = fma(_1232, _1124, _1230);
    float _1244 = fma(_1234, _1124, _1238);
    float _1246 = fma(_1236, _1124, _1240);
    float _1248 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[110].x, _1242);
    float _1250 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[110].y, _1244);
    float _1252 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[110].z, _1246);
    bool _1254 = !_1100;
    float _1272;
    if (!_1254)
    {
        float _1256 = in.m_51.x;
        float _1258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1260 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _1264 = _1262 * _1258;
        float _1266 = floor(_1264);
        float _1268 = -_1266;
        float _1270 = _1264 + _1268;
        _1272 = _1270;
        _1274 = true;
    }
    else
    {
        _1272 = _402;
    }
    _1274 = false;
    float _1276 = _1272;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1280 = _1276 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1290 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1292 = isnan(_1276);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1302;
    float _1306 = 1.0 / _1284;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1312 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1314 = isnan(_1276);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1320 = _1316 || _1318;
    float _1322 = float(_1320);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1328 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1330 = isnan(_1276);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = 1.0 / _1288;
    float _1342 = -_1322;
    float _1344 = _1342 + 1.0;
    bool _1346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1348 = _1300 * _1344;
    float _1350 = _1304 * _1306;
    bool _1352 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1354 = isnan(_1276);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = -_1300;
    float _1366 = _1364 + 1.0;
    float _1368 = 1.0 / _1310;
    float _1370 = fma(_1350, _1280, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1372;
    float _1376 = _1362 * _1366;
    float _1378 = -_1362;
    float _1380 = _1378 + 1.0;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1384 = _1382 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1386 = 1.0 / _1326;
    float _1388 = _1338 * _1380;
    float _1390 = _1384 * _1340;
    float _1392 = -_1338;
    float _1394 = _1392 + 1.0;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1398 = _1276 + _1396;
    float _1400 = _1370 * _1388;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1404 = _1276 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1410 = _1374 * _1368;
    bool _1412 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1414 = isnan(_1276);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = fma(_1390, _1404, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1426 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1400);
    float _1428 = fma(_1410, _1398, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1432 = _1276 + _1430;
    float _1434 = -_1422;
    float _1436 = _1434 + 1.0;
    float _1438 = fma(_1424, _1376, _1426);
    float _1440 = _1408 * _1386;
    float _1442 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1444 = _1322 * _1436;
    float _1446 = fma(_1428, _1348, _1438);
    float _1448 = fma(_1440, _1432, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1450 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1452 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1454 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1456 = fma(_1448, _1444, _1446);
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1462 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1456);
    float _1464 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1454;
    out.m_53.y = _1458;
    out.m_53.z = _1460;
    out.m_53.w = _1464;
    bool _1466 = !_1346;
    float _1468 = _1460;
    float _1486;
    if (!_1466)
    {
        float _1470 = in.m_51.x;
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1474 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _1478 = _1476 * _1472;
        float _1480 = floor(_1478);
        float _1482 = -_1480;
        float _1484 = _1478 + _1482;
        _1486 = _1484;
        _1488 = true;
    }
    else
    {
        _1486 = _402;
    }
    _1488 = false;
    float _1490 = _1486;
    float _1492 = _586 * _586;
    float _1494 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1496 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1498 = in.m_51.x;
    float _1500 = fma(_588, _588, _1492);
    float _1502 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1504 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1496);
    float _1506 = in.m_55.z;
    float _1508 = fma(_590, _590, _1500);
    float _1510 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1512 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1494);
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1516 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1510);
    float _1518 = rsqrt(_1508);
    float _1520 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1512);
    float _1522 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1516);
    float _1524 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1504);
    float _1526 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1528 = _1522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1530 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1534 = _1526 + _1532;
    float _1536 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1530 + _1538;
    float _1542 = _1534 * _1534;
    float _1544 = _1518 * _586;
    float _1546 = _1518 * _588;
    float _1548 = _1518 * _590;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1552 = _1528 + _1550;
    float _1554 = _1544 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1556 = fma(_1546, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1554);
    float _1558 = fma(_1552, _1552, _1542);
    float _1560 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0500000007450580596923828125, _1498);
    float _1562 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1556);
    float _1564 = fma(_1540, _1540, _1558);
    float _1566 = rsqrt(_1564);
    float _1568 = abs(_1562);
    bool _1570 = _1568 > 0.99989998340606689453125;
    float _1572 = _1496;
    float _1574 = _1564;
    float _1576 = _1562;
    float _1578 = _1544;
    float _1580 = _1530;
    if (_1570)
    {
        _1468 = 0.001000000047497451305389404296875;
    }
    float _1582 = _1468;
    float _1584 = _1514 * _1566;
    if (!_1570)
    {
        _1572 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1586 = _1572;
    float _1588 = _1586;
    if (_1570)
    {
        float _1590 = fma(_1582, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1588 = _1590;
    }
    float _1592 = _1588;
    float _1594 = _1534 * _1584;
    float _1596 = _1594;
    if (!_1570)
    {
        _1574 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1598 = _1574;
    float _1600 = _1560 + _1506;
    float _1602 = _1598;
    if (_1570)
    {
        float _1604 = fma(_1582, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1602 = _1604;
    }
    float _1606 = _1602;
    float _1608 = _1552 * _1584;
    float _1610 = -_1594;
    float _1612 = _1534 + _1610;
    float _1614 = -_1592;
    float _1616 = _1548 * _1614;
    if (!_1570)
    {
        _1576 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1618 = _1576;
    float _1620 = _1600 * 2.0;
    float _1622 = -_1608;
    float _1624 = _1552 + _1622;
    float _1626 = _1612 * _1612;
    float _1628 = -_1606;
    float _1630 = -_1616;
    float _1632 = fma(_1546, _1628, _1630);
    float _1634 = _1618;
    if (_1570)
    {
        float _1636 = fma(_1582, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = -_1606;
    float _1642 = _1544 * _1640;
    float _1644 = _1540 * _1584;
    float _1646 = _1620 * 0.15915493667125701904296875;
    float _1648 = fma(_1624, _1624, _1626);
    float _1650 = -_1638;
    float _1652 = -_1642;
    float _1654 = fma(_1548, _1650, _1652);
    float _1656 = -_1638;
    float _1658 = _1546 * _1656;
    float _1660 = _1632 * _1632;
    float _1662 = -_1644;
    float _1664 = _1540 + _1662;
    float _1666 = in.m_55.x;
    float _1668 = -_1592;
    float _1670 = -_1658;
    float _1672 = fma(_1544, _1668, _1670);
    float _1674 = fma(_1654, _1654, _1660);
    float _1676 = _1646 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = fma(_1664, _1664, _1648);
    float _1682 = in.m_55.y;
    float _1684 = fma(_1672, _1672, _1674);
    float _1686 = precise::max(_402, 0.300000011920928955078125);
    float _1688 = sqrt(_1680);
    float _1690 = precise::min(_1686, 0.800000011920928955078125);
    float _1692 = fma(_1690, 2.0, -0.60000002384185791015625);
    float _1694 = rsqrt(_1684);
    float _1696 = _1678 * 0.2599999904632568359375;
    float _1698 = fma(_1696, _1692, _1666);
    float _1700 = _1566 * _1688;
    float _1702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1506);
    float _1704 = _1536 * _1700;
    float _1706 = _1502 * _1700;
    float _1708 = _1672 * _1694;
    float _1710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1682);
    float _1712 = _1654 * _1694;
    float _1714 = _1632 * _1694;
    float _1716 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1698);
    float _1720 = _1704 * _1710;
    float _1722 = _1546 * _1714;
    float _1724 = _1716 * _1700;
    float _1726 = _1706 * _1718;
    float _1728 = _1720 * _1548;
    float _1730 = _1544 * _1708;
    float _1732 = _1724 * _1702;
    float _1734 = -_1722;
    float _1736 = fma(_1544, _1712, _1734);
    float _1738 = _1720 * _1546;
    float _1740 = fma(_1726, _1708, _1728);
    float _1742 = -_1730;
    float _1744 = fma(_1548, _1714, _1742);
    float _1746 = fma(_1726, _1712, _1738);
    float _1748 = fma(_1732, _1736, _1740);
    float _1750 = _1548 * _1712;
    float _1752 = fma(_1732, _1744, _1746);
    float _1754 = _1530 + _1748;
    float _1756 = -_1750;
    float _1758 = fma(_1546, _1708, _1756);
    float _1760 = _1528 + _1752;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1764 = _1754 + _1762;
    bool _1766 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1768 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan(0.5);
    bool _1774 = _1770 || _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1778 = _1760 + _1776;
    float _1780 = _1764 * _1764;
    float _1782 = fma(_1778, _1778, _1780);
    float _1784 = _1720 * _1544;
    float _1786 = sqrt(_1782);
    float _1788 = fma(_1726, _1714, _1784);
    float _1790 = fma(_1732, _1758, _1788);
    float _1792 = _1526 + _1790;
    float _1794 = -_1608;
    float _1796 = _1528 + _1794;
    bool _1798 = _1786 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1800 = _1788;
    float _1802 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1804 = _1700;
    float _1806 = _1708;
    if (!_1798)
    {
        _1578 = _1760;
    }
    float _1808 = _1578;
    float _1810 = _1808;
    if (!_1798)
    {
        _1800 = _1754;
    }
    float _1812 = _1800;
    float _1814 = _1812;
    if (!_1798)
    {
        _1802 = _1792;
    }
    float _1816 = _1802;
    bool _1818 = !_1798;
    float _1820 = _1816;
    if (!_1818)
    {
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1826 = _1786 + _1824;
        float _1828 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1830 = rsqrt(_1782);
        float _1832 = _1826 * _1822;
        float _1834 = _1832 * 0.15915493667125701904296875;
        float _1836 = _1834 * 6.283185482025146484375;
        float _1838 = cos(_1836);
        float _1840 = _1834 * 6.283185482025146484375;
        float _1842 = sin(_1840);
        float _1844 = _1838 + (-1.0);
        float _1846 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1848 = fma(_1842, _1828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1850 = fma(_1792, _1838, _1846);
        float _1852 = _1830 * _1848;
        float _1854 = fma(_1778, _1852, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1856 = fma(_1764, _1852, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1810 = _1854;
        _1814 = _1856;
        _1820 = _1850;
    }
    float _1858 = _1810;
    float _1860 = _1814;
    float _1862 = _1820;
    float _1864 = -_1608;
    float _1866 = _1864 + _1858;
    float _1868 = -_1644;
    float _1870 = _1868 + _1860;
    float _1872 = -_1594;
    float _1874 = _1872 + _1862;
    float _1876 = -_1594;
    float _1878 = _1526 + _1876;
    float _1880 = -_1644;
    float _1882 = _1530 + _1880;
    float _1884 = _1866;
    float _1886 = _1874;
    float _1888 = _1858;
    if (_1774)
    {
        _1596 = _1866;
    }
    float _1890 = _1596;
    float _1892 = _1890;
    if (_1774)
    {
        _1884 = _1870;
    }
    float _1894 = _1884;
    float _1896 = _1894;
    if (!_1774)
    {
        float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1900 = _1878 + _1898;
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1904 = _1796 + _1902;
        float _1906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1908 = -_1530;
        float _1910 = _1908 + _1860;
        float _1912 = _1900 * _1900;
        float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1916 = _1882 + _1914;
        float _1918 = -_1528;
        float _1920 = _1918 + _1858;
        float _1922 = -_1526;
        float _1924 = _1922 + _1862;
        float _1926 = fma(_1904, _1904, _1912);
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1930 = fma(_1916, _1916, _1926);
        float _1932 = sqrt(_1930);
        float _1934 = 1.0 / _1700;
        float _1936 = precise::min(_1932, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1938 = _1936 * _1906;
        float _1940 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1942 = _1938 * _1934;
        float _1944 = _1940 * _1942;
        float _1946 = _1910 * _1942;
        float _1948 = fma(_1920, _1944, _1796);
        float _1950 = fma(_1924, _1944, _1878);
        float _1952 = fma(_1940, _1946, _1882);
        _1886 = _1950;
        _1892 = _1948;
        _1896 = _1952;
        _1804 = _1934;
        _1580 = _1946;
    }
    float _1954 = _1886;
    float _1956 = _1892;
    float _1958 = _1896;
    float _1960 = _1804;
    float _1962 = _1580;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1966 = _1954 + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1970 = _1956 + _1968;
    float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1974 = _1958 + _1972;
    float _1976 = _1966 * _1966;
    float _1978 = fma(_1970, _1970, _1976);
    float _1980 = fma(_1974, _1974, _1978);
    float _1982 = rsqrt(_1980);
    float _1984 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1986 = _1970 * _1984;
    float _1988 = _1974 * _1984;
    float _1990 = _1986 * _1986;
    float _1992 = _1988 * _1988;
    float _1994 = _1990 + _1992;
    float _1996 = sqrt(_1994);
    bool _1998 = _1996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2002 = _1996 + _2000;
    float _2004 = _1960;
    float _2006 = _2002;
    float _2008 = _1966;
    float _2010 = _1986;
    if (_1998)
    {
        float _2012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2004 = _2012;
    }
    float _2014 = _2004;
    float _2016 = _2014;
    if (_1998)
    {
        float _2018 = _2002 * _2014;
        _2006 = _2018;
    }
    float _2020 = _2006;
    if (_1998)
    {
        float _2022 = rsqrt(_1994);
        _2016 = _2022;
    }
    float _2024 = _2016;
    float _2026 = _2024;
    if (_1998)
    {
        float _2028 = _2020 * 0.15915493667125701904296875;
        _1888 = _2028;
    }
    float _2030 = _1888;
    float _2032 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2034 = _1974;
    if (_1998)
    {
        float _2036 = _2030 * 6.283185482025146484375;
        float _2038 = sin(_2036);
        _2034 = _2038;
    }
    float _2040 = _2034;
    float _2042 = precise::max(0.0, _2032);
    float _2044 = _1962;
    float _2046 = _2042;
    if (_1998)
    {
        float _2048 = _2030 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        _2044 = _2050;
    }
    float _2052 = _2044;
    float _2054 = -_1984;
    float _2056 = -_2042;
    float _2058 = fma(_1966, _2054, _2056);
    if (_1998)
    {
        float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2008 = _2060;
    }
    float _2062 = _2008;
    float _2064 = sqrt(_1980);
    float _2066 = _2040;
    float _2068 = _2062;
    if (_1998)
    {
        float _2070 = fma(_2040, _2062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2066 = _2070;
    }
    float _2072 = _2066;
    float _2074 = _2072;
    if (!_1998)
    {
        _2068 = _1990;
    }
    float _2076 = _2068;
    float _2078 = _2076;
    if (_1998)
    {
        float _2080 = _2024 * _2072;
        _1806 = _2080;
    }
    float _2082 = _1806;
    if (!_1998)
    {
        _2074 = _2058;
    }
    float _2084 = _2074;
    float _2086 = _2084;
    float _2088 = _2052;
    if (_1998)
    {
        float _2090 = _2052 + (-1.0);
        _2046 = _2090;
    }
    float _2092 = _2046;
    float _2094 = _2092;
    if (_1998)
    {
        float _2096 = _1986 * _2082;
        _2010 = _2096;
    }
    float _2098 = _2010;
    float _2100 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1998)
    {
        float _2102 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2026 = _2102;
    }
    float _2104 = _2026;
    if (!_1998)
    {
        _2094 = _1988;
    }
    float _2106 = _2094;
    float _2108 = _2106;
    if (_1998)
    {
        float _2110 = _1988 * _2082;
        _2108 = _2110;
    }
    float _2112 = _2108;
    if (_1998)
    {
        float _2114 = _2098 * _2098;
        _2078 = _2114;
    }
    float _2116 = _2078;
    if (_1998)
    {
        float _2118 = fma(_2058, _2052, _2104);
        _2086 = _2118;
    }
    float _2120 = _2086;
    if (!_1998)
    {
        _2088 = _1992;
    }
    float _2122 = _2088;
    float _2124 = _2122;
    if (_1998)
    {
        float _2126 = _2112 * _2112;
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = fma(_2120, _2120, _2116);
    float _2132 = _2130 + _2128;
    float _2134 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2138 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2136);
    float _2140 = precise::clamp(_2138, 0.0, 1.0);
    float _2142 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2144 = rsqrt(_2132);
    float _2146 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2134);
    float _2148 = -_2140;
    float _2150 = _2148 + 1.0;
    float _2152 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2154 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2142);
    float _2156 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2146);
    float _2158 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2160 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2152);
    float _2162 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2154);
    float _2164 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2166 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2158);
    float _2168 = abs(_2150);
    float _2170 = log2(_2168);
    float _2172 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2160);
    float _2174 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2176 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2166);
    float _2180 = _2144 * _2098;
    float _2182 = -_2174;
    float _2184 = fma(_2182, _2100, 1.0);
    float _2186 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2188 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = _2144 * _2120;
    float _2192 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2194 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2196 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2198 = _2144 * _2112;
    float _2200 = -_2192;
    float _2202 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2200);
    float _2204 = log2(_2184);
    float _2206 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2208 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2196);
    float _2210 = -_2198;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2202);
    float _2214 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2216 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2218 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2208);
    float _2220 = fma(_2212, -0.5, 0.5);
    float _2222 = exp2(_2206);
    float _2224 = fma(_2212, 0.5, 0.5);
    float _2226 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2214);
    float _2228 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2216);
    float _2230 = _2190 + 1.0;
    float _2232 = fma(_2224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2226);
    float _2236 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2228);
    float _2238 = 1.0 / _2218;
    float _2240 = fma(_2224, _2232, -0.212114393711090087890625);
    float _2242 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2234);
    float _2244 = _2204 * 0.693147182464599609375;
    float _2246 = fma(_2224, _2240, 1.570728778839111328125);
    float _2248 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2250 = sqrt(_2220);
    float _2252 = -_2190;
    float _2254 = fma(_2222, _2230, _2252);
    float _2256 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2236);
    float _2258 = fma(_2254, 0.5, 0.5);
    float _2260 = _2242 * _2238;
    float _2262 = _2256 * _2238;
    float _2264 = fma(_2260, 0.5, 0.5);
    float _2266 = fma(_2262, -0.5, 0.5);
    float _2268 = _2250 * 0.636619746685028076171875;
    float _2270 = -_2246;
    float _2272 = fma(_2268, _2270, 1.0);
    float3 _6907 = float3(_2264, _2266, _2248);
    float _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6907, float3(0.0), isnan(_6907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6907, float3(0.0), isnan(_6907)), level(0.0)).x;
    float3 _6918 = float3(_2264, _2266, _2248);
    float4 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6918, float3(0.0), isnan(_6918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6918, float3(0.0), isnan(_6918)), level(0.0)).xyzw;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = _2277.w;
    float2 _6935 = float2(_2272, _2258);
    float3 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6935, float2(0.0), isnan(_6935)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6935, float2(0.0), isnan(_6935)), level(0.0)).xyz;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = in.m_57.x;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2301 = _1490 + _2299;
    float _2303 = in.m_57.y;
    int _2305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2307 = _2305 != 0;
    float _2309 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2311 = _1490 + _2309;
    float _2313 = in.m_51.y;
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2317 = _1490 + _2315;
    float _2319 = in.m_51.z;
    float _2321 = in.m_51.w;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2325 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2329 = _2327 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _2331 = false;
    float _2333 = _2264;
    int _2335 = 1065353216;
    if (_2307)
    {
        bool _2337 = _1498 > 0.5;
        _2331 = _2337;
    }
    bool _2339 = _2331;
    float _2341 = 1.0 / _2325;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2345 = _2343 != 0;
    float _2347 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2349 = _2297;
    float _2351 = _2347;
    if (!_2307)
    {
        _2333 = _2297;
    }
    float _2353 = _2333;
    int _2355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2357 = _2355 != 0;
    float _2359 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2347);
    int _2361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2363 = _2361 != 0;
    float _2365 = 1.0 / _2329;
    int _2367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2369 = _2367 != 0;
    float _2371 = _2353;
    if (_2307)
    {
        float _2373 = -_2297;
        float _2375 = _2373 + 1.0;
        _2335 = as_type<int>(_2375);
    }
    int _2377 = _2335;
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2381 = _2379 != 0;
    float _2383 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2385 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2383;
    float _2387 = -_2303;
    float _2389 = _2387 + 1.0;
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2393 = _2391 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2395 = _2303;
    if (_2307)
    {
        float _2397 = _2339 ? as_type<float>(_2377) : _2297;
        _2371 = _2397;
    }
    float _2399 = _2371;
    float _2401 = 1.0 / _2385;
    bool _2403 = _2313 > 0.5;
    float _2405 = _2301 * _2341;
    int _2407 = 0;
    float _2409 = _2313;
    if (_2357)
    {
        float _2411 = -_2297;
        float _2413 = _2411 + 1.0;
        _2407 = as_type<int>(_2413);
    }
    int _2415 = _2407;
    bool _2417 = _2319 > 0.5;
    float _2419 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2421 = _2419 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _2423 = _2403 ? as_type<int>(_2389) : as_type<int>(_2303);
    float _2425 = 1.0 / _2393;
    int _2427 = _2417 ? as_type<int>(_2389) : as_type<int>(_2303);
    float _2429 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2431 = _2429 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2433 = _2363 ? as_type<float>(_2423) : _2303;
    bool _2435 = _2321 > 0.5;
    float _2437 = _2311 * _2401;
    float _2439 = 1.0 / _2421;
    float _2441 = _2369 ? as_type<float>(_2427) : _2303;
    float _2443 = _2319;
    if (_2381)
    {
        float _2445 = _2435 ? _2389 : _2303;
        _2395 = _2445;
    }
    float _2447 = _2395;
    float _2449 = 1.0 / _2431;
    float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2459 = _2457 != 0;
    float _2461 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2463 = 1.0 / _2453;
    bool _2465 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan(0.5);
    bool _2473 = _2469 || _2471;
    float _2475 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2477 = _2475 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2481 = _1490 + _2479;
    float _2483 = -_2455;
    float _2485 = fma(_2461, 2.0, _2483);
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2489 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2491 = _2481 * _2365;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2497 = fma(_2489, -2.0, _2487);
    float _2499 = 1.0 / _2477;
    float _2501 = _2317 * _2425;
    float _2503 = -_116;
    float _2505 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2485);
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2507;
    float _2511 = 1.0 / _2495;
    float _2513 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2515 = _2513 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2517;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2523 = _2521 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2525 = _2509 * _2463;
    float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2527;
    float _2531 = _2519 * _2439;
    float _2533 = 1.0 / _2515;
    float _2535 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2537 = _2535 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _2539 = _2523 * _2449;
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2545 = 1.0 / _2537;
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2549 = _2547 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2551 = _2529 * _2511;
    float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2555 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2553;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2557;
    float _2561 = _2543 * _2499;
    float _2563 = fma(_2555, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2565;
    float _2569 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2569;
    float _2573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2575 = _2549 * _2533;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2581 = fma(_2571, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2585 = _2583 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2587 = _2567 * _2545;
    float _2589 = fma(_2559, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2593 = _2591 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2595 = fma(_2585, _2491, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2597;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2603 = _2601 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2605;
    float _2609 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2611 = _2609 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2621 = fma(_2593, _2491, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2625 = fma(_2579, _2491, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2627 = fma(_2599, _2437, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2629 = fma(_2607, _2437, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2631 = fma(_2615, _2437, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2635 = _402 + _2633;
    float _2637 = fma(_2603, _2501, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2639 = _2573 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2643 = _402 + _2641;
    float _2645 = fma(_2531, _2635, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2647 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2649 = _402 + _2647;
    float _2651 = fma(_2639, _2433, -0.5);
    float _2653 = fma(_2525, _2643, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2657 = _402 + _2655;
    float _2659 = fma(_2539, _2649, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2661 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2663 = _402 + _2661;
    float _2665 = _2623 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2667 = fma(_2575, _2657, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2671 = _402 + _2669;
    bool _2673 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2675 = isnan(_402);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = fma(_2441, _2665, -0.5);
    bool _2687 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2689 = isnan(_402);
    bool _2691 = _2687 || _2689;
    bool _2693 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2695 = _2691 || _2693;
    float _2697 = float(_2695);
    float _2699 = fma(_2587, _2663, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2701 = fma(_2561, _2671, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _2703 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2705 = isnan(_1490);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = -_2683;
    float _2717 = _2715 + 1.0;
    float _2719 = -_2697;
    float _2721 = _2719 + 1.0;
    bool _2723 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2725 = isnan(_402);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2731 = _2727 || _2729;
    float _2733 = float(_2731);
    float _2735 = fma(_2611, _2501, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2737 = -_2713;
    float _2739 = _2737 + 1.0;
    bool _2741 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2743 = isnan(_1490);
    bool _2745 = _2741 || _2743;
    bool _2747 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2749 = _2745 || _2747;
    float _2751 = float(_2749);
    float _2753 = fma(_2619, _2501, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _2755 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2757 = isnan(_1490);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2763 = _2759 || _2761;
    float _2765 = float(_2763);
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2769 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2771 = isnan(_1490);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = -_2751;
    float _2783 = _2781 + 1.0;
    bool _2785 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2787 = isnan(_1490);
    bool _2789 = _2785 || _2787;
    bool _2791 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2793 = _2789 || _2791;
    float _2795 = float(_2793);
    float _2797 = _2683 * _2721;
    bool _2799 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2801 = isnan(_402);
    bool _2803 = _2799 || _2801;
    bool _2805 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2807 = _2803 || _2805;
    float _2809 = float(_2807);
    float _2811 = _2733 * _2717;
    float _2813 = -_2733;
    float _2815 = _2813 + 1.0;
    bool _2817 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2819 = isnan(_402);
    bool _2821 = _2817 || _2819;
    bool _2823 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2825 = _2821 || _2823;
    float _2827 = float(_2825);
    float _2829 = _2751 * _2739;
    float _2831 = -_2809;
    float _2833 = _2831 + 1.0;
    float _2835 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2767);
    float _2837 = _2809 * _2815;
    float _2839 = _2795 * _2783;
    float _2841 = -_2795;
    float _2843 = _2841 + 1.0;
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2847 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2849 = isnan(_402);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2855 = _2851 || _2853;
    float _2857 = float(_2855);
    float _2859 = _2827 * _2833;
    float _2861 = -_2827;
    float _2863 = _2861 + 1.0;
    float _2865 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2835);
    float _2867 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2497);
    bool _2869 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2871 = isnan(_402);
    bool _2873 = _2869 || _2871;
    bool _2875 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2877 = _2873 || _2875;
    float _2879 = float(_2877);
    float _2881 = _2779 * _2843;
    float _2883 = -_2779;
    float _2885 = _2883 + 1.0;
    float _2887 = _2857 * _2863;
    float _2889 = -_2867;
    float _2891 = fma(_2865, _2651, _2889);
    float _2893 = -_2857;
    float _2895 = _2893 + 1.0;
    bool _2897 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2899 = isnan(_402);
    bool _2901 = _2897 || _2899;
    bool _2903 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2905 = _2901 || _2903;
    float _2907 = float(_2905);
    float _2909 = _2765 * _2885;
    float _2911 = -_2879;
    float _2913 = _2911 + 1.0;
    float _2915 = _2879 * _2895;
    float _2917 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2919 = _402 + _2917;
    float _2921 = _2581 * _2909;
    float _2923 = _2563 * _2909;
    float _2925 = _2589 * _2909;
    float _2927 = _2907 * _2913;
    int _2929 = as_type<int>(_2909);
    float _2931 = _2645;
    float _2933 = _2589;
    float _2935 = _2713;
    float _2937 = _2667;
    if (_2345)
    {
        float _2939 = -_2297;
        float _2941 = _2939 + 1.0;
        _2929 = as_type<int>(_2941);
    }
    int _2943 = _2929;
    float _2945 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2947 = _2645 * _2927;
    float _2949 = -_2765;
    float _2951 = _2949 + 1.0;
    float _2953 = 0.0;
    if (!_2459)
    {
        _2953 = _2313;
    }
    float _2955 = _2953;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2959 = _2955;
    if (!_2345)
    {
        _2931 = _2297;
    }
    float _2961 = _2931;
    float _2963 = fma(_2551, _2919, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2965 = _2961;
    if (_2345)
    {
        float _2967 = _2417 ? as_type<float>(_2943) : _2297;
        _2965 = _2967;
    }
    float _2969 = _2965;
    float _2971 = fma(_2945, _2447, -0.5);
    if (_2459)
    {
        _2959 = _1498;
    }
    float _2973 = _2959;
    float _2975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_2357)
    {
        float _2977 = _2403 ? as_type<float>(_2415) : _2297;
        _2349 = _2977;
    }
    float _2979 = _2349;
    float _2981 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2921);
    float _2983 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2923);
    float _2985 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2925);
    float _2987 = fma(_2973, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2957);
    float _2989 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2991 = -_2907;
    float _2993 = _2991 + 1.0;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2997 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3001 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3003 = _2993;
    if (_2459)
    {
        _2933 = _1498;
    }
    float _3005 = _2933;
    float _3007 = fma(_2993, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2947);
    float _3009 = -_2995;
    float _3011 = fma(_2989, 2.0, _3009);
    float _3013 = _3005;
    if (!_2459)
    {
        _3013 = _2319;
    }
    float _3015 = _3013;
    float _3017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_2459)
    {
        _3003 = _2319;
    }
    float _3019 = _3003;
    float _3021 = fma(_2595, _2881, _2981);
    float _3023 = fma(_2621, _2881, _2983);
    float _3025 = fma(_2625, _2881, _2985);
    float _3027 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2997);
    float _3029 = _3019;
    if (_2459)
    {
        _3029 = _2313;
    }
    float _3031 = _3029;
    float _3033 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_2459)
    {
        _2443 = _2313;
    }
    float _3035 = _2443;
    float _3037 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2999);
    float _3039 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3001);
    if (!_2459)
    {
        _2409 = _1498;
    }
    float _3041 = _2409;
    float _3043 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3033);
    float _3045 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3047 = _2975 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3049 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3043);
    float _3051 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3055 = fma(_3047, _2399, -0.5);
    float _3057 = _3017 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3059 = fma(_2627, _2839, _3021);
    float _3061 = fma(_3045, -2.0, _3053);
    float _3063 = _3049 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3065 = fma(_2629, _2839, _3023);
    float _3067 = fma(_2631, _2839, _3025);
    float _3069 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3051);
    float _3071 = 1.0 / _3063;
    float _3073 = fma(_3057, _2979, -0.5);
    float _3075 = _3015 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3077 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3069);
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3081 = _3041 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3083 = _3077 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3085 = -_3079;
    float _3087 = fma(_3075, 2.0, _3085);
    float _3089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3091 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3093 = _3083 + _3063;
    float _3095 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3037);
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3099 = fma(_3081, -2.0, _3091);
    float _3101 = _3091;
    float _3103 = _3099;
    if (!_2473)
    {
        _3101 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3105 = _3101;
    float _3107 = _3093 * _3071;
    float _3109 = _3107 * 0.5;
    float _3111 = fma(_3095, _3055, _2505);
    float _3113 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2987);
    float _3115 = -_116;
    float _3117 = fma(_3115, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3011);
    float _3119 = _3105;
    if (!_2473)
    {
        float _3121 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3123 = fma(_3109, _3105, _3121);
        _3119 = _3123;
    }
    float _3125 = _3119;
    float _3127 = fma(_3031, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3097);
    float _3129 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3039);
    float _3131 = -_116;
    float _3133 = fma(_3131, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3087);
    float _3135 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3061);
    float _3137 = _3089 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3139 = _3125;
    if (!_2473)
    {
        float _3141 = 1.0 / _3125;
        _3139 = _3141;
    }
    float _3143 = _3139;
    float _3145 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3027);
    float _3147 = fma(_2659, _2915, _3007);
    float _3149 = fma(_3137, _2969, -0.5);
    float _3151 = fma(_2637, _2829, _3059);
    float _3153 = fma(_2735, _2829, _3065);
    float _3155 = fma(_2753, _2829, _3067);
    float _3157 = fma(_3113, _3149, _3117);
    float _3159 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3127);
    float _3161 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3099);
    if (!_2473)
    {
        _3103 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3163 = _3103;
    float _3165 = fma(_2653, _2887, _3147);
    float _3167 = fma(_2713, (*spvDescriptorSet0.vp_c9)._m0[127].x, _3151);
    float _3169 = fma(_2713, (*spvDescriptorSet0.vp_c9)._m0[127].y, _3153);
    float _3171 = fma(_2713, (*spvDescriptorSet0.vp_c9)._m0[127].z, _3155);
    float _3173 = fma(_2701, _2859, _3165);
    if (!_2473)
    {
        float _3175 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3177 = -_3163;
        float _3179 = fma(_3143, _3175, _3177);
        _2351 = _3179;
    }
    float _3181 = _2351;
    float _3183 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2359);
    float _3185 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2473)
    {
        float _3187 = -_3163;
        float _3189 = _3187 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2935 = _3189;
    }
    float _3191 = _2935;
    float _3193 = -_3135;
    float _3195 = fma(_3159, _2971, _3193);
    float _3197 = fma(_2963, _2837, _3173);
    float _3199 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3183);
    float _3201 = -_3161;
    float _3203 = fma(_3145, _2685, _3201);
    float _3205 = exp2(_3185);
    float _3207 = _3195 + 0.5;
    float _3209 = fma(_2667, _2811, _3197);
    if (_2473)
    {
        _2937 = 1.0;
    }
    float _3211 = _2937;
    float _3213 = fma(_3129, _3073, _3133);
    float _3215 = fma(_2699, _2797, _3209);
    float _3217 = _3167 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3219 = _3191;
    float _3221 = _3211;
    if (!_2473)
    {
        float _3223 = 1.0 / _3191;
        _3219 = _3223;
    }
    float _3225 = _3219;
    float _3227 = _3169 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3229 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3215);
    float _3231 = _3199 + _2218;
    float _3233 = _3171 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.gl_Position.x = _2242;
    out.gl_Position.y = _2256;
    out.gl_Position.z = _3199;
    out.gl_Position.w = _2218;
    float _3235 = _2891 + 0.5;
    float _3237 = _3231 * 0.5;
    float _3239 = -_3205;
    float _3241 = _3239 + 1.0;
    float _3243 = _3111 + 0.5;
    float _3245 = _3157 + 0.5;
    float _3247 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3249 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3251 = _3213 + 0.5;
    float _3253 = _3203 + 0.5;
    float _3255 = _3217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2473)
    {
        float _3257 = _3181 * _3225;
        float _3259 = precise::clamp(_3257, 0.0, 1.0);
        _3221 = _3259;
    }
    float _3261 = _3221;
    float _3263 = _3249 * _2274;
    float _3265 = -_3249;
    float _3267 = _3265 + 1.0;
    float _3269 = _3227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3271 = _3261 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3273 = _3261 > 0.0;
    bool _3275 = isnan(_3261);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan(0.0);
    bool _3281 = _3277 || _3279;
    float _3283 = _2285 * _3263;
    float _3285 = _2295 * _3263;
    float _3287 = _3233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3289 = _3271 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3291 = fma(_2291, _3283, _2279);
    float _3293 = fma(_2293, _3283, _2281);
    float _3295 = _2285 * _3267;
    float _3297 = fma(_2285, _3285, _2283);
    out.m_61.x = _3243;
    out.m_61.y = _3235;
    out.m_61.z = _3245;
    out.m_61.w = _3207;
    out.m_63.x = _3251;
    out.m_63.y = _3253;
    out.m_65.x = _3255;
    out.m_65.y = _3269;
    out.m_65.z = _3287;
    out.m_65.w = _3247;
    out.m_67.x = _3229;
    out.m_69.z = _3237;
    out.m_69.w = _2218;
    out.m_45.x = _3289;
    out.m_71.x = _3291;
    out.m_71.y = _3293;
    out.m_71.z = _3297;
    out.m_71.w = _3295;
    if (_3281)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3299;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1488 = false;
    bool _1274 = false;
    bool _1058 = false;
    bool _614 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3357 = as_type<float>(_106);
        out.gl_Position.z = _3357;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    float _112 = float(_90);
    float _114 = -_110;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_110);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    bool _128 = _116 >= _112;
    bool _130 = !_126;
    bool _132 = _128 || _130;
    float _134 = 0.0;
    if (_132)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _108 = as_type<int>(_138);
    }
    int _140 = _108;
    float _142 = as_type<float>(_140);
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_140);
        out.gl_Position.z = _3422;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_47.x;
    float _146 = in.m_47.y;
    float _148 = in.m_47.z;
    float _150 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = _150;
    if (!_160)
    {
        float _164 = _150 * _150;
        float _166 = _164 * 0.5;
        _142 = _166;
    }
    float _168 = _142;
    float _170 = 0.0;
    float _172 = _168;
    if (!_160)
    {
        float _174 = _116 * _116;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    if (!_160)
    {
        float _180 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _180;
    }
    float _182 = _172;
    bool _184 = !_160;
    float _186 = _182;
    float _188 = 0.0;
    if (!_184)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _150 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _150);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _134 = _206;
        _186 = _218;
        _188 = _208;
    }
    float _220 = _134;
    float _222 = _186;
    float _224 = _188;
    bool _226 = !_160;
    float _228 = _220;
    float _230 = _224;
    if (!_226)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _150 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _228 = _244;
        _230 = _238;
        _162 = _250;
    }
    float _252 = _228;
    float _254 = _230;
    float _256 = _162;
    float _258 = _254;
    float _260 = _252;
    if (!_160)
    {
        _258 = _116;
    }
    float _262 = _258;
    float _264 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _262;
    if (!_160)
    {
        float _268 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _268;
    }
    float _270 = _260;
    bool _272 = !_160;
    float _274 = _270;
    if (!_272)
    {
        float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = log2(_276);
        float _280 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _282 = _280 + 1.0;
        float _284 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = _116 * _278;
        float _288 = exp2(_286);
        float _290 = _284 * 0.693147182464599609375;
        float _292 = 1.0 / _290;
        float _294 = 1.0 / _282;
        float _296 = _288 + (-1.0);
        float _298 = -_296;
        float _300 = fma(_298, _292, _116);
        float _302 = _300 * _294;
        float _304 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _304;
    }
    float _306 = _274;
    bool _308 = !_160;
    if (!_308)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _316 = _314 + 1.0;
        float _318 = 1.0 / _316;
        float _320 = _116 * _312;
        float _322 = exp2(_320);
        float _324 = -_322;
        float _326 = _324 + 1.0;
        float _328 = _326 * _318;
        _266 = _328;
    }
    float _330 = _266;
    float _332 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _336 = fma(_256, _146, _264);
    float _338 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _340 = fma(_330, _146, _332);
    float _342 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _344 = fma(_256, _144, _334);
    float _346 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = fma(_330, _144, _338);
    float _350 = -_340;
    float _352 = _336 + _350;
    float _354 = fma(_256, _148, _342);
    float _356 = fma(_330, _148, _346);
    float _358 = -_348;
    float _360 = _344 + _358;
    float _362 = _352 * _352;
    float _364 = in.m_49.w;
    float _366 = -_356;
    float _368 = _354 + _366;
    float _370 = 1.0 / _112;
    float _372 = fma(_360, _360, _362);
    float _374 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _380 = fma(_368, _368, _372);
    float _382 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = in.m_42.x;
    float _386 = in.m_42.y;
    float _388 = in.m_42.z;
    float _390 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _392 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _378);
    float _394 = sqrt(_380);
    float _396 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _398 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].z, _390);
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _402 = _116 * _370;
    bool _404 = _394 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_394);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_344, _364, _384);
    float _416 = fma(_336, _364, _386);
    float _418 = fma(_354, _364, _388);
    float _420 = _398;
    float _422 = _396;
    float _424 = _400;
    if (!_412)
    {
        bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _428 = !_426;
        if (!_428)
        {
            float _430 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _432 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _434 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _430);
            float _438 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _432);
            float _440 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _434);
            float _442 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
            float _444 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
            float _446 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _440);
            float _448 = _442 * _442;
            float _450 = fma(_444, _444, _448);
            float _452 = fma(_446, _446, _450);
            float _454 = rsqrt(_452);
            float _456 = _454 * 9.9999999747524270787835121154785e-07;
            float _458 = _444 * _456;
            float _460 = _442 * _456;
            float _462 = _446 * _456;
            _420 = _460;
            _422 = _458;
            _424 = _462;
            _464 = true;
        }
        else
        {
            float _466 = _146 * _146;
            float _468 = fma(_144, _144, _466);
            float _470 = fma(_148, _148, _468);
            float _472 = sqrt(_470);
            bool _474 = _472 >= 9.9999999747524270787835121154785e-07;
            bool _476 = isnan(_472);
            bool _478 = _474 || _476;
            bool _480 = isnan(9.9999999747524270787835121154785e-07);
            bool _482 = _478 || _480;
            if (!_482)
            {
                float _484 = _386 * _386;
                float _486 = fma(_384, _384, _484);
                float _488 = fma(_388, _388, _486);
                float _490 = sqrt(_488);
                bool _492 = _490 >= 9.9999999747524270787835121154785e-07;
                bool _494 = isnan(_490);
                bool _496 = _492 || _494;
                bool _498 = isnan(9.9999999747524270787835121154785e-07);
                bool _500 = _496 || _498;
                if (!_500)
                {
                    float _502 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _502);
                    float _506 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _504);
                    float _508 = rsqrt(_506);
                    float _510 = _508 * 9.9999999747524270787835121154785e-07;
                    float _512 = _510 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _514 = _510 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _516 = _510 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _420 = _514;
                    _422 = _512;
                    _424 = _516;
                    _464 = true;
                }
                else
                {
                    float _518 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _522 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _524 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].x, _518);
                    float _526 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
                    float _528 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
                    float _530 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
                    float _532 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
                    float _534 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
                    float _536 = _530 * _530;
                    float _538 = fma(_532, _532, _536);
                    float _540 = fma(_534, _534, _538);
                    float _542 = rsqrt(_540);
                    float _544 = _542 * 9.9999999747524270787835121154785e-07;
                    float _546 = _532 * _544;
                    float _548 = _530 * _544;
                    float _550 = _534 * _544;
                    _420 = _548;
                    _422 = _546;
                    _424 = _550;
                    _464 = true;
                }
            }
            else
            {
                float _552 = _146 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _554 = _146 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _556 = _146 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _558 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _552);
                float _560 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
                float _562 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
                float _564 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].z, _558);
                float _566 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].z, _560);
                float _568 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
                float _570 = _564 * _564;
                float _572 = fma(_566, _566, _570);
                float _574 = fma(_568, _568, _572);
                float _576 = rsqrt(_574);
                float _578 = _576 * 9.9999999747524270787835121154785e-07;
                float _580 = _566 * _578;
                float _582 = _564 * _578;
                float _584 = _568 * _578;
                _420 = _582;
                _422 = _580;
                _424 = _584;
            }
        }
    }
    _464 = false;
    float _586 = _420;
    float _588 = _422;
    float _590 = _424;
    bool _592 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _594 = !_592;
    float _612;
    if (!_594)
    {
        float _596 = in.m_51.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        _612 = _402;
    }
    _614 = false;
    float _616 = _612;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _630;
    float _634 = 1.0 / _620;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _648 = 1.0 / _632;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _652 = _616 + _650;
    bool _654 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _656 = isnan(_616);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_664;
    float _668 = _666 + 1.0;
    float _670 = 1.0 / _624;
    float _672 = _652 * _634;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _676 = _616 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _680 = _616 + _678;
    bool _682 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _684 = isnan(_616);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _638;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _698 = 1.0 / _628;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _702 = _616 + _700;
    float _704 = 1.0 / _642;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _708 = _616 + _706;
    float _710 = _676 * _694;
    bool _712 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _714 = isnan(_616);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = _708 * _648;
    float _726 = _702 * _670;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _730 = _616 + _728;
    float _732 = 1.0 / _646;
    float _734 = _680 * _698;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _738 = _616 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _740;
    float _744 = -_722;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _748;
    float _752 = _730 * _704;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _754;
    float _758 = fma(_742, _672, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _764 = fma(_750, _672, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _766 = fma(_756, _672, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _776 = _738 * _732;
    bool _778 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _780 = isnan(_616);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = _664 * _746;
    float _792 = fma(_774, _734, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _794 = fma(_762, _734, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _796 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _798 = isnan(_616);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = -_788;
    float _810 = _808 + 1.0;
    float _812 = fma(_770, _734, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _814 = _788 * _668;
    bool _816 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _818 = isnan(_616);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = _806 * _810;
    float _830 = -_806;
    float _832 = _830 + 1.0;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _838;
    float _842 = -_826;
    float _844 = _842 + 1.0;
    float _846 = _826 * _832;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _848;
    bool _852 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _854 = isnan(_616);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = fma(_836, _724, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _866 = fma(_840, _724, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _868 = fma(_850, _724, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _870 = _692 * _844;
    bool _872 = _616 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _874 = isnan(_616);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -_862;
    float _886 = _884 + 1.0;
    float _888 = -_692;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _896 = _882 * _886;
    float _898 = _862 * _890;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _908 = -_882;
    float _910 = _908 + 1.0;
    float _912 = _764 * _896;
    float _914 = fma(_894, _710, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _916 = fma(_902, _710, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _918 = fma(_906, _710, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _920 = _766 * _896;
    float _922 = _758 * _896;
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].x, _912);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].y, _920);
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].z, _922);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _930;
    float _934 = fma(_812, _898, _924);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _940;
    float _944 = fma(_794, _898, _926);
    float _946 = fma(_932, _726, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _948 = fma(_938, _726, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _950 = fma(_942, _726, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _952 = fma(_792, _898, _928);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _966 = fma(_868, _870, _934);
    float _968 = fma(_864, _870, _944);
    float _970 = fma(_866, _870, _952);
    float _972 = fma(_956, _776, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _974 = fma(_960, _776, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _976 = fma(_964, _776, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _978 = fma(_914, _846, _966);
    float _980 = in.m_49.x;
    float _982 = in.m_49.y;
    float _984 = in.m_49.z;
    float _986 = fma(_916, _846, _968);
    float _988 = fma(_918, _846, _970);
    float _990 = fma(_948, _828, _978);
    float _992 = fma(_946, _828, _986);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _994;
    float _998 = fma(_950, _828, _988);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1000;
    float _1004 = fma(_972, _814, _990);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _1006;
    float _1010 = fma(_996, _752, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1012 = fma(_1002, _752, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1014 = fma(_974, _814, _992);
    float _1016 = fma(_1008, _752, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _1018 = fma(_976, _814, _998);
    float _1020 = fma(_1010, _790, _1004);
    float _1022 = fma(_1012, _790, _1014);
    float _1024 = fma(_1016, _790, _1018);
    float _1026 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1020);
    float _1028 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1022);
    float _1030 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[150].z, _1024);
    float _1032 = _1026 * _980;
    float _1034 = _1028 * _982;
    float _1036 = _1030 * _984;
    bool _1038 = !_696;
    float _1056;
    if (!_1038)
    {
        float _1040 = in.m_51.x;
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1044 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _1048 = _1046 * _1042;
        float _1050 = floor(_1048);
        float _1052 = -_1050;
        float _1054 = _1048 + _1052;
        _1056 = _1054;
        _1058 = true;
    }
    else
    {
        _1056 = _402;
    }
    _1058 = false;
    float _1060 = _1056;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1064 = _1060 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1068 = _1060 + _1066;
    bool _1070 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1072 = isnan(_1060);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1088 = _1060 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1098 = 1.0 / _1084;
    bool _1100 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1102 = 1.0 / _1096;
    float _1104 = 1.0 / _1092;
    float _1106 = _1064 * _1098;
    bool _1108 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1110 = isnan(_1060);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = -_1080;
    float _1122 = _1120 + 1.0;
    float _1124 = _1118 * _1122;
    float _1126 = _1068 * _1102;
    bool _1128 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1130 = isnan(_1060);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1140;
    bool _1144 = _1060 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1146 = isnan(_1060);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1160 = -_1118;
    float _1162 = _1160 + 1.0;
    float _1164 = -_1138;
    float _1166 = _1164 + 1.0;
    float _1168 = _1088 * _1104;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1174;
    float _1178 = _1154 * _1166;
    float _1180 = fma(_1142, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1182 = fma(_1172, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1184 = fma(_1176, _1168, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1186 = _1138 * _1162;
    float _1188 = -_1154;
    float _1190 = _1188 + 1.0;
    float _1192 = _1182 * _1178;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1202 = _1184 * _1178;
    float _1204 = _1180 * _1178;
    float _1206 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1192);
    float _1208 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1202);
    float _1210 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1204);
    float _1212 = fma(_1158, _1126, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1214 = fma(_1196, _1126, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1216 = fma(_1200, _1126, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1226;
    float _1230 = fma(_1212, _1186, _1206);
    float _1232 = fma(_1220, _1106, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1234 = fma(_1224, _1106, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1236 = fma(_1228, _1106, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1238 = fma(_1214, _1186, _1208);
    float _1240 = fma(_1216, _1186, _1210);
    float _1242 = fma(_1232, _1124, _1230);
    float _1244 = fma(_1234, _1124, _1238);
    float _1246 = fma(_1236, _1124, _1240);
    float _1248 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[110].x, _1242);
    float _1250 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[110].y, _1244);
    float _1252 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[110].z, _1246);
    bool _1254 = !_1100;
    float _1272;
    if (!_1254)
    {
        float _1256 = in.m_51.x;
        float _1258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1260 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _1264 = _1262 * _1258;
        float _1266 = floor(_1264);
        float _1268 = -_1266;
        float _1270 = _1264 + _1268;
        _1272 = _1270;
        _1274 = true;
    }
    else
    {
        _1272 = _402;
    }
    _1274 = false;
    float _1276 = _1272;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1280 = _1276 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1290 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1292 = isnan(_1276);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1302;
    float _1306 = 1.0 / _1284;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1312 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1314 = isnan(_1276);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1320 = _1316 || _1318;
    float _1322 = float(_1320);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1328 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1330 = isnan(_1276);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = 1.0 / _1288;
    float _1342 = -_1322;
    float _1344 = _1342 + 1.0;
    bool _1346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1348 = _1300 * _1344;
    float _1350 = _1304 * _1306;
    bool _1352 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1354 = isnan(_1276);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = -_1300;
    float _1366 = _1364 + 1.0;
    float _1368 = 1.0 / _1310;
    float _1370 = fma(_1350, _1280, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1372;
    float _1376 = _1362 * _1366;
    float _1378 = -_1362;
    float _1380 = _1378 + 1.0;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1384 = _1382 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1386 = 1.0 / _1326;
    float _1388 = _1338 * _1380;
    float _1390 = _1384 * _1340;
    float _1392 = -_1338;
    float _1394 = _1392 + 1.0;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1398 = _1276 + _1396;
    float _1400 = _1370 * _1388;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1404 = _1276 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1410 = _1374 * _1368;
    bool _1412 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1414 = isnan(_1276);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1420 = _1416 || _1418;
    float _1422 = float(_1420);
    float _1424 = fma(_1390, _1404, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1426 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1400);
    float _1428 = fma(_1410, _1398, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1432 = _1276 + _1430;
    float _1434 = -_1422;
    float _1436 = _1434 + 1.0;
    float _1438 = fma(_1424, _1376, _1426);
    float _1440 = _1408 * _1386;
    float _1442 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1444 = _1322 * _1436;
    float _1446 = fma(_1428, _1348, _1438);
    float _1448 = fma(_1440, _1432, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1450 = _1250 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1452 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1454 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1456 = fma(_1448, _1444, _1446);
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1462 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1456);
    float _1464 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1454;
    out.m_53.y = _1458;
    out.m_53.z = _1460;
    out.m_53.w = _1464;
    bool _1466 = !_1346;
    float _1468 = _1460;
    float _1486;
    if (!_1466)
    {
        float _1470 = in.m_51.x;
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1474 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _1478 = _1476 * _1472;
        float _1480 = floor(_1478);
        float _1482 = -_1480;
        float _1484 = _1478 + _1482;
        _1486 = _1484;
        _1488 = true;
    }
    else
    {
        _1486 = _402;
    }
    _1488 = false;
    float _1490 = _1486;
    float _1492 = _586 * _586;
    float _1494 = _416 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1496 = _416 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1498 = in.m_51.x;
    float _1500 = fma(_588, _588, _1492);
    float _1502 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1504 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1496);
    float _1506 = in.m_55.z;
    float _1508 = fma(_590, _590, _1500);
    float _1510 = _416 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1512 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1494);
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1516 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1510);
    float _1518 = rsqrt(_1508);
    float _1520 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1512);
    float _1522 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1516);
    float _1524 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1504);
    float _1526 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1528 = _1522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1530 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1534 = _1526 + _1532;
    float _1536 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1530 + _1538;
    float _1542 = _1534 * _1534;
    float _1544 = _1518 * _586;
    float _1546 = _1518 * _588;
    float _1548 = _1518 * _590;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1552 = _1528 + _1550;
    float _1554 = _1544 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1556 = fma(_1546, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1554);
    float _1558 = fma(_1552, _1552, _1542);
    float _1560 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0500000007450580596923828125, _1498);
    float _1562 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1556);
    float _1564 = fma(_1540, _1540, _1558);
    float _1566 = rsqrt(_1564);
    float _1568 = abs(_1562);
    bool _1570 = _1568 > 0.99989998340606689453125;
    float _1572 = _1496;
    float _1574 = _1564;
    float _1576 = _1562;
    float _1578 = _1544;
    float _1580 = _1530;
    if (_1570)
    {
        _1468 = 0.001000000047497451305389404296875;
    }
    float _1582 = _1468;
    float _1584 = _1514 * _1566;
    if (!_1570)
    {
        _1572 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1586 = _1572;
    float _1588 = _1586;
    if (_1570)
    {
        float _1590 = fma(_1582, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1588 = _1590;
    }
    float _1592 = _1588;
    float _1594 = _1534 * _1584;
    float _1596 = _1594;
    if (!_1570)
    {
        _1574 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1598 = _1574;
    float _1600 = _1560 + _1506;
    float _1602 = _1598;
    if (_1570)
    {
        float _1604 = fma(_1582, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1602 = _1604;
    }
    float _1606 = _1602;
    float _1608 = _1552 * _1584;
    float _1610 = -_1594;
    float _1612 = _1534 + _1610;
    float _1614 = -_1592;
    float _1616 = _1548 * _1614;
    if (!_1570)
    {
        _1576 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1618 = _1576;
    float _1620 = _1600 * 2.0;
    float _1622 = -_1608;
    float _1624 = _1552 + _1622;
    float _1626 = _1612 * _1612;
    float _1628 = -_1606;
    float _1630 = -_1616;
    float _1632 = fma(_1546, _1628, _1630);
    float _1634 = _1618;
    if (_1570)
    {
        float _1636 = fma(_1582, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = -_1606;
    float _1642 = _1544 * _1640;
    float _1644 = _1540 * _1584;
    float _1646 = _1620 * 0.15915493667125701904296875;
    float _1648 = fma(_1624, _1624, _1626);
    float _1650 = -_1638;
    float _1652 = -_1642;
    float _1654 = fma(_1548, _1650, _1652);
    float _1656 = -_1638;
    float _1658 = _1546 * _1656;
    float _1660 = _1632 * _1632;
    float _1662 = -_1644;
    float _1664 = _1540 + _1662;
    float _1666 = in.m_55.x;
    float _1668 = -_1592;
    float _1670 = -_1658;
    float _1672 = fma(_1544, _1668, _1670);
    float _1674 = fma(_1654, _1654, _1660);
    float _1676 = _1646 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = fma(_1664, _1664, _1648);
    float _1682 = in.m_55.y;
    float _1684 = fma(_1672, _1672, _1674);
    float _1686 = precise::max(_402, 0.300000011920928955078125);
    float _1688 = sqrt(_1680);
    float _1690 = precise::min(_1686, 0.800000011920928955078125);
    float _1692 = fma(_1690, 2.0, -0.60000002384185791015625);
    float _1694 = rsqrt(_1684);
    float _1696 = _1678 * 0.2599999904632568359375;
    float _1698 = fma(_1696, _1692, _1666);
    float _1700 = _1566 * _1688;
    float _1702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1506);
    float _1704 = _1536 * _1700;
    float _1706 = _1502 * _1700;
    float _1708 = _1672 * _1694;
    float _1710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1682);
    float _1712 = _1654 * _1694;
    float _1714 = _1632 * _1694;
    float _1716 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1698);
    float _1720 = _1704 * _1710;
    float _1722 = _1546 * _1714;
    float _1724 = _1716 * _1700;
    float _1726 = _1706 * _1718;
    float _1728 = _1720 * _1548;
    float _1730 = _1544 * _1708;
    float _1732 = _1724 * _1702;
    float _1734 = -_1722;
    float _1736 = fma(_1544, _1712, _1734);
    float _1738 = _1720 * _1546;
    float _1740 = fma(_1726, _1708, _1728);
    float _1742 = -_1730;
    float _1744 = fma(_1548, _1714, _1742);
    float _1746 = fma(_1726, _1712, _1738);
    float _1748 = fma(_1732, _1736, _1740);
    float _1750 = _1548 * _1712;
    float _1752 = fma(_1732, _1744, _1746);
    float _1754 = _1530 + _1748;
    float _1756 = -_1750;
    float _1758 = fma(_1546, _1708, _1756);
    float _1760 = _1528 + _1752;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1764 = _1754 + _1762;
    bool _1766 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1768 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan(0.5);
    bool _1774 = _1770 || _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1778 = _1760 + _1776;
    float _1780 = _1764 * _1764;
    float _1782 = fma(_1778, _1778, _1780);
    float _1784 = _1720 * _1544;
    float _1786 = sqrt(_1782);
    float _1788 = fma(_1726, _1714, _1784);
    float _1790 = fma(_1732, _1758, _1788);
    float _1792 = _1526 + _1790;
    float _1794 = -_1608;
    float _1796 = _1528 + _1794;
    bool _1798 = _1786 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1800 = _1788;
    float _1802 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1804 = _1700;
    float _1806 = _1708;
    if (!_1798)
    {
        _1578 = _1760;
    }
    float _1808 = _1578;
    float _1810 = _1808;
    if (!_1798)
    {
        _1800 = _1754;
    }
    float _1812 = _1800;
    float _1814 = _1812;
    if (!_1798)
    {
        _1802 = _1792;
    }
    float _1816 = _1802;
    bool _1818 = !_1798;
    float _1820 = _1816;
    if (!_1818)
    {
        float _1822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1826 = _1786 + _1824;
        float _1828 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1830 = rsqrt(_1782);
        float _1832 = _1826 * _1822;
        float _1834 = _1832 * 0.15915493667125701904296875;
        float _1836 = _1834 * 6.283185482025146484375;
        float _1838 = cos(_1836);
        float _1840 = _1834 * 6.283185482025146484375;
        float _1842 = sin(_1840);
        float _1844 = _1838 + (-1.0);
        float _1846 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1848 = fma(_1842, _1828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1850 = fma(_1792, _1838, _1846);
        float _1852 = _1830 * _1848;
        float _1854 = fma(_1778, _1852, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1856 = fma(_1764, _1852, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1810 = _1854;
        _1814 = _1856;
        _1820 = _1850;
    }
    float _1858 = _1810;
    float _1860 = _1814;
    float _1862 = _1820;
    float _1864 = -_1608;
    float _1866 = _1864 + _1858;
    float _1868 = -_1644;
    float _1870 = _1868 + _1860;
    float _1872 = -_1594;
    float _1874 = _1872 + _1862;
    float _1876 = -_1594;
    float _1878 = _1526 + _1876;
    float _1880 = -_1644;
    float _1882 = _1530 + _1880;
    float _1884 = _1866;
    float _1886 = _1874;
    float _1888 = _1858;
    if (_1774)
    {
        _1596 = _1866;
    }
    float _1890 = _1596;
    float _1892 = _1890;
    if (_1774)
    {
        _1884 = _1870;
    }
    float _1894 = _1884;
    float _1896 = _1894;
    if (!_1774)
    {
        float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1900 = _1878 + _1898;
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1904 = _1796 + _1902;
        float _1906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1908 = -_1530;
        float _1910 = _1908 + _1860;
        float _1912 = _1900 * _1900;
        float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1916 = _1882 + _1914;
        float _1918 = -_1528;
        float _1920 = _1918 + _1858;
        float _1922 = -_1526;
        float _1924 = _1922 + _1862;
        float _1926 = fma(_1904, _1904, _1912);
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1930 = fma(_1916, _1916, _1926);
        float _1932 = sqrt(_1930);
        float _1934 = 1.0 / _1700;
        float _1936 = precise::min(_1932, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1938 = _1936 * _1906;
        float _1940 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1942 = _1938 * _1934;
        float _1944 = _1940 * _1942;
        float _1946 = _1910 * _1942;
        float _1948 = fma(_1920, _1944, _1796);
        float _1950 = fma(_1924, _1944, _1878);
        float _1952 = fma(_1940, _1946, _1882);
        _1886 = _1950;
        _1892 = _1948;
        _1896 = _1952;
        _1804 = _1934;
        _1580 = _1946;
    }
    float _1954 = _1886;
    float _1956 = _1892;
    float _1958 = _1896;
    float _1960 = _1804;
    float _1962 = _1580;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1966 = _1954 + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1970 = _1956 + _1968;
    float _1972 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1974 = _1958 + _1972;
    float _1976 = _1966 * _1966;
    float _1978 = fma(_1970, _1970, _1976);
    float _1980 = fma(_1974, _1974, _1978);
    float _1982 = rsqrt(_1980);
    float _1984 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1986 = _1970 * _1984;
    float _1988 = _1974 * _1984;
    float _1990 = _1986 * _1986;
    float _1992 = _1988 * _1988;
    float _1994 = _1990 + _1992;
    float _1996 = sqrt(_1994);
    bool _1998 = _1996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2002 = _1996 + _2000;
    float _2004 = _1960;
    float _2006 = _2002;
    float _2008 = _1966;
    float _2010 = _1986;
    if (_1998)
    {
        float _2012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2004 = _2012;
    }
    float _2014 = _2004;
    float _2016 = _2014;
    if (_1998)
    {
        float _2018 = _2002 * _2014;
        _2006 = _2018;
    }
    float _2020 = _2006;
    if (_1998)
    {
        float _2022 = rsqrt(_1994);
        _2016 = _2022;
    }
    float _2024 = _2016;
    float _2026 = _2024;
    if (_1998)
    {
        float _2028 = _2020 * 0.15915493667125701904296875;
        _1888 = _2028;
    }
    float _2030 = _1888;
    float _2032 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2034 = _1974;
    if (_1998)
    {
        float _2036 = _2030 * 6.283185482025146484375;
        float _2038 = sin(_2036);
        _2034 = _2038;
    }
    float _2040 = _2034;
    float _2042 = precise::max(0.0, _2032);
    float _2044 = _1962;
    float _2046 = _2042;
    if (_1998)
    {
        float _2048 = _2030 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        _2044 = _2050;
    }
    float _2052 = _2044;
    float _2054 = -_1984;
    float _2056 = -_2042;
    float _2058 = fma(_1966, _2054, _2056);
    if (_1998)
    {
        float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2008 = _2060;
    }
    float _2062 = _2008;
    float _2064 = sqrt(_1980);
    float _2066 = _2040;
    float _2068 = _2062;
    if (_1998)
    {
        float _2070 = fma(_2040, _2062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2066 = _2070;
    }
    float _2072 = _2066;
    float _2074 = _2072;
    if (!_1998)
    {
        _2068 = _1990;
    }
    float _2076 = _2068;
    float _2078 = _2076;
    if (_1998)
    {
        float _2080 = _2024 * _2072;
        _1806 = _2080;
    }
    float _2082 = _1806;
    if (!_1998)
    {
        _2074 = _2058;
    }
    float _2084 = _2074;
    float _2086 = _2084;
    float _2088 = _2052;
    if (_1998)
    {
        float _2090 = _2052 + (-1.0);
        _2046 = _2090;
    }
    float _2092 = _2046;
    float _2094 = _2092;
    if (_1998)
    {
        float _2096 = _1986 * _2082;
        _2010 = _2096;
    }
    float _2098 = _2010;
    float _2100 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1998)
    {
        float _2102 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2026 = _2102;
    }
    float _2104 = _2026;
    if (!_1998)
    {
        _2094 = _1988;
    }
    float _2106 = _2094;
    float _2108 = _2106;
    if (_1998)
    {
        float _2110 = _1988 * _2082;
        _2108 = _2110;
    }
    float _2112 = _2108;
    if (_1998)
    {
        float _2114 = _2098 * _2098;
        _2078 = _2114;
    }
    float _2116 = _2078;
    if (_1998)
    {
        float _2118 = fma(_2058, _2052, _2104);
        _2086 = _2118;
    }
    float _2120 = _2086;
    if (!_1998)
    {
        _2088 = _1992;
    }
    float _2122 = _2088;
    float _2124 = _2122;
    if (_1998)
    {
        float _2126 = _2112 * _2112;
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = fma(_2120, _2120, _2116);
    float _2132 = _2130 + _2128;
    float _2134 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2138 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2136);
    float _2140 = precise::clamp(_2138, 0.0, 1.0);
    float _2142 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2144 = rsqrt(_2132);
    float _2146 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2134);
    float _2148 = -_2140;
    float _2150 = _2148 + 1.0;
    float _2152 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2154 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2142);
    float _2156 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2146);
    float _2158 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2160 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2152);
    float _2162 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2154);
    float _2164 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2166 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2158);
    float _2168 = abs(_2150);
    float _2170 = log2(_2168);
    float _2172 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2160);
    float _2174 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2176 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2166);
    float _2180 = _2144 * _2098;
    float _2182 = -_2174;
    float _2184 = fma(_2182, _2100, 1.0);
    float _2186 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2188 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = _2144 * _2120;
    float _2192 = _2180 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2194 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2196 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2198 = _2144 * _2112;
    float _2200 = -_2192;
    float _2202 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2200);
    float _2204 = log2(_2184);
    float _2206 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2208 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2196);
    float _2210 = -_2198;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2202);
    float _2214 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2216 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2218 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2208);
    float _2220 = fma(_2212, -0.5, 0.5);
    float _2222 = exp2(_2206);
    float _2224 = fma(_2212, 0.5, 0.5);
    float _2226 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2214);
    float _2228 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2216);
    float _2230 = _2190 + 1.0;
    float _2232 = fma(_2224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2226);
    float _2236 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2228);
    float _2238 = 1.0 / _2218;
    float _2240 = fma(_2224, _2232, -0.212114393711090087890625);
    float _2242 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2234);
    float _2244 = _2204 * 0.693147182464599609375;
    float _2246 = fma(_2224, _2240, 1.570728778839111328125);
    float _2248 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2250 = sqrt(_2220);
    float _2252 = -_2190;
    float _2254 = fma(_2222, _2230, _2252);
    float _2256 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2236);
    float _2258 = fma(_2254, 0.5, 0.5);
    float _2260 = _2242 * _2238;
    float _2262 = _2256 * _2238;
    float _2264 = fma(_2260, 0.5, 0.5);
    float _2266 = fma(_2262, -0.5, 0.5);
    float _2268 = _2250 * 0.636619746685028076171875;
    float _2270 = -_2246;
    float _2272 = fma(_2268, _2270, 1.0);
    float3 _6907 = float3(_2264, _2266, _2248);
    float _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6907, float3(0.0), isnan(_6907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6907, float3(0.0), isnan(_6907)), level(0.0)).x;
    float3 _6918 = float3(_2264, _2266, _2248);
    float4 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6918, float3(0.0), isnan(_6918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6918, float3(0.0), isnan(_6918)), level(0.0)).xyzw;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = _2277.w;
    float2 _6935 = float2(_2272, _2258);
    float3 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6935, float2(0.0), isnan(_6935)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6935, float2(0.0), isnan(_6935)), level(0.0)).xyz;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = in.m_57.x;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2301 = _1490 + _2299;
    float _2303 = in.m_57.y;
    int _2305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2307 = _2305 != 0;
    float _2309 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2311 = _1490 + _2309;
    float _2313 = in.m_51.y;
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2317 = _1490 + _2315;
    float _2319 = in.m_51.z;
    float _2321 = in.m_51.w;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2325 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2329 = _2327 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _2331 = false;
    float _2333 = _2264;
    int _2335 = 1065353216;
    if (_2307)
    {
        bool _2337 = _1498 > 0.5;
        _2331 = _2337;
    }
    bool _2339 = _2331;
    float _2341 = 1.0 / _2325;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2345 = _2343 != 0;
    float _2347 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2349 = _2297;
    float _2351 = _2347;
    if (!_2307)
    {
        _2333 = _2297;
    }
    float _2353 = _2333;
    int _2355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2357 = _2355 != 0;
    float _2359 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2347);
    int _2361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2363 = _2361 != 0;
    float _2365 = 1.0 / _2329;
    int _2367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2369 = _2367 != 0;
    float _2371 = _2353;
    if (_2307)
    {
        float _2373 = -_2297;
        float _2375 = _2373 + 1.0;
        _2335 = as_type<int>(_2375);
    }
    int _2377 = _2335;
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2381 = _2379 != 0;
    float _2383 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2385 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _2383;
    float _2387 = -_2303;
    float _2389 = _2387 + 1.0;
    float _2391 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _2393 = _2391 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _2395 = _2303;
    if (_2307)
    {
        float _2397 = _2339 ? as_type<float>(_2377) : _2297;
        _2371 = _2397;
    }
    float _2399 = _2371;
    float _2401 = 1.0 / _2385;
    bool _2403 = _2313 > 0.5;
    float _2405 = _2301 * _2341;
    int _2407 = 0;
    float _2409 = _2313;
    if (_2357)
    {
        float _2411 = -_2297;
        float _2413 = _2411 + 1.0;
        _2407 = as_type<int>(_2413);
    }
    int _2415 = _2407;
    bool _2417 = _2319 > 0.5;
    float _2419 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2421 = _2419 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _2423 = _2403 ? as_type<int>(_2389) : as_type<int>(_2303);
    float _2425 = 1.0 / _2393;
    int _2427 = _2417 ? as_type<int>(_2389) : as_type<int>(_2303);
    float _2429 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2431 = _2429 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2433 = _2363 ? as_type<float>(_2423) : _2303;
    bool _2435 = _2321 > 0.5;
    float _2437 = _2311 * _2401;
    float _2439 = 1.0 / _2421;
    float _2441 = _2369 ? as_type<float>(_2427) : _2303;
    float _2443 = _2319;
    if (_2381)
    {
        float _2445 = _2435 ? _2389 : _2303;
        _2395 = _2445;
    }
    float _2447 = _2395;
    float _2449 = 1.0 / _2431;
    float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2459 = _2457 != 0;
    float _2461 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2463 = 1.0 / _2453;
    bool _2465 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2467 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan(0.5);
    bool _2473 = _2469 || _2471;
    float _2475 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2477 = _2475 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2481 = _1490 + _2479;
    float _2483 = -_2455;
    float _2485 = fma(_2461, 2.0, _2483);
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2489 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2491 = _2481 * _2365;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2497 = fma(_2489, -2.0, _2487);
    float _2499 = 1.0 / _2477;
    float _2501 = _2317 * _2425;
    float _2503 = -_116;
    float _2505 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2485);
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2507;
    float _2511 = 1.0 / _2495;
    float _2513 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2515 = _2513 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2519 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2517;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2523 = _2521 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2525 = _2509 * _2463;
    float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2529 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2527;
    float _2531 = _2519 * _2439;
    float _2533 = 1.0 / _2515;
    float _2535 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2537 = _2535 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _2539 = _2523 * _2449;
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2545 = 1.0 / _2537;
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2549 = _2547 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2551 = _2529 * _2511;
    float _2553 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2555 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2553;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2557;
    float _2561 = _2543 * _2499;
    float _2563 = fma(_2555, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2565;
    float _2569 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2569;
    float _2573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2575 = _2549 * _2533;
    float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2581 = fma(_2571, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2585 = _2583 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2587 = _2567 * _2545;
    float _2589 = fma(_2559, _2405, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2593 = _2591 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2595 = fma(_2585, _2491, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _2597;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _2603 = _2601 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _2605;
    float _2609 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _2611 = _2609 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _2621 = fma(_2593, _2491, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2625 = fma(_2579, _2491, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2627 = fma(_2599, _2437, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _2629 = fma(_2607, _2437, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _2631 = fma(_2615, _2437, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2635 = _402 + _2633;
    float _2637 = fma(_2603, _2501, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _2639 = _2573 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2643 = _402 + _2641;
    float _2645 = fma(_2531, _2635, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2647 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2649 = _402 + _2647;
    float _2651 = fma(_2639, _2433, -0.5);
    float _2653 = fma(_2525, _2643, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2657 = _402 + _2655;
    float _2659 = fma(_2539, _2649, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2661 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2663 = _402 + _2661;
    float _2665 = _2623 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2667 = fma(_2575, _2657, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2671 = _402 + _2669;
    bool _2673 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2675 = isnan(_402);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = fma(_2441, _2665, -0.5);
    bool _2687 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2689 = isnan(_402);
    bool _2691 = _2687 || _2689;
    bool _2693 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2695 = _2691 || _2693;
    float _2697 = float(_2695);
    float _2699 = fma(_2587, _2663, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2701 = fma(_2561, _2671, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _2703 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _2705 = isnan(_1490);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = -_2683;
    float _2717 = _2715 + 1.0;
    float _2719 = -_2697;
    float _2721 = _2719 + 1.0;
    bool _2723 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2725 = isnan(_402);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2731 = _2727 || _2729;
    float _2733 = float(_2731);
    float _2735 = fma(_2611, _2501, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _2737 = -_2713;
    float _2739 = _2737 + 1.0;
    bool _2741 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _2743 = isnan(_1490);
    bool _2745 = _2741 || _2743;
    bool _2747 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _2749 = _2745 || _2747;
    float _2751 = float(_2749);
    float _2753 = fma(_2619, _2501, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _2755 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2757 = isnan(_1490);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2763 = _2759 || _2761;
    float _2765 = float(_2763);
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2769 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2771 = isnan(_1490);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = -_2751;
    float _2783 = _2781 + 1.0;
    bool _2785 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2787 = isnan(_1490);
    bool _2789 = _2785 || _2787;
    bool _2791 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2793 = _2789 || _2791;
    float _2795 = float(_2793);
    float _2797 = _2683 * _2721;
    bool _2799 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2801 = isnan(_402);
    bool _2803 = _2799 || _2801;
    bool _2805 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2807 = _2803 || _2805;
    float _2809 = float(_2807);
    float _2811 = _2733 * _2717;
    float _2813 = -_2733;
    float _2815 = _2813 + 1.0;
    bool _2817 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2819 = isnan(_402);
    bool _2821 = _2817 || _2819;
    bool _2823 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2825 = _2821 || _2823;
    float _2827 = float(_2825);
    float _2829 = _2751 * _2739;
    float _2831 = -_2809;
    float _2833 = _2831 + 1.0;
    float _2835 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2767);
    float _2837 = _2809 * _2815;
    float _2839 = _2795 * _2783;
    float _2841 = -_2795;
    float _2843 = _2841 + 1.0;
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2847 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2849 = isnan(_402);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2855 = _2851 || _2853;
    float _2857 = float(_2855);
    float _2859 = _2827 * _2833;
    float _2861 = -_2827;
    float _2863 = _2861 + 1.0;
    float _2865 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2835);
    float _2867 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2497);
    bool _2869 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2871 = isnan(_402);
    bool _2873 = _2869 || _2871;
    bool _2875 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2877 = _2873 || _2875;
    float _2879 = float(_2877);
    float _2881 = _2779 * _2843;
    float _2883 = -_2779;
    float _2885 = _2883 + 1.0;
    float _2887 = _2857 * _2863;
    float _2889 = -_2867;
    float _2891 = fma(_2865, _2651, _2889);
    float _2893 = -_2857;
    float _2895 = _2893 + 1.0;
    bool _2897 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2899 = isnan(_402);
    bool _2901 = _2897 || _2899;
    bool _2903 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2905 = _2901 || _2903;
    float _2907 = float(_2905);
    float _2909 = _2765 * _2885;
    float _2911 = -_2879;
    float _2913 = _2911 + 1.0;
    float _2915 = _2879 * _2895;
    float _2917 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2919 = _402 + _2917;
    float _2921 = _2581 * _2909;
    float _2923 = _2563 * _2909;
    float _2925 = _2589 * _2909;
    float _2927 = _2907 * _2913;
    int _2929 = as_type<int>(_2909);
    float _2931 = _2645;
    float _2933 = _2589;
    float _2935 = _2713;
    float _2937 = _2667;
    if (_2345)
    {
        float _2939 = -_2297;
        float _2941 = _2939 + 1.0;
        _2929 = as_type<int>(_2941);
    }
    int _2943 = _2929;
    float _2945 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2947 = _2645 * _2927;
    float _2949 = -_2765;
    float _2951 = _2949 + 1.0;
    float _2953 = 0.0;
    if (!_2459)
    {
        _2953 = _2313;
    }
    float _2955 = _2953;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2959 = _2955;
    if (!_2345)
    {
        _2931 = _2297;
    }
    float _2961 = _2931;
    float _2963 = fma(_2551, _2919, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2965 = _2961;
    if (_2345)
    {
        float _2967 = _2417 ? as_type<float>(_2943) : _2297;
        _2965 = _2967;
    }
    float _2969 = _2965;
    float _2971 = fma(_2945, _2447, -0.5);
    if (_2459)
    {
        _2959 = _1498;
    }
    float _2973 = _2959;
    float _2975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_2357)
    {
        float _2977 = _2403 ? as_type<float>(_2415) : _2297;
        _2349 = _2977;
    }
    float _2979 = _2349;
    float _2981 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2921);
    float _2983 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2923);
    float _2985 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2925);
    float _2987 = fma(_2973, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2957);
    float _2989 = _2973 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2991 = -_2907;
    float _2993 = _2991 + 1.0;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2997 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3001 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3003 = _2993;
    if (_2459)
    {
        _2933 = _1498;
    }
    float _3005 = _2933;
    float _3007 = fma(_2993, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2947);
    float _3009 = -_2995;
    float _3011 = fma(_2989, 2.0, _3009);
    float _3013 = _3005;
    if (!_2459)
    {
        _3013 = _2319;
    }
    float _3015 = _3013;
    float _3017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_2459)
    {
        _3003 = _2319;
    }
    float _3019 = _3003;
    float _3021 = fma(_2595, _2881, _2981);
    float _3023 = fma(_2621, _2881, _2983);
    float _3025 = fma(_2625, _2881, _2985);
    float _3027 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2997);
    float _3029 = _3019;
    if (_2459)
    {
        _3029 = _2313;
    }
    float _3031 = _3029;
    float _3033 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_2459)
    {
        _2443 = _2313;
    }
    float _3035 = _2443;
    float _3037 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2999);
    float _3039 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3001);
    if (!_2459)
    {
        _2409 = _1498;
    }
    float _3041 = _2409;
    float _3043 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3033);
    float _3045 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3047 = _2975 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3049 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3043);
    float _3051 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3055 = fma(_3047, _2399, -0.5);
    float _3057 = _3017 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3059 = fma(_2627, _2839, _3021);
    float _3061 = fma(_3045, -2.0, _3053);
    float _3063 = _3049 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3065 = fma(_2629, _2839, _3023);
    float _3067 = fma(_2631, _2839, _3025);
    float _3069 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3051);
    float _3071 = 1.0 / _3063;
    float _3073 = fma(_3057, _2979, -0.5);
    float _3075 = _3015 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3077 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3069);
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3081 = _3041 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3083 = _3077 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3085 = -_3079;
    float _3087 = fma(_3075, 2.0, _3085);
    float _3089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3091 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3093 = _3083 + _3063;
    float _3095 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3037);
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3099 = fma(_3081, -2.0, _3091);
    float _3101 = _3091;
    float _3103 = _3099;
    if (!_2473)
    {
        _3101 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3105 = _3101;
    float _3107 = _3093 * _3071;
    float _3109 = _3107 * 0.5;
    float _3111 = fma(_3095, _3055, _2505);
    float _3113 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2987);
    float _3115 = -_116;
    float _3117 = fma(_3115, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3011);
    float _3119 = _3105;
    if (!_2473)
    {
        float _3121 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3123 = fma(_3109, _3105, _3121);
        _3119 = _3123;
    }
    float _3125 = _3119;
    float _3127 = fma(_3031, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3097);
    float _3129 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3039);
    float _3131 = -_116;
    float _3133 = fma(_3131, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3087);
    float _3135 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3061);
    float _3137 = _3089 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3139 = _3125;
    if (!_2473)
    {
        float _3141 = 1.0 / _3125;
        _3139 = _3141;
    }
    float _3143 = _3139;
    float _3145 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3027);
    float _3147 = fma(_2659, _2915, _3007);
    float _3149 = fma(_3137, _2969, -0.5);
    float _3151 = fma(_2637, _2829, _3059);
    float _3153 = fma(_2735, _2829, _3065);
    float _3155 = fma(_2753, _2829, _3067);
    float _3157 = fma(_3113, _3149, _3117);
    float _3159 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3127);
    float _3161 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3099);
    if (!_2473)
    {
        _3103 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3163 = _3103;
    float _3165 = fma(_2653, _2887, _3147);
    float _3167 = fma(_2713, (*spvDescriptorSet0.vp_c9)._m0[127].x, _3151);
    float _3169 = fma(_2713, (*spvDescriptorSet0.vp_c9)._m0[127].y, _3153);
    float _3171 = fma(_2713, (*spvDescriptorSet0.vp_c9)._m0[127].z, _3155);
    float _3173 = fma(_2701, _2859, _3165);
    if (!_2473)
    {
        float _3175 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3177 = -_3163;
        float _3179 = fma(_3143, _3175, _3177);
        _2351 = _3179;
    }
    float _3181 = _2351;
    float _3183 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2359);
    float _3185 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2473)
    {
        float _3187 = -_3163;
        float _3189 = _3187 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2935 = _3189;
    }
    float _3191 = _2935;
    float _3193 = -_3135;
    float _3195 = fma(_3159, _2971, _3193);
    float _3197 = fma(_2963, _2837, _3173);
    float _3199 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3183);
    float _3201 = -_3161;
    float _3203 = fma(_3145, _2685, _3201);
    float _3205 = exp2(_3185);
    float _3207 = _3195 + 0.5;
    float _3209 = fma(_2667, _2811, _3197);
    if (_2473)
    {
        _2937 = 1.0;
    }
    float _3211 = _2937;
    float _3213 = fma(_3129, _3073, _3133);
    float _3215 = fma(_2699, _2797, _3209);
    float _3217 = _3167 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3219 = _3191;
    float _3221 = _3211;
    if (!_2473)
    {
        float _3223 = 1.0 / _3191;
        _3219 = _3223;
    }
    float _3225 = _3219;
    float _3227 = _3169 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3229 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3215);
    float _3231 = _3199 + _2218;
    float _3233 = _3171 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.gl_Position.x = _2242;
    out.gl_Position.y = _2256;
    out.gl_Position.z = _3199;
    out.gl_Position.w = _2218;
    float _3235 = _2891 + 0.5;
    float _3237 = _3231 * 0.5;
    float _3239 = -_3205;
    float _3241 = _3239 + 1.0;
    float _3243 = _3111 + 0.5;
    float _3245 = _3157 + 0.5;
    float _3247 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3249 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3251 = _3213 + 0.5;
    float _3253 = _3203 + 0.5;
    float _3255 = _3217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2473)
    {
        float _3257 = _3181 * _3225;
        float _3259 = precise::clamp(_3257, 0.0, 1.0);
        _3221 = _3259;
    }
    float _3261 = _3221;
    float _3263 = _3249 * _2274;
    float _3265 = -_3249;
    float _3267 = _3265 + 1.0;
    float _3269 = _3227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3271 = _3261 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3273 = _3261 > 0.0;
    bool _3275 = isnan(_3261);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan(0.0);
    bool _3281 = _3277 || _3279;
    float _3283 = _2285 * _3263;
    float _3285 = _2295 * _3263;
    float _3287 = _3233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3289 = _3271 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3291 = fma(_2291, _3283, _2279);
    float _3293 = fma(_2293, _3283, _2281);
    float _3295 = _2285 * _3267;
    float _3297 = fma(_2285, _3285, _2283);
    out.m_61.x = _3243;
    out.m_61.y = _3235;
    out.m_61.z = _3245;
    out.m_61.w = _3207;
    out.m_63.x = _3251;
    out.m_63.y = _3253;
    out.m_65.x = _3255;
    out.m_65.y = _3269;
    out.m_65.z = _3287;
    out.m_65.w = _3247;
    out.m_67.x = _3229;
    out.m_69.z = _3237;
    out.m_69.w = _2218;
    out.m_45.x = _3289;
    out.m_71.x = _3291;
    out.m_71.y = _3293;
    out.m_71.z = _3297;
    out.m_71.w = _3295;
    if (_3281)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3299;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

