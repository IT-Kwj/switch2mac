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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1422 = false;
    bool _742 = false;
    bool _628 = false;
    bool _478 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1909 = as_type<float>(_104);
        out.gl_Position.z = _1909;
    }
    if (!_94)
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
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_90);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = 0.0;
    float _140 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _138;
    float _144 = _142;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _146 = _142 * 5.0;
        _106 = as_type<int>(_146);
    }
    int _148 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1980 = as_type<float>(_148);
        out.gl_Position.z = _1980;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = 0.0;
    float _170 = _156;
    if (!_166)
    {
        float _172 = _156 * _156;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = 0.0;
    float _180 = _176;
    if (!_166)
    {
        float _182 = _122 * _122;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    if (!_166)
    {
        float _188 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _188;
    }
    float _190 = _180;
    bool _192 = !_166;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _156 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _156);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _144 = _214;
        _194 = _224;
        _140 = _212;
    }
    float _226 = _144;
    float _228 = _194;
    float _230 = _140;
    bool _232 = !_166;
    float _234 = _226;
    float _236 = _230;
    if (!_232)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _156 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _234 = _250;
        _236 = _244;
        _170 = _256;
    }
    float _258 = _234;
    float _260 = _236;
    float _262 = _170;
    float _264 = _260;
    float _266 = _258;
    if (!_166)
    {
        _264 = _122;
    }
    float _268 = _264;
    float _270 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _268;
    if (!_166)
    {
        float _274 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _274;
    }
    float _276 = _266;
    bool _278 = !_166;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _122 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _122);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_166;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _122 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _340 = fma(_262, _152, _270);
    float _342 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_336, _152, _338);
    float _348 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_262, _150, _342);
    float _354 = fma(_336, _150, _344);
    float _356 = -_346;
    float _358 = _340 + _356;
    float _360 = fma(_262, _154, _348);
    float _362 = fma(_336, _154, _350);
    float _364 = -_354;
    float _366 = _352 + _364;
    float _368 = _358 * _358;
    float _370 = in.m_51.w;
    float _372 = -_362;
    float _374 = _360 + _372;
    float _376 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = fma(_366, _366, _368);
    float _380 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = in.m_44.x;
    float _384 = in.m_44.y;
    float _386 = in.m_44.z;
    float _388 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = fma(_374, _374, _378);
    float _392 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _394 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _380);
    float _396 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    float _400 = sqrt(_390);
    float _402 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    bool _404 = _400 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_400);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _394);
    float _416 = fma(_352, _370, _382);
    float _418 = fma(_340, _370, _384);
    float _420 = fma(_360, _370, _386);
    float _422 = _394;
    float _424 = _398;
    float _426 = _414;
    if (_412)
    {
        _422 = _398;
    }
    float _428 = _422;
    float _430 = _428;
    if (_412)
    {
        _424 = _414;
    }
    float _432 = _424;
    float _434 = _432;
    if (_412)
    {
        _426 = _402;
    }
    float _436 = _426;
    float _438 = _436;
    if (!_412)
    {
        bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _442 = !_440;
        if (!_442)
        {
            float _444 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _446 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _448 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _450);
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _454);
            float _462 = _456 * _456;
            float _464 = fma(_458, _458, _462);
            float _466 = fma(_460, _460, _464);
            float _468 = rsqrt(_466);
            float _470 = _468 * 9.9999999747524270787835121154785e-07;
            float _472 = _458 * _470;
            float _474 = _456 * _470;
            float _476 = _460 * _470;
            _434 = _474;
            _430 = _472;
            _438 = _476;
            _478 = true;
        }
        else
        {
            float _480 = _152 * _152;
            float _482 = fma(_150, _150, _480);
            float _484 = fma(_154, _154, _482);
            float _486 = sqrt(_484);
            bool _488 = _486 >= 9.9999999747524270787835121154785e-07;
            bool _490 = isnan(_486);
            bool _492 = _488 || _490;
            bool _494 = isnan(9.9999999747524270787835121154785e-07);
            bool _496 = _492 || _494;
            if (!_496)
            {
                float _498 = _384 * _384;
                float _500 = fma(_382, _382, _498);
                float _502 = fma(_386, _386, _500);
                float _504 = sqrt(_502);
                bool _506 = _504 >= 9.9999999747524270787835121154785e-07;
                bool _508 = isnan(_504);
                bool _510 = _506 || _508;
                bool _512 = isnan(9.9999999747524270787835121154785e-07);
                bool _514 = _510 || _512;
                if (!_514)
                {
                    float _516 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _516);
                    float _520 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _518);
                    float _522 = rsqrt(_520);
                    float _524 = _522 * 9.9999999747524270787835121154785e-07;
                    float _526 = _524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _530 = _524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _434 = _528;
                    _430 = _526;
                    _438 = _530;
                    _478 = true;
                }
                else
                {
                    float _532 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _534 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _536 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _538 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].x, _532);
                    float _540 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].x, _534);
                    float _542 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].x, _536);
                    float _544 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].z, _538);
                    float _546 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].z, _540);
                    float _548 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
                    float _550 = _544 * _544;
                    float _552 = fma(_546, _546, _550);
                    float _554 = fma(_548, _548, _552);
                    float _556 = rsqrt(_554);
                    float _558 = _556 * 9.9999999747524270787835121154785e-07;
                    float _560 = _546 * _558;
                    float _562 = _544 * _558;
                    float _564 = _548 * _558;
                    _434 = _562;
                    _430 = _560;
                    _438 = _564;
                    _478 = true;
                }
            }
            else
            {
                float _566 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _568 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _570 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _572 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _566);
                float _574 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
                float _576 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _570);
                float _578 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
                float _580 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
                float _582 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _576);
                float _584 = _578 * _578;
                float _586 = fma(_580, _580, _584);
                float _588 = fma(_582, _582, _586);
                float _590 = rsqrt(_588);
                float _592 = _590 * 9.9999999747524270787835121154785e-07;
                float _594 = _580 * _592;
                float _596 = _578 * _592;
                float _598 = _582 * _592;
                _434 = _596;
                _430 = _594;
                _438 = _598;
            }
        }
    }
    _478 = false;
    float _600 = _434;
    float _602 = _430;
    float _604 = _438;
    bool _606 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _608 = !_606;
    float _626;
    if (!_608)
    {
        float _610 = in.m_53.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_90);
        float _632 = 1.0 / _630;
        float _634 = _122 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_652;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _674;
    float _678 = 1.0 / _656;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _682 = _668 * _672;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _640 * _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _690;
    float _694 = fma(_676, _688, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _696;
    float _700 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _702 = fma(_698, _688, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _704 = _694 * _682;
    float _706 = _702 * _682;
    float _708 = _700 * _682;
    float _710 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].x, _704);
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].y, _706);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].z, _708);
    float _716 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[144].x, _710);
    float _718 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[144].y, _712);
    float _720 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[144].z, _714);
    bool _722 = !_680;
    float _740;
    if (!_722)
    {
        float _724 = in.m_53.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_90);
        float _746 = 1.0 / _744;
        float _748 = _122 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = in.m_51.x;
    float _754 = in.m_51.y;
    float _756 = in.m_51.z;
    float _758 = _418 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _760 = _418 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = in.m_53.w;
    float _764 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _758);
    float _766 = _600 * _600;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _770 = _768 != 0;
    float _772 = in.m_55.y;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _776 = _774 != 0;
    float _778 = fma(_602, _602, _766);
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _782 = _780 != 0;
    float _784 = in.m_55.x;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _788 = _786 != 0;
    float _790 = _418 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = in.m_53.x;
    float _794 = fma(_604, _604, _778);
    float _796 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    float _798 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _800 = in.m_53.y;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _806 = rsqrt(_794);
    float _808 = _716 * _752;
    float _810 = _720 * _756;
    float _812 = _718 * _754;
    float _814 = in.m_57.y;
    bool _816 = _762 > 0.5;
    float _818 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _820 = in.m_59.x;
    float _822 = in.m_59.y;
    float _824 = in.m_59.z;
    float _826 = 1.0 / _804;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _830 = _828 != 0;
    float _832 = 0.0;
    float _834 = _814;
    float _836 = _750;
    if (_770)
    {
        float _838 = in.m_53.z;
        _832 = _838;
    }
    float _840 = _832;
    float _842 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_61.y = _772;
    float _844 = _806 * _604;
    float _846 = _806 * _602;
    float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_61.x = _784;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _822);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _820);
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _868 = _792 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _870 = 1.0 / _862;
    float _872 = _800 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _824);
    float _876 = -_866;
    float _878 = fma(_868, 2.0, _876);
    float _880 = fma(_872, -2.0, _854);
    float _882 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    float _884 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].z, _796);
    float _886 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _888;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _750 + _896;
    float _900 = _890 * _826;
    float _902 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _904 = _806 * _600;
    float _906 = -_814;
    float _908 = _906 + 1.0;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _912 = _844 * _910;
    float _914 = _894 * _870;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _918 = fma(_900, _898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _920 = _840 > 0.5;
    bool _922 = _920 && _770;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _926 = _904 * _924;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _930 = -_912;
    float _932 = fma(_846, _928, _930);
    int _934 = _816 ? as_type<int>(_908) : as_type<int>(_814);
    float _936 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[78].z, _916);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_830)
    {
        _938 = _800;
    }
    float _940 = _938;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _944 = -_926;
    float _946 = fma(_844, _942, _944);
    bool _948 = _792 > 0.5;
    bool _950 = _948 && _776;
    float _952 = _898;
    float _954 = _940;
    if (!_830)
    {
        float _956 = in.m_53.z;
        _952 = _956;
    }
    float _958 = _952;
    if (_830)
    {
        _954 = _792;
    }
    float _960 = _954;
    float _962 = _842 * _858;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _966 = _846 * _964;
    float _968 = _932 * _932;
    float _970 = _902 * _874;
    bool _972 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _974 = isnan(_750);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _986 = -_966;
    float _988 = fma(_904, _984, _986);
    float _990 = fma(_946, _946, _968);
    float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _994 = in.m_57.x;
    bool _996 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _998 = isnan(_750);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = fma(_988, _988, _990);
    float _1010 = _782 ? as_type<float>(_934) : _814;
    float _1012 = -_982;
    float _1014 = _1012 + 1.0;
    bool _1016 = _800 > 0.5;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1020 = _750 + _1018;
    float _1022 = rsqrt(_1008);
    float _1024 = _884 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_788)
    {
        float _1026 = _1016 ? _908 : _814;
        _834 = _1026;
    }
    float _1028 = _834;
    float _1030 = _1006 * _1014;
    float _1032 = fma(_914, _1020, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1036 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1038 = isnan(_750);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = _992 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1050 = -_1006;
    float _1052 = _1050 + 1.0;
    float _1054 = _958;
    if (!_830)
    {
        _836 = _958;
    }
    float _1056 = _836;
    float _1058 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1034);
    float _1060 = _1056;
    float _1062 = _1058;
    if (_830)
    {
        _1060 = _800;
    }
    float _1064 = _1060;
    float _1066 = _1046 * _1052;
    float _1068 = _1066;
    if (_830)
    {
        _1054 = _800;
    }
    float _1070 = _1054;
    float _1072 = fma(_1010, _1048, -0.5);
    float _1074 = _946 * _1022;
    float _1076 = _988 * _1022;
    float _1078 = _932 * _1022;
    float _1080 = _818 * _864;
    float _1082 = _962 * _844;
    float _1084 = _962 * _846;
    float _1086 = _904 * _1076;
    float _1088 = _846 * _1078;
    float _1090 = fma(_1080, _1076, _1082);
    float _1092 = _918 * _1066;
    float _1094 = fma(_1080, _1074, _1084);
    float _1096 = -_1086;
    float _1098 = fma(_844, _1078, _1096);
    float _1100 = _994;
    if (!_770)
    {
        _1068 = _994;
    }
    float _1102 = _1068;
    float _1104 = -_1088;
    float _1106 = fma(_904, _1074, _1104);
    float _1108 = _818 * _994;
    float _1110 = _1102;
    float _1112 = _1108;
    if (_922)
    {
        float _1114 = -_994;
        float _1116 = _1114 + 1.0;
        _1100 = _1116;
    }
    float _1118 = _1100;
    float _1120 = fma(_970, _1098, _1094);
    float _1122 = fma(_970, _1106, _1090);
    float _1124 = _886 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_770)
    {
        _1110 = _1118;
    }
    float _1128 = _1110;
    float _1130 = _1024 + _1120;
    float _1132 = _1124 + _1122;
    float _1134 = _848 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1138 = _1130 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1132 + _1140;
    float _1144 = -_1046;
    float _1146 = _1144 + 1.0;
    float _1148 = fma(_1134, _1028, -0.5);
    float _1150 = _1138 * _1138;
    float _1152 = _1142 * _1142;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1156 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[83].z, _850);
    float _1158 = _960 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1160 = _1150 + _1152;
    float _1162 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1154);
    float _1164 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1058);
    float _1166 = _1150;
    float _1168 = _1152;
    float _1170 = _1130;
    float _1172 = _1132;
    if (!_776)
    {
        _1062 = _1108;
    }
    float _1174 = _1062;
    float _1176 = sqrt(_1160);
    float _1178 = _1174;
    if (_950)
    {
        float _1180 = -_1108;
        float _1182 = _1180 + 1.0;
        _1112 = _1182;
    }
    float _1184 = _1112;
    float _1186 = -_856;
    float _1188 = fma(_1158, 2.0, _1186);
    float _1190 = _962 * _904;
    float _1192 = _844 * _1074;
    float _1194 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1092);
    if (_776)
    {
        _1178 = _1184;
    }
    float _1196 = _1178;
    float _1198 = fma(_1080, _1078, _1190);
    float _1200 = -_1192;
    float _1202 = fma(_846, _1076, _1200);
    float _1204 = _852 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1206 = _882 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1208 = fma(_970, _1202, _1198);
    float _1210 = fma(_1032, _1030, _1194);
    float _1212 = fma(_1204, _1128, -0.5);
    float _1214 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1216 = _1176 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1218 = _1206 + _1208;
    float _1220 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _880);
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1224 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1226 = fma(_1214, _1196, -0.5);
    float _1228 = -_1220;
    float _1230 = fma(_1164, _1148, _1228);
    float _1232 = fma(_1224, -2.0, _1222);
    float _1234 = _1214;
    if (!_1216)
    {
        _1234 = _1218;
    }
    float _1236 = _1234;
    bool _1238 = !_1216;
    float _1240 = _1236;
    if (!_1238)
    {
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1246 = _1176 + _1244;
        float _1248 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = rsqrt(_1160);
        float _1252 = _1246 * _1242;
        float _1254 = _1252 * 0.15915493667125701904296875;
        float _1256 = _1254 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = _1254 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = fma(_1258, _1248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1266 = _1250 * _1264;
        float _1268 = _1262 + (-1.0);
        float _1270 = fma(_1138, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1272 = fma(_1142, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1274 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1278 = _1270 + _1276;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1282 = _1272 + _1280;
        float _1284 = fma(_1218, _1262, _1274);
        float _1286 = _1278 * _1278;
        float _1288 = _1282 * _1282;
        _1240 = _1284;
        _1166 = _1286;
        _1168 = _1288;
        _1170 = _1270;
        _1172 = _1272;
    }
    float _1290 = _1240;
    float _1292 = _1166;
    float _1294 = _1168;
    float _1296 = _1170;
    float _1298 = _1172;
    float _1300 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _936);
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1304 = _1290 + _1302;
    float _1306 = in.m_55.z;
    float _1308 = -_122;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[76].x, _878);
    float _1312 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1156);
    float _1314 = fma(_1304, _1304, _1292);
    float _1316 = in.m_55.w;
    float _1318 = -_122;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1188);
    float _1322 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1162);
    float _1324 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1232);
    float _1326 = _1314 + _1294;
    float _1328 = fma(_1312, _1212, _1320);
    float _1330 = fma(_1300, _1226, _1310);
    float _1332 = -_1324;
    float _1334 = fma(_1322, _1072, _1332);
    float _1336 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1210);
    float _1338 = sqrt(_1326);
    float _1340 = _1230 + 0.5;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1350 = _1336 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1354 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1358 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1328 + 0.5;
    float _1370 = _1330 + 0.5;
    float _1372 = _1334 + 0.5;
    out.m_61.z = _1306;
    bool _1374 = _1338 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1376 = isnan(_1338);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1382 = _1378 || _1380;
    out.m_61.w = _1316;
    out.m_63.x = _1362;
    out.m_63.y = _1364;
    out.m_63.z = _1366;
    out.m_65.x = _1354;
    out.m_65.y = _1358;
    out.m_65.z = _1360;
    out.m_65.w = _1350;
    float _1384 = _1334;
    float _1386 = _1372;
    if (!_1382)
    {
        _126 = 1.0;
    }
    float _1388 = _126;
    out.m_67.x = _1370;
    out.m_67.y = _1340;
    out.m_67.z = _1368;
    out.m_67.w = _1372;
    bool _1390 = !_1382;
    float _1392 = _1388;
    if (!_1390)
    {
        bool _1394 = _1338 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1396 = isnan(_1338);
        bool _1398 = _1394 || _1396;
        bool _1400 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1402 = _1398 || _1400;
        if (!_1402)
        {
            float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1406 = _1338 + _1404;
            float _1408 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1410 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1408;
            float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1414 = _1412 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1416 = 1.0 / _1410;
            float _1418 = _1406 * _1416;
            float _1420 = fma(_1418, _1414, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1392 = _1420;
            _1422 = true;
        }
        else
        {
            bool _1424 = _1338 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1426 = isnan(_1338);
            bool _1428 = _1424 || _1426;
            bool _1430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1432 = _1428 || _1430;
            if (!_1432)
            {
                float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1436 = _1338 + _1434;
                float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1440 = _1438 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1444 = _1442 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1446 = 1.0 / _1440;
                float _1448 = _1436 * _1446;
                float _1450 = fma(_1448, _1444, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1392 = _1450;
                _1422 = true;
            }
            else
            {
                _1392 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1422 = false;
    float _1452 = _1392;
    float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1456 = _1290 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1460 = _1296 + _1458;
    float _1462 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1466 = _1298 + _1464;
    float _1468 = fma(_1460, _1452, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1472 = _1462 + _1470;
    float _1474 = fma(_1466, _1452, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1478 = _1468 + _1476;
    float _1480 = _1472 * _1472;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1484 = _1474 + _1482;
    float _1486 = fma(_1478, _1478, _1480);
    float _1488 = fma(_1484, _1484, _1486);
    float _1490 = rsqrt(_1488);
    float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1494 = _1478 * _1492;
    float _1496 = _1484 * _1492;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 * _1496;
    float _1502 = _1498 + _1500;
    float _1504 = sqrt(_1502);
    bool _1506 = _1504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1510 = _1504 + _1508;
    float _1512 = _1484;
    float _1514 = _1502;
    float _1516 = _1510;
    float _1518 = _1472;
    float _1520 = _1494;
    if (_1506)
    {
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1512 = _1522;
    }
    float _1524 = _1512;
    if (_1506)
    {
        float _1526 = rsqrt(_1502);
        _1514 = _1526;
    }
    float _1528 = _1514;
    if (_1506)
    {
        float _1530 = _1510 * _1524;
        _1516 = _1530;
    }
    float _1532 = _1516;
    if (_1506)
    {
        float _1534 = _1532 * 0.15915493667125701904296875;
        _1384 = _1534;
    }
    float _1536 = _1384;
    float _1538 = _1490;
    if (_1506)
    {
        float _1540 = _1536 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        _1538 = _1542;
    }
    float _1544 = _1538;
    float _1546 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1548 = precise::max(0.0, _1546);
    float _1550 = _1364;
    float _1552 = _1548;
    float _1554 = _1546;
    if (_1506)
    {
        float _1556 = _1536 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        _1550 = _1558;
    }
    float _1560 = _1550;
    float _1562 = -_1492;
    float _1564 = -_1548;
    float _1566 = fma(_1472, _1562, _1564);
    if (!_1506)
    {
        _1552 = _1496;
    }
    float _1568 = _1552;
    float _1570 = _1568;
    if (_1506)
    {
        float _1572 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1554 = _1572;
    }
    float _1574 = _1554;
    float _1576 = _1544;
    float _1578 = _1574;
    if (_1506)
    {
        float _1580 = fma(_1544, _1574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1576 = _1580;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (_1506)
    {
        float _1586 = _1560 + (-1.0);
        _1578 = _1586;
    }
    float _1588 = _1578;
    float _1590 = _1588;
    if (_1506)
    {
        float _1592 = _1528 * _1582;
        _1386 = _1592;
    }
    float _1594 = _1386;
    if (!_1506)
    {
        _1584 = _1566;
    }
    float _1596 = _1584;
    float _1598 = sqrt(_1488);
    float _1600 = _1596;
    if (_1506)
    {
        float _1602 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1602;
    }
    float _1604 = _1518;
    float _1606 = _1604;
    if (_1506)
    {
        float _1608 = _1494 * _1594;
        _1520 = _1608;
    }
    float _1610 = _1520;
    if (!_1506)
    {
        _1590 = _1498;
    }
    float _1612 = _1590;
    float _1614 = _1612;
    if (_1506)
    {
        float _1616 = _1496 * _1594;
        _1570 = _1616;
    }
    float _1618 = _1570;
    if (_1506)
    {
        float _1620 = fma(_1566, _1560, _1604);
        _1600 = _1620;
    }
    float _1622 = _1600;
    if (_1506)
    {
        float _1624 = _1610 * _1610;
        _1614 = _1624;
    }
    float _1626 = _1614;
    if (!_1506)
    {
        _1606 = _1500;
    }
    float _1628 = _1606;
    float _1630 = _1628;
    if (_1506)
    {
        float _1632 = _1618 * _1618;
        _1630 = _1632;
    }
    float _1634 = _1630;
    float _1636 = fma(_1622, _1622, _1626);
    float _1638 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1640 = _1636 + _1634;
    float _1642 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1638);
    float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1646 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1644);
    float _1648 = precise::clamp(_1646, 0.0, 1.0);
    float _1650 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1652 = rsqrt(_1640);
    float _1654 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1642);
    float _1656 = -_1648;
    float _1658 = _1656 + 1.0;
    float _1660 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1662 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1650);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1666 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1668 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1660);
    float _1670 = abs(_1658);
    float _1672 = log2(_1670);
    float _1674 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1662);
    float _1676 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1666);
    float _1678 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1668);
    float _1680 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1682 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1684 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1676);
    float _1686 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1688 = _1652 * _1610;
    float _1690 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1692 = _1652 * _1622;
    float _1694 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1696 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1698 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1690);
    float _1700 = _1652 * _1618;
    float _1702 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1704 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1706 = -_1696;
    float _1708 = fma(_1692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1706);
    float _1710 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1698);
    float _1712 = -_1694;
    float _1714 = fma(_1712, _1680, 1.0);
    float _1716 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = -_1700;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1708);
    float _1722 = exp2(_1704);
    float _1724 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1710);
    float _1726 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1728 = fma(_1720, -0.5, 0.5);
    float _1730 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1732 = fma(_1720, 0.5, 0.5);
    float _1734 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1726);
    float _1736 = _1692 + 1.0;
    float _1738 = log2(_1714);
    float _1740 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1730);
    float _1742 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1744 = fma(_1732, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1746 = fma(_1732, _1744, -0.212114393711090087890625);
    float _1748 = 1.0 / _1724;
    float _1750 = -_1692;
    float _1752 = fma(_1722, _1736, _1750);
    float _1754 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1756 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1758 = fma(_1732, _1746, 1.570728778839111328125);
    float _1760 = fma(_1752, 0.5, 0.5);
    float _1762 = sqrt(_1728);
    float _1764 = _1738 * 0.693147182464599609375;
    float _1766 = _1754 * _1748;
    float _1768 = _1756 * _1748;
    float _1770 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1772 = fma(_1766, 0.5, 0.5);
    float _1774 = fma(_1768, -0.5, 0.5);
    float _1776 = _1762 * 0.636619746685028076171875;
    float3 _4706 = float3(_1772, _1774, _1770);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4706, float3(0.0), isnan(_4706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4706, float3(0.0), isnan(_4706)), level(0.0)).x;
    float3 _4717 = float3(_1772, _1774, _1770);
    float4 _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4717, float3(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4717, float3(0.0), isnan(_4717)), level(0.0)).xyzw;
    float _1783 = _1781.x;
    float _1785 = _1781.y;
    float _1787 = _1781.z;
    float _1789 = _1781.w;
    float _1791 = -_1758;
    float _1793 = fma(_1776, _1791, 1.0);
    float2 _4739 = float2(_1793, _1760);
    float3 _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4739, float2(0.0), isnan(_4739)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4739, float2(0.0), isnan(_4739)), level(0.0)).xyz;
    float _1799 = _1797.x;
    float _1801 = _1797.y;
    float _1803 = _1797.z;
    float _1805 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1807 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1809 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1807);
    float _1811 = exp2(_1805);
    float _1813 = _1724 * 0.5;
    float _1815 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1809);
    float _1817 = fma(_1756, -0.5, _1813);
    float _1819 = _1754 + _1724;
    float _1821 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1815);
    float _1823 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1825 = _1819 * 0.5;
    float _1827 = _1821 + _1724;
    out.gl_Position.x = _1754;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _1821;
    out.gl_Position.w = _1724;
    float _1829 = _1827 * 0.5;
    float _1831 = -_1811;
    float _1833 = _1831 + 1.0;
    out.m_47.x = _1823;
    float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _1825;
    out.m_69.y = _1817;
    out.m_69.z = _1829;
    out.m_69.w = _1724;
    float _1837 = -_1835;
    float _1839 = _1837 + 1.0;
    float _1841 = _1835 * _1778;
    float _1843 = _1789 * _1841;
    float _1845 = _1803 * _1841;
    float _1847 = fma(_1799, _1843, _1783);
    float _1849 = fma(_1801, _1843, _1785);
    float _1851 = _1789 * _1839;
    float _1853 = fma(_1789, _1845, _1787);
    out.m_71.x = _1847;
    out.m_71.y = _1849;
    out.m_71.z = _1853;
    out.m_71.w = _1851;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1422 = false;
    bool _742 = false;
    bool _628 = false;
    bool _478 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1909 = as_type<float>(_104);
        out.gl_Position.z = _1909;
    }
    if (!_94)
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
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_90);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = 0.0;
    float _140 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _138;
    float _144 = _142;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _146 = _142 * 5.0;
        _106 = as_type<int>(_146);
    }
    int _148 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1980 = as_type<float>(_148);
        out.gl_Position.z = _1980;
    }
    if (_136)
    {
        return out;
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = 0.0;
    float _170 = _156;
    if (!_166)
    {
        float _172 = _156 * _156;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = 0.0;
    float _180 = _176;
    if (!_166)
    {
        float _182 = _122 * _122;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    if (!_166)
    {
        float _188 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _188;
    }
    float _190 = _180;
    bool _192 = !_166;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _156 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _156);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _144 = _214;
        _194 = _224;
        _140 = _212;
    }
    float _226 = _144;
    float _228 = _194;
    float _230 = _140;
    bool _232 = !_166;
    float _234 = _226;
    float _236 = _230;
    if (!_232)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _156 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _234 = _250;
        _236 = _244;
        _170 = _256;
    }
    float _258 = _234;
    float _260 = _236;
    float _262 = _170;
    float _264 = _260;
    float _266 = _258;
    if (!_166)
    {
        _264 = _122;
    }
    float _268 = _264;
    float _270 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _268;
    if (!_166)
    {
        float _274 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _274;
    }
    float _276 = _266;
    bool _278 = !_166;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _122 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _122);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_166;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _122 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _340 = fma(_262, _152, _270);
    float _342 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_336, _152, _338);
    float _348 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_262, _150, _342);
    float _354 = fma(_336, _150, _344);
    float _356 = -_346;
    float _358 = _340 + _356;
    float _360 = fma(_262, _154, _348);
    float _362 = fma(_336, _154, _350);
    float _364 = -_354;
    float _366 = _352 + _364;
    float _368 = _358 * _358;
    float _370 = in.m_51.w;
    float _372 = -_362;
    float _374 = _360 + _372;
    float _376 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = fma(_366, _366, _368);
    float _380 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = in.m_44.x;
    float _384 = in.m_44.y;
    float _386 = in.m_44.z;
    float _388 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = fma(_374, _374, _378);
    float _392 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _394 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _380);
    float _396 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    float _400 = sqrt(_390);
    float _402 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    bool _404 = _400 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_400);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _394);
    float _416 = fma(_352, _370, _382);
    float _418 = fma(_340, _370, _384);
    float _420 = fma(_360, _370, _386);
    float _422 = _394;
    float _424 = _398;
    float _426 = _414;
    if (_412)
    {
        _422 = _398;
    }
    float _428 = _422;
    float _430 = _428;
    if (_412)
    {
        _424 = _414;
    }
    float _432 = _424;
    float _434 = _432;
    if (_412)
    {
        _426 = _402;
    }
    float _436 = _426;
    float _438 = _436;
    if (!_412)
    {
        bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _442 = !_440;
        if (!_442)
        {
            float _444 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _446 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _448 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _450);
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _454);
            float _462 = _456 * _456;
            float _464 = fma(_458, _458, _462);
            float _466 = fma(_460, _460, _464);
            float _468 = rsqrt(_466);
            float _470 = _468 * 9.9999999747524270787835121154785e-07;
            float _472 = _458 * _470;
            float _474 = _456 * _470;
            float _476 = _460 * _470;
            _434 = _474;
            _430 = _472;
            _438 = _476;
            _478 = true;
        }
        else
        {
            float _480 = _152 * _152;
            float _482 = fma(_150, _150, _480);
            float _484 = fma(_154, _154, _482);
            float _486 = sqrt(_484);
            bool _488 = _486 >= 9.9999999747524270787835121154785e-07;
            bool _490 = isnan(_486);
            bool _492 = _488 || _490;
            bool _494 = isnan(9.9999999747524270787835121154785e-07);
            bool _496 = _492 || _494;
            if (!_496)
            {
                float _498 = _384 * _384;
                float _500 = fma(_382, _382, _498);
                float _502 = fma(_386, _386, _500);
                float _504 = sqrt(_502);
                bool _506 = _504 >= 9.9999999747524270787835121154785e-07;
                bool _508 = isnan(_504);
                bool _510 = _506 || _508;
                bool _512 = isnan(9.9999999747524270787835121154785e-07);
                bool _514 = _510 || _512;
                if (!_514)
                {
                    float _516 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _516);
                    float _520 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _518);
                    float _522 = rsqrt(_520);
                    float _524 = _522 * 9.9999999747524270787835121154785e-07;
                    float _526 = _524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _530 = _524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _434 = _528;
                    _430 = _526;
                    _438 = _530;
                    _478 = true;
                }
                else
                {
                    float _532 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _534 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _536 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _538 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].x, _532);
                    float _540 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].x, _534);
                    float _542 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].x, _536);
                    float _544 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].z, _538);
                    float _546 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].z, _540);
                    float _548 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
                    float _550 = _544 * _544;
                    float _552 = fma(_546, _546, _550);
                    float _554 = fma(_548, _548, _552);
                    float _556 = rsqrt(_554);
                    float _558 = _556 * 9.9999999747524270787835121154785e-07;
                    float _560 = _546 * _558;
                    float _562 = _544 * _558;
                    float _564 = _548 * _558;
                    _434 = _562;
                    _430 = _560;
                    _438 = _564;
                    _478 = true;
                }
            }
            else
            {
                float _566 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _568 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _570 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _572 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _566);
                float _574 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
                float _576 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _570);
                float _578 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
                float _580 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
                float _582 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _576);
                float _584 = _578 * _578;
                float _586 = fma(_580, _580, _584);
                float _588 = fma(_582, _582, _586);
                float _590 = rsqrt(_588);
                float _592 = _590 * 9.9999999747524270787835121154785e-07;
                float _594 = _580 * _592;
                float _596 = _578 * _592;
                float _598 = _582 * _592;
                _434 = _596;
                _430 = _594;
                _438 = _598;
            }
        }
    }
    _478 = false;
    float _600 = _434;
    float _602 = _430;
    float _604 = _438;
    bool _606 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _608 = !_606;
    float _626;
    if (!_608)
    {
        float _610 = in.m_53.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_90);
        float _632 = 1.0 / _630;
        float _634 = _122 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_652;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _674;
    float _678 = 1.0 / _656;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _682 = _668 * _672;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _640 * _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _690;
    float _694 = fma(_676, _688, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _696;
    float _700 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _702 = fma(_698, _688, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _704 = _694 * _682;
    float _706 = _702 * _682;
    float _708 = _700 * _682;
    float _710 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].x, _704);
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].y, _706);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].z, _708);
    float _716 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[144].x, _710);
    float _718 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[144].y, _712);
    float _720 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[144].z, _714);
    bool _722 = !_680;
    float _740;
    if (!_722)
    {
        float _724 = in.m_53.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_90);
        float _746 = 1.0 / _744;
        float _748 = _122 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = in.m_51.x;
    float _754 = in.m_51.y;
    float _756 = in.m_51.z;
    float _758 = _418 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _760 = _418 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = in.m_53.w;
    float _764 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _758);
    float _766 = _600 * _600;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _770 = _768 != 0;
    float _772 = in.m_55.y;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _776 = _774 != 0;
    float _778 = fma(_602, _602, _766);
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _782 = _780 != 0;
    float _784 = in.m_55.x;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _788 = _786 != 0;
    float _790 = _418 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = in.m_53.x;
    float _794 = fma(_604, _604, _778);
    float _796 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    float _798 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _800 = in.m_53.y;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _806 = rsqrt(_794);
    float _808 = _716 * _752;
    float _810 = _720 * _756;
    float _812 = _718 * _754;
    float _814 = in.m_57.y;
    bool _816 = _762 > 0.5;
    float _818 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _820 = in.m_59.x;
    float _822 = in.m_59.y;
    float _824 = in.m_59.z;
    float _826 = 1.0 / _804;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _830 = _828 != 0;
    float _832 = 0.0;
    float _834 = _814;
    float _836 = _750;
    if (_770)
    {
        float _838 = in.m_53.z;
        _832 = _838;
    }
    float _840 = _832;
    float _842 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_61.y = _772;
    float _844 = _806 * _604;
    float _846 = _806 * _602;
    float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_61.x = _784;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _822);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _820);
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _868 = _792 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _870 = 1.0 / _862;
    float _872 = _800 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _824);
    float _876 = -_866;
    float _878 = fma(_868, 2.0, _876);
    float _880 = fma(_872, -2.0, _854);
    float _882 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    float _884 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].z, _796);
    float _886 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _888;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _750 + _896;
    float _900 = _890 * _826;
    float _902 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _904 = _806 * _600;
    float _906 = -_814;
    float _908 = _906 + 1.0;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _912 = _844 * _910;
    float _914 = _894 * _870;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _918 = fma(_900, _898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _920 = _840 > 0.5;
    bool _922 = _920 && _770;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _926 = _904 * _924;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _930 = -_912;
    float _932 = fma(_846, _928, _930);
    int _934 = _816 ? as_type<int>(_908) : as_type<int>(_814);
    float _936 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[78].z, _916);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_830)
    {
        _938 = _800;
    }
    float _940 = _938;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _944 = -_926;
    float _946 = fma(_844, _942, _944);
    bool _948 = _792 > 0.5;
    bool _950 = _948 && _776;
    float _952 = _898;
    float _954 = _940;
    if (!_830)
    {
        float _956 = in.m_53.z;
        _952 = _956;
    }
    float _958 = _952;
    if (_830)
    {
        _954 = _792;
    }
    float _960 = _954;
    float _962 = _842 * _858;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _966 = _846 * _964;
    float _968 = _932 * _932;
    float _970 = _902 * _874;
    bool _972 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _974 = isnan(_750);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _986 = -_966;
    float _988 = fma(_904, _984, _986);
    float _990 = fma(_946, _946, _968);
    float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _994 = in.m_57.x;
    bool _996 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _998 = isnan(_750);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = fma(_988, _988, _990);
    float _1010 = _782 ? as_type<float>(_934) : _814;
    float _1012 = -_982;
    float _1014 = _1012 + 1.0;
    bool _1016 = _800 > 0.5;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1020 = _750 + _1018;
    float _1022 = rsqrt(_1008);
    float _1024 = _884 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_788)
    {
        float _1026 = _1016 ? _908 : _814;
        _834 = _1026;
    }
    float _1028 = _834;
    float _1030 = _1006 * _1014;
    float _1032 = fma(_914, _1020, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1036 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1038 = isnan(_750);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = _992 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1050 = -_1006;
    float _1052 = _1050 + 1.0;
    float _1054 = _958;
    if (!_830)
    {
        _836 = _958;
    }
    float _1056 = _836;
    float _1058 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1034);
    float _1060 = _1056;
    float _1062 = _1058;
    if (_830)
    {
        _1060 = _800;
    }
    float _1064 = _1060;
    float _1066 = _1046 * _1052;
    float _1068 = _1066;
    if (_830)
    {
        _1054 = _800;
    }
    float _1070 = _1054;
    float _1072 = fma(_1010, _1048, -0.5);
    float _1074 = _946 * _1022;
    float _1076 = _988 * _1022;
    float _1078 = _932 * _1022;
    float _1080 = _818 * _864;
    float _1082 = _962 * _844;
    float _1084 = _962 * _846;
    float _1086 = _904 * _1076;
    float _1088 = _846 * _1078;
    float _1090 = fma(_1080, _1076, _1082);
    float _1092 = _918 * _1066;
    float _1094 = fma(_1080, _1074, _1084);
    float _1096 = -_1086;
    float _1098 = fma(_844, _1078, _1096);
    float _1100 = _994;
    if (!_770)
    {
        _1068 = _994;
    }
    float _1102 = _1068;
    float _1104 = -_1088;
    float _1106 = fma(_904, _1074, _1104);
    float _1108 = _818 * _994;
    float _1110 = _1102;
    float _1112 = _1108;
    if (_922)
    {
        float _1114 = -_994;
        float _1116 = _1114 + 1.0;
        _1100 = _1116;
    }
    float _1118 = _1100;
    float _1120 = fma(_970, _1098, _1094);
    float _1122 = fma(_970, _1106, _1090);
    float _1124 = _886 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_770)
    {
        _1110 = _1118;
    }
    float _1128 = _1110;
    float _1130 = _1024 + _1120;
    float _1132 = _1124 + _1122;
    float _1134 = _848 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1138 = _1130 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1132 + _1140;
    float _1144 = -_1046;
    float _1146 = _1144 + 1.0;
    float _1148 = fma(_1134, _1028, -0.5);
    float _1150 = _1138 * _1138;
    float _1152 = _1142 * _1142;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1156 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[83].z, _850);
    float _1158 = _960 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1160 = _1150 + _1152;
    float _1162 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1154);
    float _1164 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1058);
    float _1166 = _1150;
    float _1168 = _1152;
    float _1170 = _1130;
    float _1172 = _1132;
    if (!_776)
    {
        _1062 = _1108;
    }
    float _1174 = _1062;
    float _1176 = sqrt(_1160);
    float _1178 = _1174;
    if (_950)
    {
        float _1180 = -_1108;
        float _1182 = _1180 + 1.0;
        _1112 = _1182;
    }
    float _1184 = _1112;
    float _1186 = -_856;
    float _1188 = fma(_1158, 2.0, _1186);
    float _1190 = _962 * _904;
    float _1192 = _844 * _1074;
    float _1194 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1092);
    if (_776)
    {
        _1178 = _1184;
    }
    float _1196 = _1178;
    float _1198 = fma(_1080, _1078, _1190);
    float _1200 = -_1192;
    float _1202 = fma(_846, _1076, _1200);
    float _1204 = _852 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1206 = _882 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1208 = fma(_970, _1202, _1198);
    float _1210 = fma(_1032, _1030, _1194);
    float _1212 = fma(_1204, _1128, -0.5);
    float _1214 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1216 = _1176 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1218 = _1206 + _1208;
    float _1220 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _880);
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1224 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1226 = fma(_1214, _1196, -0.5);
    float _1228 = -_1220;
    float _1230 = fma(_1164, _1148, _1228);
    float _1232 = fma(_1224, -2.0, _1222);
    float _1234 = _1214;
    if (!_1216)
    {
        _1234 = _1218;
    }
    float _1236 = _1234;
    bool _1238 = !_1216;
    float _1240 = _1236;
    if (!_1238)
    {
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1246 = _1176 + _1244;
        float _1248 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = rsqrt(_1160);
        float _1252 = _1246 * _1242;
        float _1254 = _1252 * 0.15915493667125701904296875;
        float _1256 = _1254 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = _1254 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = fma(_1258, _1248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1266 = _1250 * _1264;
        float _1268 = _1262 + (-1.0);
        float _1270 = fma(_1138, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1272 = fma(_1142, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1274 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1278 = _1270 + _1276;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1282 = _1272 + _1280;
        float _1284 = fma(_1218, _1262, _1274);
        float _1286 = _1278 * _1278;
        float _1288 = _1282 * _1282;
        _1240 = _1284;
        _1166 = _1286;
        _1168 = _1288;
        _1170 = _1270;
        _1172 = _1272;
    }
    float _1290 = _1240;
    float _1292 = _1166;
    float _1294 = _1168;
    float _1296 = _1170;
    float _1298 = _1172;
    float _1300 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _936);
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1304 = _1290 + _1302;
    float _1306 = in.m_55.z;
    float _1308 = -_122;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[76].x, _878);
    float _1312 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1156);
    float _1314 = fma(_1304, _1304, _1292);
    float _1316 = in.m_55.w;
    float _1318 = -_122;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1188);
    float _1322 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1162);
    float _1324 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1232);
    float _1326 = _1314 + _1294;
    float _1328 = fma(_1312, _1212, _1320);
    float _1330 = fma(_1300, _1226, _1310);
    float _1332 = -_1324;
    float _1334 = fma(_1322, _1072, _1332);
    float _1336 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1210);
    float _1338 = sqrt(_1326);
    float _1340 = _1230 + 0.5;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1350 = _1336 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1354 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1358 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1328 + 0.5;
    float _1370 = _1330 + 0.5;
    float _1372 = _1334 + 0.5;
    out.m_61.z = _1306;
    bool _1374 = _1338 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1376 = isnan(_1338);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1382 = _1378 || _1380;
    out.m_61.w = _1316;
    out.m_63.x = _1362;
    out.m_63.y = _1364;
    out.m_63.z = _1366;
    out.m_65.x = _1354;
    out.m_65.y = _1358;
    out.m_65.z = _1360;
    out.m_65.w = _1350;
    float _1384 = _1334;
    float _1386 = _1372;
    if (!_1382)
    {
        _126 = 1.0;
    }
    float _1388 = _126;
    out.m_67.x = _1370;
    out.m_67.y = _1340;
    out.m_67.z = _1368;
    out.m_67.w = _1372;
    bool _1390 = !_1382;
    float _1392 = _1388;
    if (!_1390)
    {
        bool _1394 = _1338 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1396 = isnan(_1338);
        bool _1398 = _1394 || _1396;
        bool _1400 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1402 = _1398 || _1400;
        if (!_1402)
        {
            float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1406 = _1338 + _1404;
            float _1408 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1410 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1408;
            float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1414 = _1412 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1416 = 1.0 / _1410;
            float _1418 = _1406 * _1416;
            float _1420 = fma(_1418, _1414, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1392 = _1420;
            _1422 = true;
        }
        else
        {
            bool _1424 = _1338 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1426 = isnan(_1338);
            bool _1428 = _1424 || _1426;
            bool _1430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1432 = _1428 || _1430;
            if (!_1432)
            {
                float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1436 = _1338 + _1434;
                float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1440 = _1438 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1444 = _1442 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1446 = 1.0 / _1440;
                float _1448 = _1436 * _1446;
                float _1450 = fma(_1448, _1444, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1392 = _1450;
                _1422 = true;
            }
            else
            {
                _1392 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1422 = false;
    float _1452 = _1392;
    float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1456 = _1290 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1460 = _1296 + _1458;
    float _1462 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1466 = _1298 + _1464;
    float _1468 = fma(_1460, _1452, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1472 = _1462 + _1470;
    float _1474 = fma(_1466, _1452, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1478 = _1468 + _1476;
    float _1480 = _1472 * _1472;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1484 = _1474 + _1482;
    float _1486 = fma(_1478, _1478, _1480);
    float _1488 = fma(_1484, _1484, _1486);
    float _1490 = rsqrt(_1488);
    float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1494 = _1478 * _1492;
    float _1496 = _1484 * _1492;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 * _1496;
    float _1502 = _1498 + _1500;
    float _1504 = sqrt(_1502);
    bool _1506 = _1504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1510 = _1504 + _1508;
    float _1512 = _1484;
    float _1514 = _1502;
    float _1516 = _1510;
    float _1518 = _1472;
    float _1520 = _1494;
    if (_1506)
    {
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1512 = _1522;
    }
    float _1524 = _1512;
    if (_1506)
    {
        float _1526 = rsqrt(_1502);
        _1514 = _1526;
    }
    float _1528 = _1514;
    if (_1506)
    {
        float _1530 = _1510 * _1524;
        _1516 = _1530;
    }
    float _1532 = _1516;
    if (_1506)
    {
        float _1534 = _1532 * 0.15915493667125701904296875;
        _1384 = _1534;
    }
    float _1536 = _1384;
    float _1538 = _1490;
    if (_1506)
    {
        float _1540 = _1536 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        _1538 = _1542;
    }
    float _1544 = _1538;
    float _1546 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1548 = precise::max(0.0, _1546);
    float _1550 = _1364;
    float _1552 = _1548;
    float _1554 = _1546;
    if (_1506)
    {
        float _1556 = _1536 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        _1550 = _1558;
    }
    float _1560 = _1550;
    float _1562 = -_1492;
    float _1564 = -_1548;
    float _1566 = fma(_1472, _1562, _1564);
    if (!_1506)
    {
        _1552 = _1496;
    }
    float _1568 = _1552;
    float _1570 = _1568;
    if (_1506)
    {
        float _1572 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1554 = _1572;
    }
    float _1574 = _1554;
    float _1576 = _1544;
    float _1578 = _1574;
    if (_1506)
    {
        float _1580 = fma(_1544, _1574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1576 = _1580;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (_1506)
    {
        float _1586 = _1560 + (-1.0);
        _1578 = _1586;
    }
    float _1588 = _1578;
    float _1590 = _1588;
    if (_1506)
    {
        float _1592 = _1528 * _1582;
        _1386 = _1592;
    }
    float _1594 = _1386;
    if (!_1506)
    {
        _1584 = _1566;
    }
    float _1596 = _1584;
    float _1598 = sqrt(_1488);
    float _1600 = _1596;
    if (_1506)
    {
        float _1602 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1602;
    }
    float _1604 = _1518;
    float _1606 = _1604;
    if (_1506)
    {
        float _1608 = _1494 * _1594;
        _1520 = _1608;
    }
    float _1610 = _1520;
    if (!_1506)
    {
        _1590 = _1498;
    }
    float _1612 = _1590;
    float _1614 = _1612;
    if (_1506)
    {
        float _1616 = _1496 * _1594;
        _1570 = _1616;
    }
    float _1618 = _1570;
    if (_1506)
    {
        float _1620 = fma(_1566, _1560, _1604);
        _1600 = _1620;
    }
    float _1622 = _1600;
    if (_1506)
    {
        float _1624 = _1610 * _1610;
        _1614 = _1624;
    }
    float _1626 = _1614;
    if (!_1506)
    {
        _1606 = _1500;
    }
    float _1628 = _1606;
    float _1630 = _1628;
    if (_1506)
    {
        float _1632 = _1618 * _1618;
        _1630 = _1632;
    }
    float _1634 = _1630;
    float _1636 = fma(_1622, _1622, _1626);
    float _1638 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1640 = _1636 + _1634;
    float _1642 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1638);
    float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1646 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1644);
    float _1648 = precise::clamp(_1646, 0.0, 1.0);
    float _1650 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1652 = rsqrt(_1640);
    float _1654 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1642);
    float _1656 = -_1648;
    float _1658 = _1656 + 1.0;
    float _1660 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1662 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1650);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1666 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1668 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1660);
    float _1670 = abs(_1658);
    float _1672 = log2(_1670);
    float _1674 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1662);
    float _1676 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1666);
    float _1678 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1668);
    float _1680 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1682 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1684 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1676);
    float _1686 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1688 = _1652 * _1610;
    float _1690 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1692 = _1652 * _1622;
    float _1694 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1696 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1698 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1690);
    float _1700 = _1652 * _1618;
    float _1702 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1704 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1706 = -_1696;
    float _1708 = fma(_1692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1706);
    float _1710 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1698);
    float _1712 = -_1694;
    float _1714 = fma(_1712, _1680, 1.0);
    float _1716 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = -_1700;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1708);
    float _1722 = exp2(_1704);
    float _1724 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1710);
    float _1726 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1728 = fma(_1720, -0.5, 0.5);
    float _1730 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1732 = fma(_1720, 0.5, 0.5);
    float _1734 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1726);
    float _1736 = _1692 + 1.0;
    float _1738 = log2(_1714);
    float _1740 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1730);
    float _1742 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1744 = fma(_1732, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1746 = fma(_1732, _1744, -0.212114393711090087890625);
    float _1748 = 1.0 / _1724;
    float _1750 = -_1692;
    float _1752 = fma(_1722, _1736, _1750);
    float _1754 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1756 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1758 = fma(_1732, _1746, 1.570728778839111328125);
    float _1760 = fma(_1752, 0.5, 0.5);
    float _1762 = sqrt(_1728);
    float _1764 = _1738 * 0.693147182464599609375;
    float _1766 = _1754 * _1748;
    float _1768 = _1756 * _1748;
    float _1770 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1772 = fma(_1766, 0.5, 0.5);
    float _1774 = fma(_1768, -0.5, 0.5);
    float _1776 = _1762 * 0.636619746685028076171875;
    float3 _4706 = float3(_1772, _1774, _1770);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4706, float3(0.0), isnan(_4706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4706, float3(0.0), isnan(_4706)), level(0.0)).x;
    float3 _4717 = float3(_1772, _1774, _1770);
    float4 _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4717, float3(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4717, float3(0.0), isnan(_4717)), level(0.0)).xyzw;
    float _1783 = _1781.x;
    float _1785 = _1781.y;
    float _1787 = _1781.z;
    float _1789 = _1781.w;
    float _1791 = -_1758;
    float _1793 = fma(_1776, _1791, 1.0);
    float2 _4739 = float2(_1793, _1760);
    float3 _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4739, float2(0.0), isnan(_4739)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4739, float2(0.0), isnan(_4739)), level(0.0)).xyz;
    float _1799 = _1797.x;
    float _1801 = _1797.y;
    float _1803 = _1797.z;
    float _1805 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1807 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1809 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1807);
    float _1811 = exp2(_1805);
    float _1813 = _1724 * 0.5;
    float _1815 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1809);
    float _1817 = fma(_1756, -0.5, _1813);
    float _1819 = _1754 + _1724;
    float _1821 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1815);
    float _1823 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1825 = _1819 * 0.5;
    float _1827 = _1821 + _1724;
    out.gl_Position.x = _1754;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _1821;
    out.gl_Position.w = _1724;
    float _1829 = _1827 * 0.5;
    float _1831 = -_1811;
    float _1833 = _1831 + 1.0;
    out.m_47.x = _1823;
    float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _1825;
    out.m_69.y = _1817;
    out.m_69.z = _1829;
    out.m_69.w = _1724;
    float _1837 = -_1835;
    float _1839 = _1837 + 1.0;
    float _1841 = _1835 * _1778;
    float _1843 = _1789 * _1841;
    float _1845 = _1803 * _1841;
    float _1847 = fma(_1799, _1843, _1783);
    float _1849 = fma(_1801, _1843, _1785);
    float _1851 = _1789 * _1839;
    float _1853 = fma(_1789, _1845, _1787);
    out.m_71.x = _1847;
    out.m_71.y = _1849;
    out.m_71.z = _1853;
    out.m_71.w = _1851;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1422 = false;
    bool _742 = false;
    bool _628 = false;
    bool _478 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1909 = as_type<float>(_104);
        out.gl_Position.z = _1909;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_90);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = 0.0;
    float _140 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _138;
    float _144 = _142;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _146 = _142 * 5.0;
        _106 = as_type<int>(_146);
    }
    int _148 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1980 = as_type<float>(_148);
        out.gl_Position.z = _1980;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.x;
    float _152 = in.m_49.y;
    float _154 = in.m_49.z;
    float _156 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = 0.0;
    float _170 = _156;
    if (!_166)
    {
        float _172 = _156 * _156;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = 0.0;
    float _180 = _176;
    if (!_166)
    {
        float _182 = _122 * _122;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    if (!_166)
    {
        float _188 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _188;
    }
    float _190 = _180;
    bool _192 = !_166;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _156 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _156);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _144 = _214;
        _194 = _224;
        _140 = _212;
    }
    float _226 = _144;
    float _228 = _194;
    float _230 = _140;
    bool _232 = !_166;
    float _234 = _226;
    float _236 = _230;
    if (!_232)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _156 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _234 = _250;
        _236 = _244;
        _170 = _256;
    }
    float _258 = _234;
    float _260 = _236;
    float _262 = _170;
    float _264 = _260;
    float _266 = _258;
    if (!_166)
    {
        _264 = _122;
    }
    float _268 = _264;
    float _270 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _268;
    if (!_166)
    {
        float _274 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _274;
    }
    float _276 = _266;
    bool _278 = !_166;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _122 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _122);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
    }
    float _312 = _280;
    bool _314 = !_166;
    if (!_314)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = 1.0 / _322;
        float _326 = _122 * _318;
        float _328 = exp2(_326);
        float _330 = -_328;
        float _332 = _330 + 1.0;
        float _334 = _332 * _324;
        _272 = _334;
    }
    float _336 = _272;
    float _338 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _340 = fma(_262, _152, _270);
    float _342 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_336, _152, _338);
    float _348 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _352 = fma(_262, _150, _342);
    float _354 = fma(_336, _150, _344);
    float _356 = -_346;
    float _358 = _340 + _356;
    float _360 = fma(_262, _154, _348);
    float _362 = fma(_336, _154, _350);
    float _364 = -_354;
    float _366 = _352 + _364;
    float _368 = _358 * _358;
    float _370 = in.m_51.w;
    float _372 = -_362;
    float _374 = _360 + _372;
    float _376 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = fma(_366, _366, _368);
    float _380 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _382 = in.m_44.x;
    float _384 = in.m_44.y;
    float _386 = in.m_44.z;
    float _388 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = fma(_374, _374, _378);
    float _392 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _394 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _380);
    float _396 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _392);
    float _400 = sqrt(_390);
    float _402 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    bool _404 = _400 >= 9.9999999747524270787835121154785e-07;
    bool _406 = isnan(_400);
    bool _408 = _404 || _406;
    bool _410 = isnan(9.9999999747524270787835121154785e-07);
    bool _412 = _408 || _410;
    float _414 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _394);
    float _416 = fma(_352, _370, _382);
    float _418 = fma(_340, _370, _384);
    float _420 = fma(_360, _370, _386);
    float _422 = _394;
    float _424 = _398;
    float _426 = _414;
    if (_412)
    {
        _422 = _398;
    }
    float _428 = _422;
    float _430 = _428;
    if (_412)
    {
        _424 = _414;
    }
    float _432 = _424;
    float _434 = _432;
    if (_412)
    {
        _426 = _402;
    }
    float _436 = _426;
    float _438 = _436;
    if (!_412)
    {
        bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _442 = !_440;
        if (!_442)
        {
            float _444 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _446 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _448 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _450 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _450);
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _454);
            float _462 = _456 * _456;
            float _464 = fma(_458, _458, _462);
            float _466 = fma(_460, _460, _464);
            float _468 = rsqrt(_466);
            float _470 = _468 * 9.9999999747524270787835121154785e-07;
            float _472 = _458 * _470;
            float _474 = _456 * _470;
            float _476 = _460 * _470;
            _434 = _474;
            _430 = _472;
            _438 = _476;
            _478 = true;
        }
        else
        {
            float _480 = _152 * _152;
            float _482 = fma(_150, _150, _480);
            float _484 = fma(_154, _154, _482);
            float _486 = sqrt(_484);
            bool _488 = _486 >= 9.9999999747524270787835121154785e-07;
            bool _490 = isnan(_486);
            bool _492 = _488 || _490;
            bool _494 = isnan(9.9999999747524270787835121154785e-07);
            bool _496 = _492 || _494;
            if (!_496)
            {
                float _498 = _384 * _384;
                float _500 = fma(_382, _382, _498);
                float _502 = fma(_386, _386, _500);
                float _504 = sqrt(_502);
                bool _506 = _504 >= 9.9999999747524270787835121154785e-07;
                bool _508 = isnan(_504);
                bool _510 = _506 || _508;
                bool _512 = isnan(9.9999999747524270787835121154785e-07);
                bool _514 = _510 || _512;
                if (!_514)
                {
                    float _516 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _518 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _516);
                    float _520 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _518);
                    float _522 = rsqrt(_520);
                    float _524 = _522 * 9.9999999747524270787835121154785e-07;
                    float _526 = _524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _528 = _524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _530 = _524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _434 = _528;
                    _430 = _526;
                    _438 = _530;
                    _478 = true;
                }
                else
                {
                    float _532 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _534 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _536 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _538 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[5].x, _532);
                    float _540 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[4].x, _534);
                    float _542 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[6].x, _536);
                    float _544 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].z, _538);
                    float _546 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].z, _540);
                    float _548 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].z, _542);
                    float _550 = _544 * _544;
                    float _552 = fma(_546, _546, _550);
                    float _554 = fma(_548, _548, _552);
                    float _556 = rsqrt(_554);
                    float _558 = _556 * 9.9999999747524270787835121154785e-07;
                    float _560 = _546 * _558;
                    float _562 = _544 * _558;
                    float _564 = _548 * _558;
                    _434 = _562;
                    _430 = _560;
                    _438 = _564;
                    _478 = true;
                }
            }
            else
            {
                float _566 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _568 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _570 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _572 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _566);
                float _574 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
                float _576 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _570);
                float _578 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
                float _580 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _574);
                float _582 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _576);
                float _584 = _578 * _578;
                float _586 = fma(_580, _580, _584);
                float _588 = fma(_582, _582, _586);
                float _590 = rsqrt(_588);
                float _592 = _590 * 9.9999999747524270787835121154785e-07;
                float _594 = _580 * _592;
                float _596 = _578 * _592;
                float _598 = _582 * _592;
                _434 = _596;
                _430 = _594;
                _438 = _598;
            }
        }
    }
    _478 = false;
    float _600 = _434;
    float _602 = _430;
    float _604 = _438;
    bool _606 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _608 = !_606;
    float _626;
    if (!_608)
    {
        float _610 = in.m_53.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_90);
        float _632 = 1.0 / _630;
        float _634 = _122 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = _636 + _638;
    bool _642 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _654;
    bool _658 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_636);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_652;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _674;
    float _678 = 1.0 / _656;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _682 = _668 * _672;
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _640 * _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _690;
    float _694 = fma(_676, _688, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _696;
    float _700 = fma(_692, _688, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _702 = fma(_698, _688, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _704 = _694 * _682;
    float _706 = _702 * _682;
    float _708 = _700 * _682;
    float _710 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].x, _704);
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].y, _706);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[143].z, _708);
    float _716 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[144].x, _710);
    float _718 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[144].y, _712);
    float _720 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[144].z, _714);
    bool _722 = !_680;
    float _740;
    if (!_722)
    {
        float _724 = in.m_53.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_90);
        float _746 = 1.0 / _744;
        float _748 = _122 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = in.m_51.x;
    float _754 = in.m_51.y;
    float _756 = in.m_51.z;
    float _758 = _418 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _760 = _418 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = in.m_53.w;
    float _764 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].x, _758);
    float _766 = _600 * _600;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _770 = _768 != 0;
    float _772 = in.m_55.y;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _776 = _774 != 0;
    float _778 = fma(_602, _602, _766);
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _782 = _780 != 0;
    float _784 = in.m_55.x;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _788 = _786 != 0;
    float _790 = _418 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = in.m_53.x;
    float _794 = fma(_604, _604, _778);
    float _796 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    float _798 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _800 = in.m_53.y;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _806 = rsqrt(_794);
    float _808 = _716 * _752;
    float _810 = _720 * _756;
    float _812 = _718 * _754;
    float _814 = in.m_57.y;
    bool _816 = _762 > 0.5;
    float _818 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _820 = in.m_59.x;
    float _822 = in.m_59.y;
    float _824 = in.m_59.z;
    float _826 = 1.0 / _804;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _830 = _828 != 0;
    float _832 = 0.0;
    float _834 = _814;
    float _836 = _750;
    if (_770)
    {
        float _838 = in.m_53.z;
        _832 = _838;
    }
    float _840 = _832;
    float _842 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_61.y = _772;
    float _844 = _806 * _604;
    float _846 = _806 * _602;
    float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_61.x = _784;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _822);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _862 = _860 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _820);
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _868 = _792 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _870 = 1.0 / _862;
    float _872 = _800 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _824);
    float _876 = -_866;
    float _878 = fma(_868, 2.0, _876);
    float _880 = fma(_872, -2.0, _854);
    float _882 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    float _884 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].z, _796);
    float _886 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _888;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _750 + _896;
    float _900 = _890 * _826;
    float _902 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _904 = _806 * _600;
    float _906 = -_814;
    float _908 = _906 + 1.0;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _912 = _844 * _910;
    float _914 = _894 * _870;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _918 = fma(_900, _898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _920 = _840 > 0.5;
    bool _922 = _920 && _770;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _926 = _904 * _924;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _930 = -_912;
    float _932 = fma(_846, _928, _930);
    int _934 = _816 ? as_type<int>(_908) : as_type<int>(_814);
    float _936 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[78].z, _916);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_830)
    {
        _938 = _800;
    }
    float _940 = _938;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _944 = -_926;
    float _946 = fma(_844, _942, _944);
    bool _948 = _792 > 0.5;
    bool _950 = _948 && _776;
    float _952 = _898;
    float _954 = _940;
    if (!_830)
    {
        float _956 = in.m_53.z;
        _952 = _956;
    }
    float _958 = _952;
    if (_830)
    {
        _954 = _792;
    }
    float _960 = _954;
    float _962 = _842 * _858;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _966 = _846 * _964;
    float _968 = _932 * _932;
    float _970 = _902 * _874;
    bool _972 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _974 = isnan(_750);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _986 = -_966;
    float _988 = fma(_904, _984, _986);
    float _990 = fma(_946, _946, _968);
    float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _994 = in.m_57.x;
    bool _996 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _998 = isnan(_750);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = fma(_988, _988, _990);
    float _1010 = _782 ? as_type<float>(_934) : _814;
    float _1012 = -_982;
    float _1014 = _1012 + 1.0;
    bool _1016 = _800 > 0.5;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1020 = _750 + _1018;
    float _1022 = rsqrt(_1008);
    float _1024 = _884 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_788)
    {
        float _1026 = _1016 ? _908 : _814;
        _834 = _1026;
    }
    float _1028 = _834;
    float _1030 = _1006 * _1014;
    float _1032 = fma(_914, _1020, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1036 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1038 = isnan(_750);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = _992 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1050 = -_1006;
    float _1052 = _1050 + 1.0;
    float _1054 = _958;
    if (!_830)
    {
        _836 = _958;
    }
    float _1056 = _836;
    float _1058 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1034);
    float _1060 = _1056;
    float _1062 = _1058;
    if (_830)
    {
        _1060 = _800;
    }
    float _1064 = _1060;
    float _1066 = _1046 * _1052;
    float _1068 = _1066;
    if (_830)
    {
        _1054 = _800;
    }
    float _1070 = _1054;
    float _1072 = fma(_1010, _1048, -0.5);
    float _1074 = _946 * _1022;
    float _1076 = _988 * _1022;
    float _1078 = _932 * _1022;
    float _1080 = _818 * _864;
    float _1082 = _962 * _844;
    float _1084 = _962 * _846;
    float _1086 = _904 * _1076;
    float _1088 = _846 * _1078;
    float _1090 = fma(_1080, _1076, _1082);
    float _1092 = _918 * _1066;
    float _1094 = fma(_1080, _1074, _1084);
    float _1096 = -_1086;
    float _1098 = fma(_844, _1078, _1096);
    float _1100 = _994;
    if (!_770)
    {
        _1068 = _994;
    }
    float _1102 = _1068;
    float _1104 = -_1088;
    float _1106 = fma(_904, _1074, _1104);
    float _1108 = _818 * _994;
    float _1110 = _1102;
    float _1112 = _1108;
    if (_922)
    {
        float _1114 = -_994;
        float _1116 = _1114 + 1.0;
        _1100 = _1116;
    }
    float _1118 = _1100;
    float _1120 = fma(_970, _1098, _1094);
    float _1122 = fma(_970, _1106, _1090);
    float _1124 = _886 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_770)
    {
        _1110 = _1118;
    }
    float _1128 = _1110;
    float _1130 = _1024 + _1120;
    float _1132 = _1124 + _1122;
    float _1134 = _848 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1138 = _1130 + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1132 + _1140;
    float _1144 = -_1046;
    float _1146 = _1144 + 1.0;
    float _1148 = fma(_1134, _1028, -0.5);
    float _1150 = _1138 * _1138;
    float _1152 = _1142 * _1142;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1156 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[83].z, _850);
    float _1158 = _960 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1160 = _1150 + _1152;
    float _1162 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1154);
    float _1164 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1058);
    float _1166 = _1150;
    float _1168 = _1152;
    float _1170 = _1130;
    float _1172 = _1132;
    if (!_776)
    {
        _1062 = _1108;
    }
    float _1174 = _1062;
    float _1176 = sqrt(_1160);
    float _1178 = _1174;
    if (_950)
    {
        float _1180 = -_1108;
        float _1182 = _1180 + 1.0;
        _1112 = _1182;
    }
    float _1184 = _1112;
    float _1186 = -_856;
    float _1188 = fma(_1158, 2.0, _1186);
    float _1190 = _962 * _904;
    float _1192 = _844 * _1074;
    float _1194 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1092);
    if (_776)
    {
        _1178 = _1184;
    }
    float _1196 = _1178;
    float _1198 = fma(_1080, _1078, _1190);
    float _1200 = -_1192;
    float _1202 = fma(_846, _1076, _1200);
    float _1204 = _852 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1206 = _882 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1208 = fma(_970, _1202, _1198);
    float _1210 = fma(_1032, _1030, _1194);
    float _1212 = fma(_1204, _1128, -0.5);
    float _1214 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1216 = _1176 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1218 = _1206 + _1208;
    float _1220 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _880);
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1224 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1226 = fma(_1214, _1196, -0.5);
    float _1228 = -_1220;
    float _1230 = fma(_1164, _1148, _1228);
    float _1232 = fma(_1224, -2.0, _1222);
    float _1234 = _1214;
    if (!_1216)
    {
        _1234 = _1218;
    }
    float _1236 = _1234;
    bool _1238 = !_1216;
    float _1240 = _1236;
    if (!_1238)
    {
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1246 = _1176 + _1244;
        float _1248 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = rsqrt(_1160);
        float _1252 = _1246 * _1242;
        float _1254 = _1252 * 0.15915493667125701904296875;
        float _1256 = _1254 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = _1254 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = fma(_1258, _1248, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1266 = _1250 * _1264;
        float _1268 = _1262 + (-1.0);
        float _1270 = fma(_1138, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1272 = fma(_1142, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1274 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1278 = _1270 + _1276;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1282 = _1272 + _1280;
        float _1284 = fma(_1218, _1262, _1274);
        float _1286 = _1278 * _1278;
        float _1288 = _1282 * _1282;
        _1240 = _1284;
        _1166 = _1286;
        _1168 = _1288;
        _1170 = _1270;
        _1172 = _1272;
    }
    float _1290 = _1240;
    float _1292 = _1166;
    float _1294 = _1168;
    float _1296 = _1170;
    float _1298 = _1172;
    float _1300 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _936);
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1304 = _1290 + _1302;
    float _1306 = in.m_55.z;
    float _1308 = -_122;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[76].x, _878);
    float _1312 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1156);
    float _1314 = fma(_1304, _1304, _1292);
    float _1316 = in.m_55.w;
    float _1318 = -_122;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1188);
    float _1322 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1162);
    float _1324 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1232);
    float _1326 = _1314 + _1294;
    float _1328 = fma(_1312, _1212, _1320);
    float _1330 = fma(_1300, _1226, _1310);
    float _1332 = -_1324;
    float _1334 = fma(_1322, _1072, _1332);
    float _1336 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1210);
    float _1338 = sqrt(_1326);
    float _1340 = _1230 + 0.5;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1350 = _1336 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1354 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1358 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1328 + 0.5;
    float _1370 = _1330 + 0.5;
    float _1372 = _1334 + 0.5;
    out.m_61.z = _1306;
    bool _1374 = _1338 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1376 = isnan(_1338);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1382 = _1378 || _1380;
    out.m_61.w = _1316;
    out.m_63.x = _1362;
    out.m_63.y = _1364;
    out.m_63.z = _1366;
    out.m_65.x = _1354;
    out.m_65.y = _1358;
    out.m_65.z = _1360;
    out.m_65.w = _1350;
    float _1384 = _1334;
    float _1386 = _1372;
    if (!_1382)
    {
        _126 = 1.0;
    }
    float _1388 = _126;
    out.m_67.x = _1370;
    out.m_67.y = _1340;
    out.m_67.z = _1368;
    out.m_67.w = _1372;
    bool _1390 = !_1382;
    float _1392 = _1388;
    if (!_1390)
    {
        bool _1394 = _1338 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1396 = isnan(_1338);
        bool _1398 = _1394 || _1396;
        bool _1400 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1402 = _1398 || _1400;
        if (!_1402)
        {
            float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1406 = _1338 + _1404;
            float _1408 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1410 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1408;
            float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1414 = _1412 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1416 = 1.0 / _1410;
            float _1418 = _1406 * _1416;
            float _1420 = fma(_1418, _1414, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1392 = _1420;
            _1422 = true;
        }
        else
        {
            bool _1424 = _1338 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1426 = isnan(_1338);
            bool _1428 = _1424 || _1426;
            bool _1430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1432 = _1428 || _1430;
            if (!_1432)
            {
                float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1436 = _1338 + _1434;
                float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1440 = _1438 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1444 = _1442 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1446 = 1.0 / _1440;
                float _1448 = _1436 * _1446;
                float _1450 = fma(_1448, _1444, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1392 = _1450;
                _1422 = true;
            }
            else
            {
                _1392 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1422 = false;
    float _1452 = _1392;
    float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1456 = _1290 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1460 = _1296 + _1458;
    float _1462 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1466 = _1298 + _1464;
    float _1468 = fma(_1460, _1452, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1472 = _1462 + _1470;
    float _1474 = fma(_1466, _1452, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1478 = _1468 + _1476;
    float _1480 = _1472 * _1472;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1484 = _1474 + _1482;
    float _1486 = fma(_1478, _1478, _1480);
    float _1488 = fma(_1484, _1484, _1486);
    float _1490 = rsqrt(_1488);
    float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1494 = _1478 * _1492;
    float _1496 = _1484 * _1492;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 * _1496;
    float _1502 = _1498 + _1500;
    float _1504 = sqrt(_1502);
    bool _1506 = _1504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1510 = _1504 + _1508;
    float _1512 = _1484;
    float _1514 = _1502;
    float _1516 = _1510;
    float _1518 = _1472;
    float _1520 = _1494;
    if (_1506)
    {
        float _1522 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1512 = _1522;
    }
    float _1524 = _1512;
    if (_1506)
    {
        float _1526 = rsqrt(_1502);
        _1514 = _1526;
    }
    float _1528 = _1514;
    if (_1506)
    {
        float _1530 = _1510 * _1524;
        _1516 = _1530;
    }
    float _1532 = _1516;
    if (_1506)
    {
        float _1534 = _1532 * 0.15915493667125701904296875;
        _1384 = _1534;
    }
    float _1536 = _1384;
    float _1538 = _1490;
    if (_1506)
    {
        float _1540 = _1536 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        _1538 = _1542;
    }
    float _1544 = _1538;
    float _1546 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1548 = precise::max(0.0, _1546);
    float _1550 = _1364;
    float _1552 = _1548;
    float _1554 = _1546;
    if (_1506)
    {
        float _1556 = _1536 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        _1550 = _1558;
    }
    float _1560 = _1550;
    float _1562 = -_1492;
    float _1564 = -_1548;
    float _1566 = fma(_1472, _1562, _1564);
    if (!_1506)
    {
        _1552 = _1496;
    }
    float _1568 = _1552;
    float _1570 = _1568;
    if (_1506)
    {
        float _1572 = _1566 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1554 = _1572;
    }
    float _1574 = _1554;
    float _1576 = _1544;
    float _1578 = _1574;
    if (_1506)
    {
        float _1580 = fma(_1544, _1574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1576 = _1580;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (_1506)
    {
        float _1586 = _1560 + (-1.0);
        _1578 = _1586;
    }
    float _1588 = _1578;
    float _1590 = _1588;
    if (_1506)
    {
        float _1592 = _1528 * _1582;
        _1386 = _1592;
    }
    float _1594 = _1386;
    if (!_1506)
    {
        _1584 = _1566;
    }
    float _1596 = _1584;
    float _1598 = sqrt(_1488);
    float _1600 = _1596;
    if (_1506)
    {
        float _1602 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1602;
    }
    float _1604 = _1518;
    float _1606 = _1604;
    if (_1506)
    {
        float _1608 = _1494 * _1594;
        _1520 = _1608;
    }
    float _1610 = _1520;
    if (!_1506)
    {
        _1590 = _1498;
    }
    float _1612 = _1590;
    float _1614 = _1612;
    if (_1506)
    {
        float _1616 = _1496 * _1594;
        _1570 = _1616;
    }
    float _1618 = _1570;
    if (_1506)
    {
        float _1620 = fma(_1566, _1560, _1604);
        _1600 = _1620;
    }
    float _1622 = _1600;
    if (_1506)
    {
        float _1624 = _1610 * _1610;
        _1614 = _1624;
    }
    float _1626 = _1614;
    if (!_1506)
    {
        _1606 = _1500;
    }
    float _1628 = _1606;
    float _1630 = _1628;
    if (_1506)
    {
        float _1632 = _1618 * _1618;
        _1630 = _1632;
    }
    float _1634 = _1630;
    float _1636 = fma(_1622, _1622, _1626);
    float _1638 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1640 = _1636 + _1634;
    float _1642 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1638);
    float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1646 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1644);
    float _1648 = precise::clamp(_1646, 0.0, 1.0);
    float _1650 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1652 = rsqrt(_1640);
    float _1654 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1642);
    float _1656 = -_1648;
    float _1658 = _1656 + 1.0;
    float _1660 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1662 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1650);
    float _1664 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1666 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1668 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1660);
    float _1670 = abs(_1658);
    float _1672 = log2(_1670);
    float _1674 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1662);
    float _1676 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1666);
    float _1678 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1668);
    float _1680 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1682 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1684 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1676);
    float _1686 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1688 = _1652 * _1610;
    float _1690 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1692 = _1652 * _1622;
    float _1694 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1696 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1698 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1690);
    float _1700 = _1652 * _1618;
    float _1702 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1704 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1706 = -_1696;
    float _1708 = fma(_1692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1706);
    float _1710 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1698);
    float _1712 = -_1694;
    float _1714 = fma(_1712, _1680, 1.0);
    float _1716 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = -_1700;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1708);
    float _1722 = exp2(_1704);
    float _1724 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1710);
    float _1726 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1728 = fma(_1720, -0.5, 0.5);
    float _1730 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1732 = fma(_1720, 0.5, 0.5);
    float _1734 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1726);
    float _1736 = _1692 + 1.0;
    float _1738 = log2(_1714);
    float _1740 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1730);
    float _1742 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1744 = fma(_1732, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1746 = fma(_1732, _1744, -0.212114393711090087890625);
    float _1748 = 1.0 / _1724;
    float _1750 = -_1692;
    float _1752 = fma(_1722, _1736, _1750);
    float _1754 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1756 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1740);
    float _1758 = fma(_1732, _1746, 1.570728778839111328125);
    float _1760 = fma(_1752, 0.5, 0.5);
    float _1762 = sqrt(_1728);
    float _1764 = _1738 * 0.693147182464599609375;
    float _1766 = _1754 * _1748;
    float _1768 = _1756 * _1748;
    float _1770 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1772 = fma(_1766, 0.5, 0.5);
    float _1774 = fma(_1768, -0.5, 0.5);
    float _1776 = _1762 * 0.636619746685028076171875;
    float3 _4706 = float3(_1772, _1774, _1770);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4706, float3(0.0), isnan(_4706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4706, float3(0.0), isnan(_4706)), level(0.0)).x;
    float3 _4717 = float3(_1772, _1774, _1770);
    float4 _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4717, float3(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4717, float3(0.0), isnan(_4717)), level(0.0)).xyzw;
    float _1783 = _1781.x;
    float _1785 = _1781.y;
    float _1787 = _1781.z;
    float _1789 = _1781.w;
    float _1791 = -_1758;
    float _1793 = fma(_1776, _1791, 1.0);
    float2 _4739 = float2(_1793, _1760);
    float3 _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4739, float2(0.0), isnan(_4739)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4739, float2(0.0), isnan(_4739)), level(0.0)).xyz;
    float _1799 = _1797.x;
    float _1801 = _1797.y;
    float _1803 = _1797.z;
    float _1805 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1807 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1809 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1807);
    float _1811 = exp2(_1805);
    float _1813 = _1724 * 0.5;
    float _1815 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1809);
    float _1817 = fma(_1756, -0.5, _1813);
    float _1819 = _1754 + _1724;
    float _1821 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1815);
    float _1823 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1825 = _1819 * 0.5;
    float _1827 = _1821 + _1724;
    out.gl_Position.x = _1754;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _1821;
    out.gl_Position.w = _1724;
    float _1829 = _1827 * 0.5;
    float _1831 = -_1811;
    float _1833 = _1831 + 1.0;
    out.m_47.x = _1823;
    float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _1825;
    out.m_69.y = _1817;
    out.m_69.z = _1829;
    out.m_69.w = _1724;
    float _1837 = -_1835;
    float _1839 = _1837 + 1.0;
    float _1841 = _1835 * _1778;
    float _1843 = _1789 * _1841;
    float _1845 = _1803 * _1841;
    float _1847 = fma(_1799, _1843, _1783);
    float _1849 = fma(_1801, _1843, _1785);
    float _1851 = _1789 * _1839;
    float _1853 = fma(_1789, _1845, _1787);
    out.m_71.x = _1847;
    out.m_71.y = _1849;
    out.m_71.z = _1853;
    out.m_71.w = _1851;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

