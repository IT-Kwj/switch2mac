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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_55 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1707 = false;
    bool _841 = false;
    bool _624 = false;
    bool _462 = false;
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
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2289 = as_type<float>(_106);
        out.gl_Position.z = _2289;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _144 = _140 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2360 = as_type<float>(_146);
        out.gl_Position.z = _2360;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = 0.0;
    float _168 = _154;
    if (!_164)
    {
        float _170 = _154 * _154;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = 0.0;
    float _178 = _174;
    if (!_164)
    {
        float _180 = _124 * _124;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    if (!_164)
    {
        float _186 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _186;
    }
    float _188 = _178;
    bool _190 = !_164;
    float _192 = _188;
    float _194 = 0.0;
    if (!_190)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _154 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _154);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _224;
        _194 = _212;
        _142 = _214;
    }
    float _226 = _192;
    float _228 = _194;
    float _230 = _142;
    bool _232 = !_164;
    float _234 = _230;
    float _236 = _228;
    if (!_232)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _154 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _234 = _244;
        _168 = _256;
    }
    float _258 = _234;
    float _260 = _168;
    float _262 = _258;
    if (!_164)
    {
        _262 = _124;
    }
    float _264 = _262;
    float _266 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_164)
    {
        float _270 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _270;
    }
    float _272 = _236;
    bool _274 = !_164;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _124 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _124);
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
        float _322 = _124 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _336 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _338 = fma(_260, _150, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _150, _334);
    float _344 = fma(_260, _148, _336);
    float _346 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _148, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_332, _152, _346);
    float _358 = fma(_260, _152, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_356;
    float _370 = _358 + _368;
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
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_358, _366, _390);
    float _418 = _398;
    float _420 = _394;
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
    float _590 = in.m_53.x;
    float _592 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _596 = _592 * _590;
    float _598 = trunc(_596);
    int _600 = int(_598);
    int _602 = _600 << 4;
    int _604 = _602 + 1712;
    bool _606 = !_594;
    float _622;
    if (!_606)
    {
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _610 = _590 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_90);
        float _628 = 1.0 / _626;
        float _630 = _124 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    uint _635 = uint(int(uint(_604) >> uint(2)));
    uint _637 = uint(int(uint(int(_635)) >> uint(2)));
    int _639 = int(_635) & 3;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[int(_637)][_639];
    int _643 = int(_635) + 1;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    int _647 = _643 & 3;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[int(_645)][_647];
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _659 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _661 = isnan(_632);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    int _671 = _604 + 8;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    uint _675 = uint(int(uint(int(_673)) >> uint(2)));
    int _677 = int(_673) & 3;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[int(_675)][_677];
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _685 = 1.0 / _653;
    bool _687 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _689 = isnan(_632);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _699;
    float _703 = -_669;
    float _705 = _703 + 1.0;
    bool _707 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _709 = isnan(_632);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _725 = _632 + _723;
    float _727 = _697 * _705;
    float _729 = 1.0 / _657;
    float _731 = -_697;
    float _733 = _731 + 1.0;
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _737 = _717 * _733;
    float _739 = -_717;
    float _741 = _739 + 1.0;
    float _743 = 1.0 / _683;
    float _745 = _701 * _685;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _749 = _632 + _747;
    float _751 = fma(_745, _749, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _753;
    bool _757 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _759 = isnan(_632);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _721 * _729;
    float _771 = _751 * _737;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _775 = _632 + _773;
    float _777 = fma(_769, _725, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _779 = -_767;
    float _781 = _779 + 1.0;
    float _783 = _755 * _743;
    float _785 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[115].x, _771);
    float _787 = _669 * _781;
    float _789 = fma(_783, _775, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _791 = fma(_777, _727, _785);
    float _793 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _795 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _797 = fma(_789, _787, _791);
    float _799 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _801 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[118].x, _797);
    float _807 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _809 = _799 * _590;
    float _811 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _813 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = trunc(_809);
    int _817 = int(_815);
    out.m_55.x = _801;
    out.m_55.y = _803;
    out.m_55.z = _813;
    out.m_55.w = _811;
    int _819 = _817 << 4;
    int _821 = _819 + 1968;
    bool _823 = !_735;
    float _839;
    if (!_823)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _827 = _590 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _831 = _829 * _825;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _837;
        _841 = true;
    }
    else
    {
        float _843 = float(_90);
        float _845 = 1.0 / _843;
        float _847 = _124 * _845;
        _839 = _847;
    }
    _841 = false;
    float _849 = _839;
    float _851 = in.m_53.w;
    float _853 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _855 = in.m_51.x;
    float _857 = in.m_51.y;
    float _859 = in.m_51.z;
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _863 = _861 != 0;
    float _865 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _869 = _867 != 0;
    float _871 = in.m_57.x;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _875 = _873 != 0;
    float _877 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _881 = _879 != 0;
    float _883 = in.m_59.x;
    float _885 = in.m_59.y;
    float _887 = in.m_59.z;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _891 = _889 != 0;
    float _893 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _865);
    float _895 = in.m_53.y;
    float _897 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _853);
    float _899 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _877);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _905 = in.m_61.y;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _909 = _851 > 0.5;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _913 = _857 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _915 = _859 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _917 = _855 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_63.x = _871;
    float _923 = 1.0 / _903;
    float _925 = _917 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _883);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _887);
    float _931 = _590 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _933 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _885);
    float _935 = 1.0 / _921;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _941 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _945 = 0.0;
    bool _947 = _909;
    float _949 = _905;
    if (!_863)
    {
        float _951 = in.m_53.z;
        _945 = _951;
    }
    float _953 = _945;
    float _955 = _907 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _957 = fma(_941, -2.0, _911);
    float _959 = -_943;
    float _961 = fma(_931, 2.0, _959);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _967 = 1.0 / _939;
    float _969 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _897);
    float _971 = 0.0;
    float _973 = _953;
    if (_875)
    {
        float _975 = in.m_53.z;
        _971 = _975;
    }
    float _977 = _971;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _983 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _893);
    float _985 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _899);
    float _987 = 1.0 / _965;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _995 = _991 * _923;
    float _997 = _969 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _999 = -_905;
    float _1001 = _999 + 1.0;
    float _1003 = 1.0 / _981;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1013 = _1007 * _935;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1015;
    float _1019 = _1011 * _967;
    float _1021 = _983 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1023 = _1017 * _987;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _997 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _1029;
    float _1033 = _985 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1037 = _1021 + _1035;
    float _1039 = _1031 * _1003;
    float _1041 = _1027 * _1027;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1045 = _1033 + _1043;
    int _1047 = _909 ? as_type<int>(_1001) : as_type<int>(_905);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1051 = fma(_1037, _1037, _1041);
    float _1053 = _1041;
    float _1055 = _1027;
    if (!_863)
    {
        _1053 = _895;
    }
    float _1057 = _1053;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1061 = _849 + _1059;
    float _1063 = _1057;
    if (_869)
    {
        bool _1065 = _590 > 0.5;
        _947 = _1065;
    }
    bool _1067 = _947;
    float _1069 = fma(_1045, _1045, _1051);
    float _1071 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1049);
    if (_863)
    {
        _1063 = _590;
    }
    float _1073 = _1063;
    float _1075 = _584 * _584;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1079 = _849 + _1077;
    float _1081 = fma(_1013, _1061, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1083 = rsqrt(_1069);
    float _1085 = fma(_586, _586, _1075);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1089 = _849 + _1087;
    float _1091 = fma(_1023, _1079, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1093 = _925 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1095 = fma(_588, _588, _1085);
    float _1097 = fma(_995, _1089, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1101 = _849 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1105 = _849 + _1103;
    float _1107 = rsqrt(_1095);
    float _1109 = _881 ? as_type<float>(_1047) : _905;
    float _1111 = fma(_1019, _1101, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1113 = fma(_1039, _1105, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    bool _1115 = _895 > 0.5;
    float _1117 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1071);
    bool _1119 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1121 = isnan(_849);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = _1093 * _1083;
    if (_891)
    {
        float _1133 = _1115 ? _1001 : _905;
        _949 = _1133;
    }
    float _1135 = _949;
    bool _1137 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _1139 = isnan(_849);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = _1027 * _1131;
    float _1151 = _1037 * _1131;
    bool _1153 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1155 = isnan(_849);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = -_1129;
    float _1167 = _1165 + 1.0;
    float _1169 = -_1149;
    float _1171 = _1027 + _1169;
    float _1173 = -_1151;
    float _1175 = _1037 + _1173;
    float _1177 = _1107 * _588;
    float _1179 = _1107 * _586;
    float _1181 = _1171 * _1171;
    float _1183 = _1107 * _584;
    float _1185 = _1045 * _1131;
    float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1189 = _1179 * _1187;
    float _1191 = fma(_1175, _1175, _1181);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1195 = _1177 * _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1199 = _1183 * _1197;
    float _1201 = -_1185;
    float _1203 = _1045 + _1201;
    bool _1205 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1207 = isnan(_849);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1219 = -_1195;
    float _1221 = fma(_1179, _1217, _1219);
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1225 = -_1199;
    float _1227 = fma(_1177, _1223, _1225);
    float _1229 = fma(_1203, _1203, _1191);
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1233 = -_1189;
    float _1235 = fma(_1183, _1231, _1233);
    float _1237 = _1221 * _1221;
    float _1239 = -_1147;
    float _1241 = _1239 + 1.0;
    float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1245 = false;
    float _1247 = _1185;
    if (_875)
    {
        bool _1249 = _977 > 0.5;
        _1245 = _1249;
    }
    bool _1251 = _1245;
    float _1253 = fma(_1227, _1227, _1237);
    float _1255 = _1215 * _1241;
    float _1257 = -_1215;
    float _1259 = _1257 + 1.0;
    float _1261 = in.m_61.x;
    float _1263 = fma(_1235, _1235, _1253);
    float _1265 = sqrt(_1229);
    float _1267 = _1129 * _1259;
    bool _1269 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1271 = isnan(_849);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1163 * _1167;
    bool _1283 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1285 = isnan(_849);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1291 = _1287 || _1289;
    float _1293 = float(_1291);
    float _1295 = -_1163;
    float _1297 = _1295 + 1.0;
    float _1299 = -_1279;
    float _1301 = _1299 + 1.0;
    float _1303 = rsqrt(_1263);
    float _1305 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1307 = _1279 * _1297;
    float _1309 = _1293 * _1301;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1313 = _1279;
    if (!_863)
    {
        _1313 = _953;
    }
    float _1315 = _1313;
    float _1317 = fma(_1305, _1135, -0.5);
    float _1319 = _1081 * _1309;
    float _1321 = _1083 * _1265;
    float _1323 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1325 = _915 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1327 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1311);
    float _1329 = _1315;
    if (_863)
    {
        _1329 = _895;
    }
    float _1331 = _1329;
    float _1333 = _1323 * _1321;
    int _1335 = as_type<int>(_1333);
    if (_863)
    {
        _973 = _895;
    }
    float _1337 = _973;
    float _1339 = fma(_1109, _955, -0.5);
    float _1341 = _1221 * _1303;
    float _1343 = _925 * _1321;
    float _1345 = _1235 * _1303;
    float _1347 = _1333 * _933;
    float _1349 = _1227 * _1303;
    float _1351 = _1343 * _927;
    float _1353 = _1325 * _1321;
    float _1355 = _1183 * _1345;
    float _1357 = _1347 * _1179;
    float _1359 = _1179 * _1341;
    float _1361 = _1347 * _1177;
    float _1363 = _1353 * _929;
    float _1365 = -_1355;
    float _1367 = fma(_1177, _1341, _1365);
    float _1369 = fma(_1351, _1349, _1357);
    float _1371 = -_1359;
    float _1373 = fma(_1183, _1349, _1371);
    float _1375 = fma(_1351, _1345, _1361);
    float _1377 = fma(_1363, _1367, _1369);
    float _1379 = fma(_1363, _1373, _1375);
    float _1381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1383 = _1021 + _1377;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1389 = _1033 + _1379;
    float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1393 = _1383 + _1391;
    float _1395 = _1261;
    float _1397 = _1383;
    float _1399 = _1389;
    if (_869)
    {
        float _1401 = -_1261;
        float _1403 = _1401 + 1.0;
        _1335 = as_type<int>(_1403);
    }
    int _1405 = _1335;
    float _1407 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1387);
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1411 = _1389 + _1409;
    float _1413 = _1393 * _1393;
    float _1415 = _1413;
    if (!_869)
    {
        _1055 = _1261;
    }
    float _1417 = _1055;
    float _1419 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1327);
    float _1421 = _1411 * _1411;
    float _1423 = _1417;
    float _1425 = _1421;
    if (_869)
    {
        float _1427 = _1067 ? as_type<float>(_1405) : _1261;
        _1423 = _1427;
    }
    float _1429 = _1423;
    float _1431 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _957);
    float _1433 = _1413 + _1421;
    float _1435 = -_1293;
    float _1437 = _1435 + 1.0;
    float _1439 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1441 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1385);
    float _1443 = sqrt(_1433);
    float _1445 = -_1431;
    float _1447 = fma(_1419, _1317, _1445);
    float _1449 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1451 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1319);
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1455 = fma(_1439, -2.0, _993);
    float _1457 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1459 = _1177 * _1349;
    float _1461 = -_1453;
    float _1463 = fma(_1449, 2.0, _1461);
    float _1465 = fma(_1097, _1307, _1451);
    int _1467 = _821 + 8;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[int(_1471)][_1473];
    int _1477 = 0;
    if (_875)
    {
        float _1479 = -_1261;
        float _1481 = _1479 + 1.0;
        _1477 = as_type<int>(_1481);
    }
    int _1483 = _1477;
    float _1485 = fma(_1457, _1429, -0.5);
    float _1487 = -_1459;
    float _1489 = fma(_1179, _1345, _1487);
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1493 = in.m_57.y;
    float _1495 = _1347 * _1183;
    if (_875)
    {
        float _1497 = _1251 ? as_type<float>(_1483) : _1261;
        _1395 = _1497;
    }
    float _1499 = _1395;
    uint _1501 = uint(int(uint(_821) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[int(_1511)][_1513];
    float _1517 = in.m_57.z;
    bool _1519 = _1443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1521 = fma(_1351, _1341, _1495);
    float _1523 = fma(_1091, _1281, _1465);
    float _1525 = -_124;
    float _1527 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[76].x, _961);
    float _1529 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1441);
    float _1531 = fma(_1363, _1489, _1521);
    float _1533 = in.m_57.w;
    float _1535 = -_124;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1463);
    float _1539 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1407);
    float _1541 = _997 + _1531;
    float _1543 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1545 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1455);
    float _1547 = fma(_1111, _1267, _1523);
    float _1549 = fma(_1543, _1499, -0.5);
    if (!_1519)
    {
        _126 = _1541;
    }
    float _1551 = _126;
    bool _1553 = !_1519;
    float _1555 = _1551;
    if (!_1553)
    {
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1561 = _1443 + _1559;
        float _1563 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1565 = rsqrt(_1433);
        float _1567 = _1561 * _1557;
        float _1569 = _1567 * 0.15915493667125701904296875;
        float _1571 = _1569 * 6.283185482025146484375;
        float _1573 = sin(_1571);
        float _1575 = _1569 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = fma(_1573, _1563, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1581 = _1565 * _1579;
        float _1583 = _1577 + (-1.0);
        float _1585 = fma(_1393, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1587 = fma(_1411, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1589 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1593 = _1585 + _1591;
        float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1597 = _1587 + _1595;
        float _1599 = fma(_1541, _1577, _1589);
        float _1601 = _1593 * _1593;
        float _1603 = _1597 * _1597;
        _1555 = _1599;
        _1415 = _1601;
        _1425 = _1603;
        _1397 = _1585;
        _1399 = _1587;
    }
    float _1605 = _1555;
    float _1607 = _1415;
    float _1609 = _1425;
    float _1611 = _1397;
    float _1613 = _1399;
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1617 = _1605 + _1615;
    float _1619 = fma(_1113, _1255, _1547);
    float _1621 = fma(_1117, _1485, _1527);
    float _1623 = fma(_1529, _1549, _1537);
    float _1625 = fma(_1617, _1617, _1607);
    float _1627 = -_1545;
    float _1629 = fma(_1539, _1339, _1627);
    float _1631 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[136].x, _1619);
    float _1633 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1635 = _1625 + _1609;
    float _1637 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1641 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1447 + 0.5;
    float _1645 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1647 = sqrt(_1635);
    float _1649 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1621 + 0.5;
    float _1653 = _1623 + 0.5;
    float _1655 = _1629 + 0.5;
    float _1657 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.y = _1493;
    out.m_63.z = _1517;
    out.m_63.w = _1533;
    bool _1659 = _1647 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1661 = isnan(_1647);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1667 = _1663 || _1665;
    out.m_65.x = _1651;
    out.m_65.y = _1643;
    out.m_65.z = _1653;
    out.m_65.w = _1655;
    out.m_67.x = _1641;
    out.m_67.y = _1645;
    out.m_67.z = _1649;
    out.m_67.w = _1657;
    float _1669 = _1633;
    float _1671 = _1643;
    if (!_1667)
    {
        _1669 = 1.0;
    }
    float _1673 = _1669;
    bool _1675 = !_1667;
    float _1677 = _1673;
    if (!_1675)
    {
        bool _1679 = _1647 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1681 = isnan(_1647);
        bool _1683 = _1679 || _1681;
        bool _1685 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1687 = _1683 || _1685;
        if (!_1687)
        {
            float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1691 = _1647 + _1689;
            float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1695 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1693;
            float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1699 = _1697 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1701 = 1.0 / _1695;
            float _1703 = _1691 * _1701;
            float _1705 = fma(_1703, _1699, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1677 = _1705;
            _1707 = true;
        }
        else
        {
            bool _1709 = _1647 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1711 = isnan(_1647);
            bool _1713 = _1709 || _1711;
            bool _1715 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1717 = _1713 || _1715;
            if (!_1717)
            {
                float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1721 = _1647 + _1719;
                float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1725 = _1723 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1727 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1729 = _1727 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1731 = 1.0 / _1725;
                float _1733 = _1721 * _1731;
                float _1735 = fma(_1733, _1729, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1677 = _1735;
                _1707 = true;
            }
            else
            {
                _1677 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1707 = false;
    float _1737 = _1677;
    float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1741 = _1611 + _1739;
    float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1745 = _1613 + _1743;
    bool _1747 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1759 = _1605 + _1757;
    float _1761 = fma(_1741, _1737, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1763 = fma(_1745, _1737, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1765 = fma(_1759, _1737, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1767 = -_1151;
    float _1769 = _1767 + _1761;
    float _1771 = -_1185;
    float _1773 = _1771 + _1763;
    float _1775 = -_1149;
    float _1777 = _1775 + _1765;
    float _1779 = _1777;
    float _1781 = _1769;
    float _1783 = _1773;
    if (!_1755)
    {
        float _1785 = -_1149;
        float _1787 = _997 + _1785;
        float _1789 = -_1151;
        float _1791 = _1021 + _1789;
        float _1793 = -_1185;
        float _1795 = _1033 + _1793;
        float _1797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1801 = _1787 + _1799;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1805 = _1791 + _1803;
        float _1807 = -_1033;
        float _1809 = _1807 + _1763;
        float _1811 = -_1021;
        float _1813 = _1811 + _1761;
        float _1815 = _1801 * _1801;
        float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1819 = _1795 + _1817;
        float _1821 = -_997;
        float _1823 = _1821 + _1765;
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = fma(_1805, _1805, _1815);
        float _1829 = fma(_1819, _1819, _1827);
        float _1831 = 1.0 / _1321;
        float _1833 = sqrt(_1829);
        float _1835 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1839 = _1837 * _1797;
        float _1841 = _1839 * _1831;
        float _1843 = _1835 * _1841;
        float _1845 = _1809 * _1841;
        float _1847 = fma(_1813, _1843, _1791);
        float _1849 = fma(_1823, _1843, _1787);
        float _1851 = fma(_1835, _1845, _1795);
        _1779 = _1849;
        _1781 = _1847;
        _1783 = _1851;
        _1247 = _1795;
    }
    float _1853 = _1779;
    float _1855 = _1781;
    float _1857 = _1783;
    float _1859 = _1247;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1863 = _1853 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1867 = _1855 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1871 = _1857 + _1869;
    float _1873 = _1863 * _1863;
    float _1875 = fma(_1867, _1867, _1873);
    float _1877 = fma(_1871, _1871, _1875);
    float _1879 = rsqrt(_1877);
    float _1881 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1883 = _1867 * _1881;
    float _1885 = _1871 * _1881;
    float _1887 = _1883 * _1883;
    float _1889 = _1885 * _1885;
    float _1891 = _1887 + _1889;
    float _1893 = sqrt(_1891);
    bool _1895 = _1893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = _1893 + _1897;
    float _1901 = _1879;
    float _1903 = _1891;
    float _1905 = _1899;
    float _1907 = _1859;
    float _1909 = _1863;
    float _1911 = _1883;
    if (_1895)
    {
        float _1913 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1901 = _1913;
    }
    float _1915 = _1901;
    if (_1895)
    {
        float _1917 = rsqrt(_1891);
        _1903 = _1917;
    }
    float _1919 = _1903;
    if (_1895)
    {
        float _1921 = _1899 * _1915;
        _1905 = _1921;
    }
    float _1923 = _1905;
    if (_1895)
    {
        float _1925 = _1923 * 0.15915493667125701904296875;
        _1907 = _1925;
    }
    float _1927 = _1907;
    float _1929 = _1915;
    if (_1895)
    {
        float _1931 = _1927 * 6.283185482025146484375;
        float _1933 = sin(_1931);
        _1929 = _1933;
    }
    float _1935 = _1929;
    float _1937 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1939 = precise::max(0.0, _1937);
    float _1941 = _1871;
    float _1943 = _1939;
    if (_1895)
    {
        float _1945 = _1927 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        _1941 = _1947;
    }
    float _1949 = _1941;
    float _1951 = -_1881;
    float _1953 = -_1939;
    float _1955 = fma(_1863, _1951, _1953);
    float _1957 = _1955;
    if (_1895)
    {
        float _1959 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1943 = _1959;
    }
    float _1961 = _1943;
    float _1963 = _1935;
    float _1965 = _1961;
    if (_1895)
    {
        float _1967 = fma(_1935, _1961, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1963 = _1967;
    }
    float _1969 = _1963;
    float _1971 = _1969;
    if (_1895)
    {
        float _1973 = _1949 + (-1.0);
        _1965 = _1973;
    }
    float _1975 = _1965;
    float _1977 = _1975;
    if (_1895)
    {
        float _1979 = _1919 * _1969;
        _1671 = _1979;
    }
    float _1981 = _1671;
    if (!_1895)
    {
        _1971 = _1885;
    }
    float _1983 = _1971;
    float _1985 = sqrt(_1877);
    float _1987 = _1983;
    if (_1895)
    {
        float _1989 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1909 = _1989;
    }
    float _1991 = _1909;
    float _1993 = _1991;
    if (_1895)
    {
        float _1995 = _1883 * _1981;
        _1911 = _1995;
    }
    float _1997 = _1911;
    if (!_1895)
    {
        _1977 = _1887;
    }
    float _1999 = _1977;
    float _2001 = _1999;
    if (_1895)
    {
        float _2003 = _1885 * _1981;
        _1987 = _2003;
    }
    float _2005 = _1987;
    if (_1895)
    {
        float _2007 = fma(_1955, _1949, _1991);
        _1957 = _2007;
    }
    float _2009 = _1957;
    if (_1895)
    {
        float _2011 = _1997 * _1997;
        _2001 = _2011;
    }
    float _2013 = _2001;
    if (!_1895)
    {
        _1993 = _1889;
    }
    float _2015 = _1993;
    float _2017 = _2015;
    if (_1895)
    {
        float _2019 = _2005 * _2005;
        _2017 = _2019;
    }
    float _2021 = _2017;
    float _2023 = fma(_2009, _2009, _2013);
    float _2025 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2027 = _2023 + _2021;
    float _2029 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2033 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2031);
    float _2035 = precise::clamp(_2033, 0.0, 1.0);
    float _2037 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2039 = rsqrt(_2027);
    float _2041 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2029);
    float _2043 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2045 = -_2035;
    float _2047 = _2045 + 1.0;
    float _2049 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2037);
    float _2051 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2041);
    float _2053 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2043);
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2057 = abs(_2047);
    float _2059 = log2(_2057);
    float _2061 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2063 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2053);
    float _2065 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2025);
    float _2067 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2049);
    float _2069 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2071 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2073 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2065);
    float _2075 = _2039 * _1997;
    float _2077 = -_2069;
    float _2079 = fma(_2077, _2055, 1.0);
    float _2081 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2083 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2085 = _2039 * _2009;
    float _2087 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2089 = _2039 * _2005;
    float _2091 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2083);
    float _2093 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2095 = -_2087;
    float _2097 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2095);
    float _2099 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2101 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2091);
    float _2103 = exp2(_2093);
    float _2105 = -_2089;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2097);
    float _2109 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2101);
    float _2113 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2115 = fma(_2107, -0.5, 0.5);
    float _2117 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2119 = log2(_2079);
    float _2121 = fma(_2107, 0.5, 0.5);
    float _2123 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2113);
    float _2125 = _2085 + 1.0;
    float _2127 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2117);
    float _2129 = fma(_2121, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2131 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2123);
    float _2133 = 1.0 / _2111;
    float _2135 = -_2085;
    float _2137 = fma(_2103, _2125, _2135);
    float _2139 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2127);
    float _2141 = fma(_2121, _2129, -0.212114393711090087890625);
    float _2143 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2145 = fma(_2137, 0.5, 0.5);
    float _2147 = fma(_2121, _2141, 1.570728778839111328125);
    float _2149 = sqrt(_2115);
    float _2151 = _2119 * 0.693147182464599609375;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _2139 * _2133;
    float _2157 = _2143 * _2133;
    float _2159 = fma(_2155, 0.5, 0.5);
    float _2161 = fma(_2157, -0.5, 0.5);
    float _2163 = _2149 * 0.636619746685028076171875;
    float3 _5663 = float3(_2159, _2161, _2153);
    float _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5663, float3(0.0), isnan(_5663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5663, float3(0.0), isnan(_5663)), level(0.0)).x;
    float _2167 = -_2147;
    float _2169 = fma(_2163, _2167, 1.0);
    float3 _5679 = float3(_2159, _2161, _2153);
    float4 _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5679, float3(0.0), isnan(_5679)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5679, float3(0.0), isnan(_5679)), level(0.0)).xyzw;
    float _2174 = _2172.x;
    float _2176 = _2172.y;
    float _2178 = _2172.z;
    float _2180 = _2172.w;
    float2 _5696 = float2(_2169, _2145);
    float3 _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5696, float2(0.0), isnan(_5696)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5696, float2(0.0), isnan(_5696)), level(0.0)).xyz;
    float _2186 = _2184.x;
    float _2188 = _2184.y;
    float _2190 = _2184.z;
    float _2192 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2194 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2196 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2194);
    float _2198 = exp2(_2192);
    float _2200 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2196);
    float _2202 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2200);
    float _2204 = _2202 + _2111;
    out.gl_Position.x = _2139;
    out.gl_Position.y = _2143;
    out.gl_Position.z = _2202;
    out.gl_Position.w = _2111;
    float _2206 = _2204 * 0.5;
    float _2208 = -_2198;
    float _2210 = _2208 + 1.0;
    float _2212 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2214 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2206;
    out.m_69.w = _2111;
    out.m_47.x = _2212;
    float _2216 = _2214 * _2165;
    float _2218 = -_2214;
    float _2220 = _2218 + 1.0;
    float _2222 = _2180 * _2216;
    float _2224 = _2190 * _2216;
    float _2226 = fma(_2186, _2222, _2174);
    float _2228 = fma(_2188, _2222, _2176);
    float _2230 = _2180 * _2220;
    float _2232 = fma(_2180, _2224, _2178);
    out.m_71.x = _2226;
    out.m_71.y = _2228;
    out.m_71.z = _2232;
    out.m_71.w = _2230;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1707 = false;
    bool _841 = false;
    bool _624 = false;
    bool _462 = false;
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
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2289 = as_type<float>(_106);
        out.gl_Position.z = _2289;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _144 = _140 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2360 = as_type<float>(_146);
        out.gl_Position.z = _2360;
    }
    if (_136)
    {
        return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = 0.0;
    float _168 = _154;
    if (!_164)
    {
        float _170 = _154 * _154;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = 0.0;
    float _178 = _174;
    if (!_164)
    {
        float _180 = _124 * _124;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    if (!_164)
    {
        float _186 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _186;
    }
    float _188 = _178;
    bool _190 = !_164;
    float _192 = _188;
    float _194 = 0.0;
    if (!_190)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _154 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _154);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _224;
        _194 = _212;
        _142 = _214;
    }
    float _226 = _192;
    float _228 = _194;
    float _230 = _142;
    bool _232 = !_164;
    float _234 = _230;
    float _236 = _228;
    if (!_232)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _154 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _234 = _244;
        _168 = _256;
    }
    float _258 = _234;
    float _260 = _168;
    float _262 = _258;
    if (!_164)
    {
        _262 = _124;
    }
    float _264 = _262;
    float _266 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_164)
    {
        float _270 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _270;
    }
    float _272 = _236;
    bool _274 = !_164;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _124 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _124);
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
        float _322 = _124 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _336 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _338 = fma(_260, _150, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _150, _334);
    float _344 = fma(_260, _148, _336);
    float _346 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _148, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_332, _152, _346);
    float _358 = fma(_260, _152, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_356;
    float _370 = _358 + _368;
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
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_358, _366, _390);
    float _418 = _398;
    float _420 = _394;
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
    float _590 = in.m_53.x;
    float _592 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _596 = _592 * _590;
    float _598 = trunc(_596);
    int _600 = int(_598);
    int _602 = _600 << 4;
    int _604 = _602 + 1712;
    bool _606 = !_594;
    float _622;
    if (!_606)
    {
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _610 = _590 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_90);
        float _628 = 1.0 / _626;
        float _630 = _124 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    uint _635 = uint(int(uint(_604) >> uint(2)));
    uint _637 = uint(int(uint(int(_635)) >> uint(2)));
    int _639 = int(_635) & 3;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[int(_637)][_639];
    int _643 = int(_635) + 1;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    int _647 = _643 & 3;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[int(_645)][_647];
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _659 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _661 = isnan(_632);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    int _671 = _604 + 8;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    uint _675 = uint(int(uint(int(_673)) >> uint(2)));
    int _677 = int(_673) & 3;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[int(_675)][_677];
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _685 = 1.0 / _653;
    bool _687 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _689 = isnan(_632);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _699;
    float _703 = -_669;
    float _705 = _703 + 1.0;
    bool _707 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _709 = isnan(_632);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _725 = _632 + _723;
    float _727 = _697 * _705;
    float _729 = 1.0 / _657;
    float _731 = -_697;
    float _733 = _731 + 1.0;
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _737 = _717 * _733;
    float _739 = -_717;
    float _741 = _739 + 1.0;
    float _743 = 1.0 / _683;
    float _745 = _701 * _685;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _749 = _632 + _747;
    float _751 = fma(_745, _749, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _753;
    bool _757 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _759 = isnan(_632);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _721 * _729;
    float _771 = _751 * _737;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _775 = _632 + _773;
    float _777 = fma(_769, _725, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _779 = -_767;
    float _781 = _779 + 1.0;
    float _783 = _755 * _743;
    float _785 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[115].x, _771);
    float _787 = _669 * _781;
    float _789 = fma(_783, _775, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _791 = fma(_777, _727, _785);
    float _793 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _795 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _797 = fma(_789, _787, _791);
    float _799 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _801 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[118].x, _797);
    float _807 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _809 = _799 * _590;
    float _811 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _813 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = trunc(_809);
    int _817 = int(_815);
    out.m_55.x = _801;
    out.m_55.y = _803;
    out.m_55.z = _813;
    out.m_55.w = _811;
    int _819 = _817 << 4;
    int _821 = _819 + 1968;
    bool _823 = !_735;
    float _839;
    if (!_823)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _827 = _590 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _831 = _829 * _825;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _837;
        _841 = true;
    }
    else
    {
        float _843 = float(_90);
        float _845 = 1.0 / _843;
        float _847 = _124 * _845;
        _839 = _847;
    }
    _841 = false;
    float _849 = _839;
    float _851 = in.m_53.w;
    float _853 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _855 = in.m_51.x;
    float _857 = in.m_51.y;
    float _859 = in.m_51.z;
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _863 = _861 != 0;
    float _865 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _869 = _867 != 0;
    float _871 = in.m_57.x;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _875 = _873 != 0;
    float _877 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _881 = _879 != 0;
    float _883 = in.m_59.x;
    float _885 = in.m_59.y;
    float _887 = in.m_59.z;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _891 = _889 != 0;
    float _893 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _865);
    float _895 = in.m_53.y;
    float _897 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _853);
    float _899 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _877);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _905 = in.m_61.y;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _909 = _851 > 0.5;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _913 = _857 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _915 = _859 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _917 = _855 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_63.x = _871;
    float _923 = 1.0 / _903;
    float _925 = _917 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _883);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _887);
    float _931 = _590 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _933 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _885);
    float _935 = 1.0 / _921;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _941 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _945 = 0.0;
    bool _947 = _909;
    float _949 = _905;
    if (!_863)
    {
        float _951 = in.m_53.z;
        _945 = _951;
    }
    float _953 = _945;
    float _955 = _907 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _957 = fma(_941, -2.0, _911);
    float _959 = -_943;
    float _961 = fma(_931, 2.0, _959);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _967 = 1.0 / _939;
    float _969 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _897);
    float _971 = 0.0;
    float _973 = _953;
    if (_875)
    {
        float _975 = in.m_53.z;
        _971 = _975;
    }
    float _977 = _971;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _983 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _893);
    float _985 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _899);
    float _987 = 1.0 / _965;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _995 = _991 * _923;
    float _997 = _969 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _999 = -_905;
    float _1001 = _999 + 1.0;
    float _1003 = 1.0 / _981;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1013 = _1007 * _935;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1015;
    float _1019 = _1011 * _967;
    float _1021 = _983 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1023 = _1017 * _987;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _997 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _1029;
    float _1033 = _985 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1037 = _1021 + _1035;
    float _1039 = _1031 * _1003;
    float _1041 = _1027 * _1027;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1045 = _1033 + _1043;
    int _1047 = _909 ? as_type<int>(_1001) : as_type<int>(_905);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1051 = fma(_1037, _1037, _1041);
    float _1053 = _1041;
    float _1055 = _1027;
    if (!_863)
    {
        _1053 = _895;
    }
    float _1057 = _1053;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1061 = _849 + _1059;
    float _1063 = _1057;
    if (_869)
    {
        bool _1065 = _590 > 0.5;
        _947 = _1065;
    }
    bool _1067 = _947;
    float _1069 = fma(_1045, _1045, _1051);
    float _1071 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1049);
    if (_863)
    {
        _1063 = _590;
    }
    float _1073 = _1063;
    float _1075 = _584 * _584;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1079 = _849 + _1077;
    float _1081 = fma(_1013, _1061, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1083 = rsqrt(_1069);
    float _1085 = fma(_586, _586, _1075);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1089 = _849 + _1087;
    float _1091 = fma(_1023, _1079, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1093 = _925 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1095 = fma(_588, _588, _1085);
    float _1097 = fma(_995, _1089, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1101 = _849 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1105 = _849 + _1103;
    float _1107 = rsqrt(_1095);
    float _1109 = _881 ? as_type<float>(_1047) : _905;
    float _1111 = fma(_1019, _1101, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1113 = fma(_1039, _1105, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    bool _1115 = _895 > 0.5;
    float _1117 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1071);
    bool _1119 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1121 = isnan(_849);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = _1093 * _1083;
    if (_891)
    {
        float _1133 = _1115 ? _1001 : _905;
        _949 = _1133;
    }
    float _1135 = _949;
    bool _1137 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _1139 = isnan(_849);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = _1027 * _1131;
    float _1151 = _1037 * _1131;
    bool _1153 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1155 = isnan(_849);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = -_1129;
    float _1167 = _1165 + 1.0;
    float _1169 = -_1149;
    float _1171 = _1027 + _1169;
    float _1173 = -_1151;
    float _1175 = _1037 + _1173;
    float _1177 = _1107 * _588;
    float _1179 = _1107 * _586;
    float _1181 = _1171 * _1171;
    float _1183 = _1107 * _584;
    float _1185 = _1045 * _1131;
    float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1189 = _1179 * _1187;
    float _1191 = fma(_1175, _1175, _1181);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1195 = _1177 * _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1199 = _1183 * _1197;
    float _1201 = -_1185;
    float _1203 = _1045 + _1201;
    bool _1205 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1207 = isnan(_849);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1219 = -_1195;
    float _1221 = fma(_1179, _1217, _1219);
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1225 = -_1199;
    float _1227 = fma(_1177, _1223, _1225);
    float _1229 = fma(_1203, _1203, _1191);
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1233 = -_1189;
    float _1235 = fma(_1183, _1231, _1233);
    float _1237 = _1221 * _1221;
    float _1239 = -_1147;
    float _1241 = _1239 + 1.0;
    float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1245 = false;
    float _1247 = _1185;
    if (_875)
    {
        bool _1249 = _977 > 0.5;
        _1245 = _1249;
    }
    bool _1251 = _1245;
    float _1253 = fma(_1227, _1227, _1237);
    float _1255 = _1215 * _1241;
    float _1257 = -_1215;
    float _1259 = _1257 + 1.0;
    float _1261 = in.m_61.x;
    float _1263 = fma(_1235, _1235, _1253);
    float _1265 = sqrt(_1229);
    float _1267 = _1129 * _1259;
    bool _1269 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1271 = isnan(_849);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1163 * _1167;
    bool _1283 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1285 = isnan(_849);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1291 = _1287 || _1289;
    float _1293 = float(_1291);
    float _1295 = -_1163;
    float _1297 = _1295 + 1.0;
    float _1299 = -_1279;
    float _1301 = _1299 + 1.0;
    float _1303 = rsqrt(_1263);
    float _1305 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1307 = _1279 * _1297;
    float _1309 = _1293 * _1301;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1313 = _1279;
    if (!_863)
    {
        _1313 = _953;
    }
    float _1315 = _1313;
    float _1317 = fma(_1305, _1135, -0.5);
    float _1319 = _1081 * _1309;
    float _1321 = _1083 * _1265;
    float _1323 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1325 = _915 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1327 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1311);
    float _1329 = _1315;
    if (_863)
    {
        _1329 = _895;
    }
    float _1331 = _1329;
    float _1333 = _1323 * _1321;
    int _1335 = as_type<int>(_1333);
    if (_863)
    {
        _973 = _895;
    }
    float _1337 = _973;
    float _1339 = fma(_1109, _955, -0.5);
    float _1341 = _1221 * _1303;
    float _1343 = _925 * _1321;
    float _1345 = _1235 * _1303;
    float _1347 = _1333 * _933;
    float _1349 = _1227 * _1303;
    float _1351 = _1343 * _927;
    float _1353 = _1325 * _1321;
    float _1355 = _1183 * _1345;
    float _1357 = _1347 * _1179;
    float _1359 = _1179 * _1341;
    float _1361 = _1347 * _1177;
    float _1363 = _1353 * _929;
    float _1365 = -_1355;
    float _1367 = fma(_1177, _1341, _1365);
    float _1369 = fma(_1351, _1349, _1357);
    float _1371 = -_1359;
    float _1373 = fma(_1183, _1349, _1371);
    float _1375 = fma(_1351, _1345, _1361);
    float _1377 = fma(_1363, _1367, _1369);
    float _1379 = fma(_1363, _1373, _1375);
    float _1381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1383 = _1021 + _1377;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1389 = _1033 + _1379;
    float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1393 = _1383 + _1391;
    float _1395 = _1261;
    float _1397 = _1383;
    float _1399 = _1389;
    if (_869)
    {
        float _1401 = -_1261;
        float _1403 = _1401 + 1.0;
        _1335 = as_type<int>(_1403);
    }
    int _1405 = _1335;
    float _1407 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1387);
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1411 = _1389 + _1409;
    float _1413 = _1393 * _1393;
    float _1415 = _1413;
    if (!_869)
    {
        _1055 = _1261;
    }
    float _1417 = _1055;
    float _1419 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1327);
    float _1421 = _1411 * _1411;
    float _1423 = _1417;
    float _1425 = _1421;
    if (_869)
    {
        float _1427 = _1067 ? as_type<float>(_1405) : _1261;
        _1423 = _1427;
    }
    float _1429 = _1423;
    float _1431 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _957);
    float _1433 = _1413 + _1421;
    float _1435 = -_1293;
    float _1437 = _1435 + 1.0;
    float _1439 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1441 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1385);
    float _1443 = sqrt(_1433);
    float _1445 = -_1431;
    float _1447 = fma(_1419, _1317, _1445);
    float _1449 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1451 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1319);
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1455 = fma(_1439, -2.0, _993);
    float _1457 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1459 = _1177 * _1349;
    float _1461 = -_1453;
    float _1463 = fma(_1449, 2.0, _1461);
    float _1465 = fma(_1097, _1307, _1451);
    int _1467 = _821 + 8;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[int(_1471)][_1473];
    int _1477 = 0;
    if (_875)
    {
        float _1479 = -_1261;
        float _1481 = _1479 + 1.0;
        _1477 = as_type<int>(_1481);
    }
    int _1483 = _1477;
    float _1485 = fma(_1457, _1429, -0.5);
    float _1487 = -_1459;
    float _1489 = fma(_1179, _1345, _1487);
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1493 = in.m_57.y;
    float _1495 = _1347 * _1183;
    if (_875)
    {
        float _1497 = _1251 ? as_type<float>(_1483) : _1261;
        _1395 = _1497;
    }
    float _1499 = _1395;
    uint _1501 = uint(int(uint(_821) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[int(_1511)][_1513];
    float _1517 = in.m_57.z;
    bool _1519 = _1443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1521 = fma(_1351, _1341, _1495);
    float _1523 = fma(_1091, _1281, _1465);
    float _1525 = -_124;
    float _1527 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[76].x, _961);
    float _1529 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1441);
    float _1531 = fma(_1363, _1489, _1521);
    float _1533 = in.m_57.w;
    float _1535 = -_124;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1463);
    float _1539 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1407);
    float _1541 = _997 + _1531;
    float _1543 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1545 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1455);
    float _1547 = fma(_1111, _1267, _1523);
    float _1549 = fma(_1543, _1499, -0.5);
    if (!_1519)
    {
        _126 = _1541;
    }
    float _1551 = _126;
    bool _1553 = !_1519;
    float _1555 = _1551;
    if (!_1553)
    {
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1561 = _1443 + _1559;
        float _1563 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1565 = rsqrt(_1433);
        float _1567 = _1561 * _1557;
        float _1569 = _1567 * 0.15915493667125701904296875;
        float _1571 = _1569 * 6.283185482025146484375;
        float _1573 = sin(_1571);
        float _1575 = _1569 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = fma(_1573, _1563, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1581 = _1565 * _1579;
        float _1583 = _1577 + (-1.0);
        float _1585 = fma(_1393, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1587 = fma(_1411, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1589 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1593 = _1585 + _1591;
        float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1597 = _1587 + _1595;
        float _1599 = fma(_1541, _1577, _1589);
        float _1601 = _1593 * _1593;
        float _1603 = _1597 * _1597;
        _1555 = _1599;
        _1415 = _1601;
        _1425 = _1603;
        _1397 = _1585;
        _1399 = _1587;
    }
    float _1605 = _1555;
    float _1607 = _1415;
    float _1609 = _1425;
    float _1611 = _1397;
    float _1613 = _1399;
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1617 = _1605 + _1615;
    float _1619 = fma(_1113, _1255, _1547);
    float _1621 = fma(_1117, _1485, _1527);
    float _1623 = fma(_1529, _1549, _1537);
    float _1625 = fma(_1617, _1617, _1607);
    float _1627 = -_1545;
    float _1629 = fma(_1539, _1339, _1627);
    float _1631 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[136].x, _1619);
    float _1633 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1635 = _1625 + _1609;
    float _1637 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1641 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1447 + 0.5;
    float _1645 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1647 = sqrt(_1635);
    float _1649 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1621 + 0.5;
    float _1653 = _1623 + 0.5;
    float _1655 = _1629 + 0.5;
    float _1657 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.y = _1493;
    out.m_63.z = _1517;
    out.m_63.w = _1533;
    bool _1659 = _1647 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1661 = isnan(_1647);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1667 = _1663 || _1665;
    out.m_65.x = _1651;
    out.m_65.y = _1643;
    out.m_65.z = _1653;
    out.m_65.w = _1655;
    out.m_67.x = _1641;
    out.m_67.y = _1645;
    out.m_67.z = _1649;
    out.m_67.w = _1657;
    float _1669 = _1633;
    float _1671 = _1643;
    if (!_1667)
    {
        _1669 = 1.0;
    }
    float _1673 = _1669;
    bool _1675 = !_1667;
    float _1677 = _1673;
    if (!_1675)
    {
        bool _1679 = _1647 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1681 = isnan(_1647);
        bool _1683 = _1679 || _1681;
        bool _1685 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1687 = _1683 || _1685;
        if (!_1687)
        {
            float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1691 = _1647 + _1689;
            float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1695 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1693;
            float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1699 = _1697 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1701 = 1.0 / _1695;
            float _1703 = _1691 * _1701;
            float _1705 = fma(_1703, _1699, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1677 = _1705;
            _1707 = true;
        }
        else
        {
            bool _1709 = _1647 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1711 = isnan(_1647);
            bool _1713 = _1709 || _1711;
            bool _1715 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1717 = _1713 || _1715;
            if (!_1717)
            {
                float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1721 = _1647 + _1719;
                float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1725 = _1723 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1727 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1729 = _1727 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1731 = 1.0 / _1725;
                float _1733 = _1721 * _1731;
                float _1735 = fma(_1733, _1729, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1677 = _1735;
                _1707 = true;
            }
            else
            {
                _1677 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1707 = false;
    float _1737 = _1677;
    float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1741 = _1611 + _1739;
    float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1745 = _1613 + _1743;
    bool _1747 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1759 = _1605 + _1757;
    float _1761 = fma(_1741, _1737, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1763 = fma(_1745, _1737, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1765 = fma(_1759, _1737, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1767 = -_1151;
    float _1769 = _1767 + _1761;
    float _1771 = -_1185;
    float _1773 = _1771 + _1763;
    float _1775 = -_1149;
    float _1777 = _1775 + _1765;
    float _1779 = _1777;
    float _1781 = _1769;
    float _1783 = _1773;
    if (!_1755)
    {
        float _1785 = -_1149;
        float _1787 = _997 + _1785;
        float _1789 = -_1151;
        float _1791 = _1021 + _1789;
        float _1793 = -_1185;
        float _1795 = _1033 + _1793;
        float _1797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1801 = _1787 + _1799;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1805 = _1791 + _1803;
        float _1807 = -_1033;
        float _1809 = _1807 + _1763;
        float _1811 = -_1021;
        float _1813 = _1811 + _1761;
        float _1815 = _1801 * _1801;
        float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1819 = _1795 + _1817;
        float _1821 = -_997;
        float _1823 = _1821 + _1765;
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = fma(_1805, _1805, _1815);
        float _1829 = fma(_1819, _1819, _1827);
        float _1831 = 1.0 / _1321;
        float _1833 = sqrt(_1829);
        float _1835 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1839 = _1837 * _1797;
        float _1841 = _1839 * _1831;
        float _1843 = _1835 * _1841;
        float _1845 = _1809 * _1841;
        float _1847 = fma(_1813, _1843, _1791);
        float _1849 = fma(_1823, _1843, _1787);
        float _1851 = fma(_1835, _1845, _1795);
        _1779 = _1849;
        _1781 = _1847;
        _1783 = _1851;
        _1247 = _1795;
    }
    float _1853 = _1779;
    float _1855 = _1781;
    float _1857 = _1783;
    float _1859 = _1247;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1863 = _1853 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1867 = _1855 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1871 = _1857 + _1869;
    float _1873 = _1863 * _1863;
    float _1875 = fma(_1867, _1867, _1873);
    float _1877 = fma(_1871, _1871, _1875);
    float _1879 = rsqrt(_1877);
    float _1881 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1883 = _1867 * _1881;
    float _1885 = _1871 * _1881;
    float _1887 = _1883 * _1883;
    float _1889 = _1885 * _1885;
    float _1891 = _1887 + _1889;
    float _1893 = sqrt(_1891);
    bool _1895 = _1893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = _1893 + _1897;
    float _1901 = _1879;
    float _1903 = _1891;
    float _1905 = _1899;
    float _1907 = _1859;
    float _1909 = _1863;
    float _1911 = _1883;
    if (_1895)
    {
        float _1913 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1901 = _1913;
    }
    float _1915 = _1901;
    if (_1895)
    {
        float _1917 = rsqrt(_1891);
        _1903 = _1917;
    }
    float _1919 = _1903;
    if (_1895)
    {
        float _1921 = _1899 * _1915;
        _1905 = _1921;
    }
    float _1923 = _1905;
    if (_1895)
    {
        float _1925 = _1923 * 0.15915493667125701904296875;
        _1907 = _1925;
    }
    float _1927 = _1907;
    float _1929 = _1915;
    if (_1895)
    {
        float _1931 = _1927 * 6.283185482025146484375;
        float _1933 = sin(_1931);
        _1929 = _1933;
    }
    float _1935 = _1929;
    float _1937 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1939 = precise::max(0.0, _1937);
    float _1941 = _1871;
    float _1943 = _1939;
    if (_1895)
    {
        float _1945 = _1927 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        _1941 = _1947;
    }
    float _1949 = _1941;
    float _1951 = -_1881;
    float _1953 = -_1939;
    float _1955 = fma(_1863, _1951, _1953);
    float _1957 = _1955;
    if (_1895)
    {
        float _1959 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1943 = _1959;
    }
    float _1961 = _1943;
    float _1963 = _1935;
    float _1965 = _1961;
    if (_1895)
    {
        float _1967 = fma(_1935, _1961, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1963 = _1967;
    }
    float _1969 = _1963;
    float _1971 = _1969;
    if (_1895)
    {
        float _1973 = _1949 + (-1.0);
        _1965 = _1973;
    }
    float _1975 = _1965;
    float _1977 = _1975;
    if (_1895)
    {
        float _1979 = _1919 * _1969;
        _1671 = _1979;
    }
    float _1981 = _1671;
    if (!_1895)
    {
        _1971 = _1885;
    }
    float _1983 = _1971;
    float _1985 = sqrt(_1877);
    float _1987 = _1983;
    if (_1895)
    {
        float _1989 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1909 = _1989;
    }
    float _1991 = _1909;
    float _1993 = _1991;
    if (_1895)
    {
        float _1995 = _1883 * _1981;
        _1911 = _1995;
    }
    float _1997 = _1911;
    if (!_1895)
    {
        _1977 = _1887;
    }
    float _1999 = _1977;
    float _2001 = _1999;
    if (_1895)
    {
        float _2003 = _1885 * _1981;
        _1987 = _2003;
    }
    float _2005 = _1987;
    if (_1895)
    {
        float _2007 = fma(_1955, _1949, _1991);
        _1957 = _2007;
    }
    float _2009 = _1957;
    if (_1895)
    {
        float _2011 = _1997 * _1997;
        _2001 = _2011;
    }
    float _2013 = _2001;
    if (!_1895)
    {
        _1993 = _1889;
    }
    float _2015 = _1993;
    float _2017 = _2015;
    if (_1895)
    {
        float _2019 = _2005 * _2005;
        _2017 = _2019;
    }
    float _2021 = _2017;
    float _2023 = fma(_2009, _2009, _2013);
    float _2025 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2027 = _2023 + _2021;
    float _2029 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2033 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2031);
    float _2035 = precise::clamp(_2033, 0.0, 1.0);
    float _2037 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2039 = rsqrt(_2027);
    float _2041 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2029);
    float _2043 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2045 = -_2035;
    float _2047 = _2045 + 1.0;
    float _2049 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2037);
    float _2051 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2041);
    float _2053 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2043);
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2057 = abs(_2047);
    float _2059 = log2(_2057);
    float _2061 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2063 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2053);
    float _2065 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2025);
    float _2067 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2049);
    float _2069 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2071 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2073 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2065);
    float _2075 = _2039 * _1997;
    float _2077 = -_2069;
    float _2079 = fma(_2077, _2055, 1.0);
    float _2081 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2083 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2085 = _2039 * _2009;
    float _2087 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2089 = _2039 * _2005;
    float _2091 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2083);
    float _2093 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2095 = -_2087;
    float _2097 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2095);
    float _2099 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2101 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2091);
    float _2103 = exp2(_2093);
    float _2105 = -_2089;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2097);
    float _2109 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2101);
    float _2113 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2115 = fma(_2107, -0.5, 0.5);
    float _2117 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2119 = log2(_2079);
    float _2121 = fma(_2107, 0.5, 0.5);
    float _2123 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2113);
    float _2125 = _2085 + 1.0;
    float _2127 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2117);
    float _2129 = fma(_2121, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2131 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2123);
    float _2133 = 1.0 / _2111;
    float _2135 = -_2085;
    float _2137 = fma(_2103, _2125, _2135);
    float _2139 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2127);
    float _2141 = fma(_2121, _2129, -0.212114393711090087890625);
    float _2143 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2145 = fma(_2137, 0.5, 0.5);
    float _2147 = fma(_2121, _2141, 1.570728778839111328125);
    float _2149 = sqrt(_2115);
    float _2151 = _2119 * 0.693147182464599609375;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _2139 * _2133;
    float _2157 = _2143 * _2133;
    float _2159 = fma(_2155, 0.5, 0.5);
    float _2161 = fma(_2157, -0.5, 0.5);
    float _2163 = _2149 * 0.636619746685028076171875;
    float3 _5663 = float3(_2159, _2161, _2153);
    float _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5663, float3(0.0), isnan(_5663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5663, float3(0.0), isnan(_5663)), level(0.0)).x;
    float _2167 = -_2147;
    float _2169 = fma(_2163, _2167, 1.0);
    float3 _5679 = float3(_2159, _2161, _2153);
    float4 _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5679, float3(0.0), isnan(_5679)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5679, float3(0.0), isnan(_5679)), level(0.0)).xyzw;
    float _2174 = _2172.x;
    float _2176 = _2172.y;
    float _2178 = _2172.z;
    float _2180 = _2172.w;
    float2 _5696 = float2(_2169, _2145);
    float3 _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5696, float2(0.0), isnan(_5696)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5696, float2(0.0), isnan(_5696)), level(0.0)).xyz;
    float _2186 = _2184.x;
    float _2188 = _2184.y;
    float _2190 = _2184.z;
    float _2192 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2194 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2196 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2194);
    float _2198 = exp2(_2192);
    float _2200 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2196);
    float _2202 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2200);
    float _2204 = _2202 + _2111;
    out.gl_Position.x = _2139;
    out.gl_Position.y = _2143;
    out.gl_Position.z = _2202;
    out.gl_Position.w = _2111;
    float _2206 = _2204 * 0.5;
    float _2208 = -_2198;
    float _2210 = _2208 + 1.0;
    float _2212 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2214 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2206;
    out.m_69.w = _2111;
    out.m_47.x = _2212;
    float _2216 = _2214 * _2165;
    float _2218 = -_2214;
    float _2220 = _2218 + 1.0;
    float _2222 = _2180 * _2216;
    float _2224 = _2190 * _2216;
    float _2226 = fma(_2186, _2222, _2174);
    float _2228 = fma(_2188, _2222, _2176);
    float _2230 = _2180 * _2220;
    float _2232 = fma(_2180, _2224, _2178);
    out.m_71.x = _2226;
    out.m_71.y = _2228;
    out.m_71.z = _2232;
    out.m_71.w = _2230;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1707 = false;
    bool _841 = false;
    bool _624 = false;
    bool _462 = false;
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
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2289 = as_type<float>(_106);
        out.gl_Position.z = _2289;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _144 = _140 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2360 = as_type<float>(_146);
        out.gl_Position.z = _2360;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = 0.0;
    float _168 = _154;
    if (!_164)
    {
        float _170 = _154 * _154;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = 0.0;
    float _178 = _174;
    if (!_164)
    {
        float _180 = _124 * _124;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    if (!_164)
    {
        float _186 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _186;
    }
    float _188 = _178;
    bool _190 = !_164;
    float _192 = _188;
    float _194 = 0.0;
    if (!_190)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _154 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _154);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _224;
        _194 = _212;
        _142 = _214;
    }
    float _226 = _192;
    float _228 = _194;
    float _230 = _142;
    bool _232 = !_164;
    float _234 = _230;
    float _236 = _228;
    if (!_232)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _154 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _234 = _244;
        _168 = _256;
    }
    float _258 = _234;
    float _260 = _168;
    float _262 = _258;
    if (!_164)
    {
        _262 = _124;
    }
    float _264 = _262;
    float _266 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _264;
    if (!_164)
    {
        float _270 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _270;
    }
    float _272 = _236;
    bool _274 = !_164;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _124 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _124);
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
        float _322 = _124 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _336 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _338 = fma(_260, _150, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _342 = fma(_332, _150, _334);
    float _344 = fma(_260, _148, _336);
    float _346 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _148, _340);
    float _352 = -_342;
    float _354 = _338 + _352;
    float _356 = fma(_332, _152, _346);
    float _358 = fma(_260, _152, _348);
    float _360 = -_350;
    float _362 = _344 + _360;
    float _364 = _354 * _354;
    float _366 = in.m_51.w;
    float _368 = -_356;
    float _370 = _358 + _368;
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
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _396 = sqrt(_382);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    float _400 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    bool _402 = _396 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_396);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = fma(_344, _366, _386);
    float _414 = fma(_338, _366, _388);
    float _416 = fma(_358, _366, _390);
    float _418 = _398;
    float _420 = _394;
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
    float _590 = in.m_53.x;
    float _592 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _596 = _592 * _590;
    float _598 = trunc(_596);
    int _600 = int(_598);
    int _602 = _600 << 4;
    int _604 = _602 + 1712;
    bool _606 = !_594;
    float _622;
    if (!_606)
    {
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _610 = _590 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_90);
        float _628 = 1.0 / _626;
        float _630 = _124 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    uint _635 = uint(int(uint(_604) >> uint(2)));
    uint _637 = uint(int(uint(int(_635)) >> uint(2)));
    int _639 = int(_635) & 3;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[int(_637)][_639];
    int _643 = int(_635) + 1;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    int _647 = _643 & 3;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[int(_645)][_647];
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _659 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _661 = isnan(_632);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    int _671 = _604 + 8;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    uint _675 = uint(int(uint(int(_673)) >> uint(2)));
    int _677 = int(_673) & 3;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[int(_675)][_677];
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _685 = 1.0 / _653;
    bool _687 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _689 = isnan(_632);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _699;
    float _703 = -_669;
    float _705 = _703 + 1.0;
    bool _707 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _709 = isnan(_632);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _725 = _632 + _723;
    float _727 = _697 * _705;
    float _729 = 1.0 / _657;
    float _731 = -_697;
    float _733 = _731 + 1.0;
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _737 = _717 * _733;
    float _739 = -_717;
    float _741 = _739 + 1.0;
    float _743 = 1.0 / _683;
    float _745 = _701 * _685;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _749 = _632 + _747;
    float _751 = fma(_745, _749, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _753;
    bool _757 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _759 = isnan(_632);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _721 * _729;
    float _771 = _751 * _737;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _775 = _632 + _773;
    float _777 = fma(_769, _725, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _779 = -_767;
    float _781 = _779 + 1.0;
    float _783 = _755 * _743;
    float _785 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[115].x, _771);
    float _787 = _669 * _781;
    float _789 = fma(_783, _775, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _791 = fma(_777, _727, _785);
    float _793 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _795 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _797 = fma(_789, _787, _791);
    float _799 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _801 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[118].x, _797);
    float _807 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _809 = _799 * _590;
    float _811 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _813 = _807 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _815 = trunc(_809);
    int _817 = int(_815);
    out.m_55.x = _801;
    out.m_55.y = _803;
    out.m_55.z = _813;
    out.m_55.w = _811;
    int _819 = _817 << 4;
    int _821 = _819 + 1968;
    bool _823 = !_735;
    float _839;
    if (!_823)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _827 = _590 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _831 = _829 * _825;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _837;
        _841 = true;
    }
    else
    {
        float _843 = float(_90);
        float _845 = 1.0 / _843;
        float _847 = _124 * _845;
        _839 = _847;
    }
    _841 = false;
    float _849 = _839;
    float _851 = in.m_53.w;
    float _853 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _855 = in.m_51.x;
    float _857 = in.m_51.y;
    float _859 = in.m_51.z;
    int _861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _863 = _861 != 0;
    float _865 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _869 = _867 != 0;
    float _871 = in.m_57.x;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _875 = _873 != 0;
    float _877 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _881 = _879 != 0;
    float _883 = in.m_59.x;
    float _885 = in.m_59.y;
    float _887 = in.m_59.z;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _891 = _889 != 0;
    float _893 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[4].x, _865);
    float _895 = in.m_53.y;
    float _897 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[5].x, _853);
    float _899 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[6].x, _877);
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _905 = in.m_61.y;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _909 = _851 > 0.5;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _913 = _857 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _915 = _859 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _917 = _855 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_63.x = _871;
    float _923 = 1.0 / _903;
    float _925 = _917 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _883);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _887);
    float _931 = _590 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _933 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _885);
    float _935 = 1.0 / _921;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _941 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _945 = 0.0;
    bool _947 = _909;
    float _949 = _905;
    if (!_863)
    {
        float _951 = in.m_53.z;
        _945 = _951;
    }
    float _953 = _945;
    float _955 = _907 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _957 = fma(_941, -2.0, _911);
    float _959 = -_943;
    float _961 = fma(_931, 2.0, _959);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _967 = 1.0 / _939;
    float _969 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _897);
    float _971 = 0.0;
    float _973 = _953;
    if (_875)
    {
        float _975 = in.m_53.z;
        _971 = _975;
    }
    float _977 = _971;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _983 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _893);
    float _985 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _899);
    float _987 = 1.0 / _965;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _995 = _991 * _923;
    float _997 = _969 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _999 = -_905;
    float _1001 = _999 + 1.0;
    float _1003 = 1.0 / _981;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1013 = _1007 * _935;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1015;
    float _1019 = _1011 * _967;
    float _1021 = _983 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1023 = _1017 * _987;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _997 + _1025;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _1029;
    float _1033 = _985 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1037 = _1021 + _1035;
    float _1039 = _1031 * _1003;
    float _1041 = _1027 * _1027;
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1045 = _1033 + _1043;
    int _1047 = _909 ? as_type<int>(_1001) : as_type<int>(_905);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1051 = fma(_1037, _1037, _1041);
    float _1053 = _1041;
    float _1055 = _1027;
    if (!_863)
    {
        _1053 = _895;
    }
    float _1057 = _1053;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1061 = _849 + _1059;
    float _1063 = _1057;
    if (_869)
    {
        bool _1065 = _590 > 0.5;
        _947 = _1065;
    }
    bool _1067 = _947;
    float _1069 = fma(_1045, _1045, _1051);
    float _1071 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1049);
    if (_863)
    {
        _1063 = _590;
    }
    float _1073 = _1063;
    float _1075 = _584 * _584;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1079 = _849 + _1077;
    float _1081 = fma(_1013, _1061, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1083 = rsqrt(_1069);
    float _1085 = fma(_586, _586, _1075);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1089 = _849 + _1087;
    float _1091 = fma(_1023, _1079, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1093 = _925 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1095 = fma(_588, _588, _1085);
    float _1097 = fma(_995, _1089, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1101 = _849 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1105 = _849 + _1103;
    float _1107 = rsqrt(_1095);
    float _1109 = _881 ? as_type<float>(_1047) : _905;
    float _1111 = fma(_1019, _1101, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1113 = fma(_1039, _1105, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    bool _1115 = _895 > 0.5;
    float _1117 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1071);
    bool _1119 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1121 = isnan(_849);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = _1093 * _1083;
    if (_891)
    {
        float _1133 = _1115 ? _1001 : _905;
        _949 = _1133;
    }
    float _1135 = _949;
    bool _1137 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _1139 = isnan(_849);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    float _1149 = _1027 * _1131;
    float _1151 = _1037 * _1131;
    bool _1153 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1155 = isnan(_849);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = -_1129;
    float _1167 = _1165 + 1.0;
    float _1169 = -_1149;
    float _1171 = _1027 + _1169;
    float _1173 = -_1151;
    float _1175 = _1037 + _1173;
    float _1177 = _1107 * _588;
    float _1179 = _1107 * _586;
    float _1181 = _1171 * _1171;
    float _1183 = _1107 * _584;
    float _1185 = _1045 * _1131;
    float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1189 = _1179 * _1187;
    float _1191 = fma(_1175, _1175, _1181);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1195 = _1177 * _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1199 = _1183 * _1197;
    float _1201 = -_1185;
    float _1203 = _1045 + _1201;
    bool _1205 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1207 = isnan(_849);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1219 = -_1195;
    float _1221 = fma(_1179, _1217, _1219);
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1225 = -_1199;
    float _1227 = fma(_1177, _1223, _1225);
    float _1229 = fma(_1203, _1203, _1191);
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1233 = -_1189;
    float _1235 = fma(_1183, _1231, _1233);
    float _1237 = _1221 * _1221;
    float _1239 = -_1147;
    float _1241 = _1239 + 1.0;
    float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1245 = false;
    float _1247 = _1185;
    if (_875)
    {
        bool _1249 = _977 > 0.5;
        _1245 = _1249;
    }
    bool _1251 = _1245;
    float _1253 = fma(_1227, _1227, _1237);
    float _1255 = _1215 * _1241;
    float _1257 = -_1215;
    float _1259 = _1257 + 1.0;
    float _1261 = in.m_61.x;
    float _1263 = fma(_1235, _1235, _1253);
    float _1265 = sqrt(_1229);
    float _1267 = _1129 * _1259;
    bool _1269 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1271 = isnan(_849);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1163 * _1167;
    bool _1283 = _849 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1285 = isnan(_849);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1291 = _1287 || _1289;
    float _1293 = float(_1291);
    float _1295 = -_1163;
    float _1297 = _1295 + 1.0;
    float _1299 = -_1279;
    float _1301 = _1299 + 1.0;
    float _1303 = rsqrt(_1263);
    float _1305 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1307 = _1279 * _1297;
    float _1309 = _1293 * _1301;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1313 = _1279;
    if (!_863)
    {
        _1313 = _953;
    }
    float _1315 = _1313;
    float _1317 = fma(_1305, _1135, -0.5);
    float _1319 = _1081 * _1309;
    float _1321 = _1083 * _1265;
    float _1323 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1325 = _915 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1327 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1311);
    float _1329 = _1315;
    if (_863)
    {
        _1329 = _895;
    }
    float _1331 = _1329;
    float _1333 = _1323 * _1321;
    int _1335 = as_type<int>(_1333);
    if (_863)
    {
        _973 = _895;
    }
    float _1337 = _973;
    float _1339 = fma(_1109, _955, -0.5);
    float _1341 = _1221 * _1303;
    float _1343 = _925 * _1321;
    float _1345 = _1235 * _1303;
    float _1347 = _1333 * _933;
    float _1349 = _1227 * _1303;
    float _1351 = _1343 * _927;
    float _1353 = _1325 * _1321;
    float _1355 = _1183 * _1345;
    float _1357 = _1347 * _1179;
    float _1359 = _1179 * _1341;
    float _1361 = _1347 * _1177;
    float _1363 = _1353 * _929;
    float _1365 = -_1355;
    float _1367 = fma(_1177, _1341, _1365);
    float _1369 = fma(_1351, _1349, _1357);
    float _1371 = -_1359;
    float _1373 = fma(_1183, _1349, _1371);
    float _1375 = fma(_1351, _1345, _1361);
    float _1377 = fma(_1363, _1367, _1369);
    float _1379 = fma(_1363, _1373, _1375);
    float _1381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1383 = _1021 + _1377;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1389 = _1033 + _1379;
    float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1393 = _1383 + _1391;
    float _1395 = _1261;
    float _1397 = _1383;
    float _1399 = _1389;
    if (_869)
    {
        float _1401 = -_1261;
        float _1403 = _1401 + 1.0;
        _1335 = as_type<int>(_1403);
    }
    int _1405 = _1335;
    float _1407 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1387);
    float _1409 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1411 = _1389 + _1409;
    float _1413 = _1393 * _1393;
    float _1415 = _1413;
    if (!_869)
    {
        _1055 = _1261;
    }
    float _1417 = _1055;
    float _1419 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1327);
    float _1421 = _1411 * _1411;
    float _1423 = _1417;
    float _1425 = _1421;
    if (_869)
    {
        float _1427 = _1067 ? as_type<float>(_1405) : _1261;
        _1423 = _1427;
    }
    float _1429 = _1423;
    float _1431 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _957);
    float _1433 = _1413 + _1421;
    float _1435 = -_1293;
    float _1437 = _1435 + 1.0;
    float _1439 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1441 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1385);
    float _1443 = sqrt(_1433);
    float _1445 = -_1431;
    float _1447 = fma(_1419, _1317, _1445);
    float _1449 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1451 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1319);
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1455 = fma(_1439, -2.0, _993);
    float _1457 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1459 = _1177 * _1349;
    float _1461 = -_1453;
    float _1463 = fma(_1449, 2.0, _1461);
    float _1465 = fma(_1097, _1307, _1451);
    int _1467 = _821 + 8;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[int(_1471)][_1473];
    int _1477 = 0;
    if (_875)
    {
        float _1479 = -_1261;
        float _1481 = _1479 + 1.0;
        _1477 = as_type<int>(_1481);
    }
    int _1483 = _1477;
    float _1485 = fma(_1457, _1429, -0.5);
    float _1487 = -_1459;
    float _1489 = fma(_1179, _1345, _1487);
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1493 = in.m_57.y;
    float _1495 = _1347 * _1183;
    if (_875)
    {
        float _1497 = _1251 ? as_type<float>(_1483) : _1261;
        _1395 = _1497;
    }
    float _1499 = _1395;
    uint _1501 = uint(int(uint(_821) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[int(_1511)][_1513];
    float _1517 = in.m_57.z;
    bool _1519 = _1443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1521 = fma(_1351, _1341, _1495);
    float _1523 = fma(_1091, _1281, _1465);
    float _1525 = -_124;
    float _1527 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[76].x, _961);
    float _1529 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1441);
    float _1531 = fma(_1363, _1489, _1521);
    float _1533 = in.m_57.w;
    float _1535 = -_124;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1463);
    float _1539 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1407);
    float _1541 = _997 + _1531;
    float _1543 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1545 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1455);
    float _1547 = fma(_1111, _1267, _1523);
    float _1549 = fma(_1543, _1499, -0.5);
    if (!_1519)
    {
        _126 = _1541;
    }
    float _1551 = _126;
    bool _1553 = !_1519;
    float _1555 = _1551;
    if (!_1553)
    {
        float _1557 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1561 = _1443 + _1559;
        float _1563 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1565 = rsqrt(_1433);
        float _1567 = _1561 * _1557;
        float _1569 = _1567 * 0.15915493667125701904296875;
        float _1571 = _1569 * 6.283185482025146484375;
        float _1573 = sin(_1571);
        float _1575 = _1569 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = fma(_1573, _1563, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1581 = _1565 * _1579;
        float _1583 = _1577 + (-1.0);
        float _1585 = fma(_1393, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1587 = fma(_1411, _1581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1589 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1593 = _1585 + _1591;
        float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1597 = _1587 + _1595;
        float _1599 = fma(_1541, _1577, _1589);
        float _1601 = _1593 * _1593;
        float _1603 = _1597 * _1597;
        _1555 = _1599;
        _1415 = _1601;
        _1425 = _1603;
        _1397 = _1585;
        _1399 = _1587;
    }
    float _1605 = _1555;
    float _1607 = _1415;
    float _1609 = _1425;
    float _1611 = _1397;
    float _1613 = _1399;
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1617 = _1605 + _1615;
    float _1619 = fma(_1113, _1255, _1547);
    float _1621 = fma(_1117, _1485, _1527);
    float _1623 = fma(_1529, _1549, _1537);
    float _1625 = fma(_1617, _1617, _1607);
    float _1627 = -_1545;
    float _1629 = fma(_1539, _1339, _1627);
    float _1631 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[136].x, _1619);
    float _1633 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1635 = _1625 + _1609;
    float _1637 = _1515 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1641 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1447 + 0.5;
    float _1645 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1647 = sqrt(_1635);
    float _1649 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1621 + 0.5;
    float _1653 = _1623 + 0.5;
    float _1655 = _1629 + 0.5;
    float _1657 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.y = _1493;
    out.m_63.z = _1517;
    out.m_63.w = _1533;
    bool _1659 = _1647 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1661 = isnan(_1647);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1667 = _1663 || _1665;
    out.m_65.x = _1651;
    out.m_65.y = _1643;
    out.m_65.z = _1653;
    out.m_65.w = _1655;
    out.m_67.x = _1641;
    out.m_67.y = _1645;
    out.m_67.z = _1649;
    out.m_67.w = _1657;
    float _1669 = _1633;
    float _1671 = _1643;
    if (!_1667)
    {
        _1669 = 1.0;
    }
    float _1673 = _1669;
    bool _1675 = !_1667;
    float _1677 = _1673;
    if (!_1675)
    {
        bool _1679 = _1647 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1681 = isnan(_1647);
        bool _1683 = _1679 || _1681;
        bool _1685 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1687 = _1683 || _1685;
        if (!_1687)
        {
            float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1691 = _1647 + _1689;
            float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1695 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1693;
            float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1699 = _1697 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1701 = 1.0 / _1695;
            float _1703 = _1691 * _1701;
            float _1705 = fma(_1703, _1699, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1677 = _1705;
            _1707 = true;
        }
        else
        {
            bool _1709 = _1647 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1711 = isnan(_1647);
            bool _1713 = _1709 || _1711;
            bool _1715 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1717 = _1713 || _1715;
            if (!_1717)
            {
                float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1721 = _1647 + _1719;
                float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1725 = _1723 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1727 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1729 = _1727 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1731 = 1.0 / _1725;
                float _1733 = _1721 * _1731;
                float _1735 = fma(_1733, _1729, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1677 = _1735;
                _1707 = true;
            }
            else
            {
                _1677 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1707 = false;
    float _1737 = _1677;
    float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1741 = _1611 + _1739;
    float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1745 = _1613 + _1743;
    bool _1747 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1759 = _1605 + _1757;
    float _1761 = fma(_1741, _1737, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1763 = fma(_1745, _1737, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1765 = fma(_1759, _1737, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1767 = -_1151;
    float _1769 = _1767 + _1761;
    float _1771 = -_1185;
    float _1773 = _1771 + _1763;
    float _1775 = -_1149;
    float _1777 = _1775 + _1765;
    float _1779 = _1777;
    float _1781 = _1769;
    float _1783 = _1773;
    if (!_1755)
    {
        float _1785 = -_1149;
        float _1787 = _997 + _1785;
        float _1789 = -_1151;
        float _1791 = _1021 + _1789;
        float _1793 = -_1185;
        float _1795 = _1033 + _1793;
        float _1797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1801 = _1787 + _1799;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1805 = _1791 + _1803;
        float _1807 = -_1033;
        float _1809 = _1807 + _1763;
        float _1811 = -_1021;
        float _1813 = _1811 + _1761;
        float _1815 = _1801 * _1801;
        float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1819 = _1795 + _1817;
        float _1821 = -_997;
        float _1823 = _1821 + _1765;
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = fma(_1805, _1805, _1815);
        float _1829 = fma(_1819, _1819, _1827);
        float _1831 = 1.0 / _1321;
        float _1833 = sqrt(_1829);
        float _1835 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1839 = _1837 * _1797;
        float _1841 = _1839 * _1831;
        float _1843 = _1835 * _1841;
        float _1845 = _1809 * _1841;
        float _1847 = fma(_1813, _1843, _1791);
        float _1849 = fma(_1823, _1843, _1787);
        float _1851 = fma(_1835, _1845, _1795);
        _1779 = _1849;
        _1781 = _1847;
        _1783 = _1851;
        _1247 = _1795;
    }
    float _1853 = _1779;
    float _1855 = _1781;
    float _1857 = _1783;
    float _1859 = _1247;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1863 = _1853 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1867 = _1855 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1871 = _1857 + _1869;
    float _1873 = _1863 * _1863;
    float _1875 = fma(_1867, _1867, _1873);
    float _1877 = fma(_1871, _1871, _1875);
    float _1879 = rsqrt(_1877);
    float _1881 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1883 = _1867 * _1881;
    float _1885 = _1871 * _1881;
    float _1887 = _1883 * _1883;
    float _1889 = _1885 * _1885;
    float _1891 = _1887 + _1889;
    float _1893 = sqrt(_1891);
    bool _1895 = _1893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = _1893 + _1897;
    float _1901 = _1879;
    float _1903 = _1891;
    float _1905 = _1899;
    float _1907 = _1859;
    float _1909 = _1863;
    float _1911 = _1883;
    if (_1895)
    {
        float _1913 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1901 = _1913;
    }
    float _1915 = _1901;
    if (_1895)
    {
        float _1917 = rsqrt(_1891);
        _1903 = _1917;
    }
    float _1919 = _1903;
    if (_1895)
    {
        float _1921 = _1899 * _1915;
        _1905 = _1921;
    }
    float _1923 = _1905;
    if (_1895)
    {
        float _1925 = _1923 * 0.15915493667125701904296875;
        _1907 = _1925;
    }
    float _1927 = _1907;
    float _1929 = _1915;
    if (_1895)
    {
        float _1931 = _1927 * 6.283185482025146484375;
        float _1933 = sin(_1931);
        _1929 = _1933;
    }
    float _1935 = _1929;
    float _1937 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1939 = precise::max(0.0, _1937);
    float _1941 = _1871;
    float _1943 = _1939;
    if (_1895)
    {
        float _1945 = _1927 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        _1941 = _1947;
    }
    float _1949 = _1941;
    float _1951 = -_1881;
    float _1953 = -_1939;
    float _1955 = fma(_1863, _1951, _1953);
    float _1957 = _1955;
    if (_1895)
    {
        float _1959 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1943 = _1959;
    }
    float _1961 = _1943;
    float _1963 = _1935;
    float _1965 = _1961;
    if (_1895)
    {
        float _1967 = fma(_1935, _1961, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1963 = _1967;
    }
    float _1969 = _1963;
    float _1971 = _1969;
    if (_1895)
    {
        float _1973 = _1949 + (-1.0);
        _1965 = _1973;
    }
    float _1975 = _1965;
    float _1977 = _1975;
    if (_1895)
    {
        float _1979 = _1919 * _1969;
        _1671 = _1979;
    }
    float _1981 = _1671;
    if (!_1895)
    {
        _1971 = _1885;
    }
    float _1983 = _1971;
    float _1985 = sqrt(_1877);
    float _1987 = _1983;
    if (_1895)
    {
        float _1989 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1909 = _1989;
    }
    float _1991 = _1909;
    float _1993 = _1991;
    if (_1895)
    {
        float _1995 = _1883 * _1981;
        _1911 = _1995;
    }
    float _1997 = _1911;
    if (!_1895)
    {
        _1977 = _1887;
    }
    float _1999 = _1977;
    float _2001 = _1999;
    if (_1895)
    {
        float _2003 = _1885 * _1981;
        _1987 = _2003;
    }
    float _2005 = _1987;
    if (_1895)
    {
        float _2007 = fma(_1955, _1949, _1991);
        _1957 = _2007;
    }
    float _2009 = _1957;
    if (_1895)
    {
        float _2011 = _1997 * _1997;
        _2001 = _2011;
    }
    float _2013 = _2001;
    if (!_1895)
    {
        _1993 = _1889;
    }
    float _2015 = _1993;
    float _2017 = _2015;
    if (_1895)
    {
        float _2019 = _2005 * _2005;
        _2017 = _2019;
    }
    float _2021 = _2017;
    float _2023 = fma(_2009, _2009, _2013);
    float _2025 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2027 = _2023 + _2021;
    float _2029 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2033 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2031);
    float _2035 = precise::clamp(_2033, 0.0, 1.0);
    float _2037 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2039 = rsqrt(_2027);
    float _2041 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2029);
    float _2043 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2045 = -_2035;
    float _2047 = _2045 + 1.0;
    float _2049 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2037);
    float _2051 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2041);
    float _2053 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2043);
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2057 = abs(_2047);
    float _2059 = log2(_2057);
    float _2061 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2063 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2053);
    float _2065 = fma(_1855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2025);
    float _2067 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2049);
    float _2069 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2071 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2073 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2065);
    float _2075 = _2039 * _1997;
    float _2077 = -_2069;
    float _2079 = fma(_2077, _2055, 1.0);
    float _2081 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2083 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2085 = _2039 * _2009;
    float _2087 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2089 = _2039 * _2005;
    float _2091 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2083);
    float _2093 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2095 = -_2087;
    float _2097 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2095);
    float _2099 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2101 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2091);
    float _2103 = exp2(_2093);
    float _2105 = -_2089;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2097);
    float _2109 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2101);
    float _2113 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2115 = fma(_2107, -0.5, 0.5);
    float _2117 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2119 = log2(_2079);
    float _2121 = fma(_2107, 0.5, 0.5);
    float _2123 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2113);
    float _2125 = _2085 + 1.0;
    float _2127 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2117);
    float _2129 = fma(_2121, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2131 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2123);
    float _2133 = 1.0 / _2111;
    float _2135 = -_2085;
    float _2137 = fma(_2103, _2125, _2135);
    float _2139 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2127);
    float _2141 = fma(_2121, _2129, -0.212114393711090087890625);
    float _2143 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2145 = fma(_2137, 0.5, 0.5);
    float _2147 = fma(_2121, _2141, 1.570728778839111328125);
    float _2149 = sqrt(_2115);
    float _2151 = _2119 * 0.693147182464599609375;
    float _2153 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _2139 * _2133;
    float _2157 = _2143 * _2133;
    float _2159 = fma(_2155, 0.5, 0.5);
    float _2161 = fma(_2157, -0.5, 0.5);
    float _2163 = _2149 * 0.636619746685028076171875;
    float3 _5663 = float3(_2159, _2161, _2153);
    float _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5663, float3(0.0), isnan(_5663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5663, float3(0.0), isnan(_5663)), level(0.0)).x;
    float _2167 = -_2147;
    float _2169 = fma(_2163, _2167, 1.0);
    float3 _5679 = float3(_2159, _2161, _2153);
    float4 _2172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5679, float3(0.0), isnan(_5679)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5679, float3(0.0), isnan(_5679)), level(0.0)).xyzw;
    float _2174 = _2172.x;
    float _2176 = _2172.y;
    float _2178 = _2172.z;
    float _2180 = _2172.w;
    float2 _5696 = float2(_2169, _2145);
    float3 _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5696, float2(0.0), isnan(_5696)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5696, float2(0.0), isnan(_5696)), level(0.0)).xyz;
    float _2186 = _2184.x;
    float _2188 = _2184.y;
    float _2190 = _2184.z;
    float _2192 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2194 = _2071 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2196 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2194);
    float _2198 = exp2(_2192);
    float _2200 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2196);
    float _2202 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2200);
    float _2204 = _2202 + _2111;
    out.gl_Position.x = _2139;
    out.gl_Position.y = _2143;
    out.gl_Position.z = _2202;
    out.gl_Position.w = _2111;
    float _2206 = _2204 * 0.5;
    float _2208 = -_2198;
    float _2210 = _2208 + 1.0;
    float _2212 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2214 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2206;
    out.m_69.w = _2111;
    out.m_47.x = _2212;
    float _2216 = _2214 * _2165;
    float _2218 = -_2214;
    float _2220 = _2218 + 1.0;
    float _2222 = _2180 * _2216;
    float _2224 = _2190 * _2216;
    float _2226 = fma(_2186, _2222, _2174);
    float _2228 = fma(_2188, _2222, _2176);
    float _2230 = _2180 * _2220;
    float _2232 = fma(_2180, _2224, _2178);
    out.m_71.x = _2226;
    out.m_71.y = _2228;
    out.m_71.z = _2232;
    out.m_71.w = _2230;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

