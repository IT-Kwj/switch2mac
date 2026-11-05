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
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2047 = false;
    bool _556 = false;
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
        float _2543 = as_type<float>(_106);
        out.gl_Position.z = _2543;
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
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2612 = as_type<float>(_142);
        out.gl_Position.z = _2612;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _164 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _162);
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _166);
    float _170 = _166;
    float _172 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _174 = _150;
    if (!_160)
    {
        float _176 = _150 * _150;
        float _178 = _176 * 0.5;
        _170 = _178;
    }
    float _180 = _170;
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _164);
    float _184 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _168);
    float _186 = _180;
    if (!_160)
    {
        float _188 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_160;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = exp2(_206);
        float _210 = _204 * 0.693147182464599609375;
        float _212 = 1.0 / _210;
        float _214 = 1.0 / _202;
        float _216 = _208 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _212, _150);
        float _222 = _220 * _214;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
        _172 = _208;
    }
    float _226 = _194;
    float _228 = _172;
    bool _230 = !_160;
    float _232 = _228;
    if (!_230)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _150 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _174 = _252;
        _232 = _242;
    }
    float _254 = _174;
    float _256 = _232;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _256;
    float _266 = _258;
    float _268 = _262;
    if (!_160)
    {
        float _270 = _124 * _124;
        float _272 = _270 * 0.5;
        _264 = _272;
    }
    float _274 = _264;
    float _276 = fma(_254, _144, _258);
    float _278 = fma(_254, _146, _260);
    float _280 = fma(_254, _148, _262);
    if (!_160)
    {
        float _282 = _274 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _282;
    }
    float _284 = _266;
    bool _286 = !_160;
    float _288 = _284;
    if (!_286)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _124 * _292;
        float _302 = 1.0 / _296;
        float _304 = _298 * 0.693147182464599609375;
        float _306 = exp2(_300);
        float _308 = 1.0 / _304;
        float _310 = _306 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _308, _124);
        float _316 = _314 * _302;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _318;
        _268 = _306;
    }
    float _320 = _288;
    float _322 = _268;
    float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = _322;
    if (!_160)
    {
        _326 = _124;
    }
    float _328 = _326;
    bool _330 = !_160;
    float _332 = _328;
    if (!_330)
    {
        float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _336 = log2(_334);
        float _338 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _340 = _338 + 1.0;
        float _342 = 1.0 / _340;
        float _344 = _124 * _336;
        float _346 = exp2(_344);
        float _348 = -_346;
        float _350 = _348 + 1.0;
        float _352 = _350 * _342;
        _332 = _352;
    }
    float _354 = _332;
    float _356 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _358 = fma(_354, _146, _324);
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _362 = fma(_354, _144, _356);
    float _364 = -_358;
    float _366 = _278 + _364;
    float _368 = fma(_354, _148, _360);
    float _370 = -_362;
    float _372 = _276 + _370;
    float _374 = _366 * _366;
    float _376 = -_368;
    float _378 = _280 + _376;
    float _380 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _382 = sqrt(_182);
    float _384 = fma(_372, _372, _374);
    float _386 = in.m_51.w;
    float _388 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _380);
    float _390 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _392 = fma(_378, _378, _384);
    float _394 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _396 = sqrt(_184);
    float _398 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].y, _390);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].z, _394);
    float _402 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _388);
    float _404 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _406 = sqrt(_392);
    float _408 = in.m_44.x;
    float _410 = in.m_44.y;
    float _412 = in.m_44.z;
    float _414 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].x, _404);
    float _418 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].z, _400);
    float _420 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].w, _414);
    float _422 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].x, _416);
    float _424 = sqrt(_402);
    float _426 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].y, _398);
    float _428 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].w, _420);
    float _430 = _382 * _422;
    float _432 = _396 * _426;
    bool _434 = _406 >= 9.9999999747524270787835121154785e-07;
    bool _436 = isnan(_406);
    bool _438 = _434 || _436;
    bool _440 = isnan(9.9999999747524270787835121154785e-07);
    bool _442 = _438 || _440;
    float _444 = _432 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _446 = _432 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _448 = _432 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _450 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _444);
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _446);
    float _454 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[26].x, _448);
    float _456 = _424 * _418;
    float _458 = fma(_276, _386, _408);
    float _460 = fma(_278, _386, _410);
    float _462 = fma(_280, _386, _412);
    float _464 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[24].z, _450);
    float _466 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[25].z, _452);
    float _468 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[26].z, _454);
    float _470 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[24].w, _464);
    float _472 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[25].w, _466);
    float _474 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[26].w, _468);
    float _476 = _472;
    float _478 = _470;
    float _480 = _474;
    if (!_442)
    {
        bool _482 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _484 = !_482;
        if (!_484)
        {
            float _486 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _488 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _490 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _492 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _486);
            float _494 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _488);
            float _496 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _490);
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _492);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _494);
            float _502 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _496);
            float _506 = _396 * _498;
            float _508 = _382 * _500;
            float _510 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _502);
            float _512 = _424 * _504;
            float _514 = _506 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _516 = _506 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _518 = _506 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _520 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _510);
            float _522 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[25].x, _514);
            float _524 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[24].x, _516);
            float _526 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[26].x, _518);
            float _528 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[25].z, _522);
            float _530 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[24].z, _524);
            float _532 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[26].z, _526);
            float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].w, _528);
            float _536 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].w, _530);
            float _538 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].w, _532);
            float _540 = _534 * _534;
            float _542 = fma(_536, _536, _540);
            float _544 = fma(_538, _538, _542);
            float _546 = rsqrt(_544);
            float _548 = _546 * 9.9999999747524270787835121154785e-07;
            float _550 = _536 * _548;
            float _552 = _534 * _548;
            float _554 = _538 * _548;
            _476 = _552;
            _478 = _550;
            _480 = _554;
            _556 = true;
        }
        else
        {
            float _558 = _146 * _146;
            float _560 = fma(_144, _144, _558);
            float _562 = fma(_148, _148, _560);
            float _564 = sqrt(_562);
            bool _566 = _564 >= 9.9999999747524270787835121154785e-07;
            bool _568 = isnan(_564);
            bool _570 = _566 || _568;
            bool _572 = isnan(9.9999999747524270787835121154785e-07);
            bool _574 = _570 || _572;
            if (!_574)
            {
                float _576 = _410 * _410;
                float _578 = fma(_408, _408, _576);
                float _580 = fma(_412, _412, _578);
                float _582 = sqrt(_580);
                bool _584 = _582 >= 9.9999999747524270787835121154785e-07;
                bool _586 = isnan(_582);
                bool _588 = _584 || _586;
                bool _590 = isnan(9.9999999747524270787835121154785e-07);
                bool _592 = _588 || _590;
                if (!_592)
                {
                    float _594 = _396 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _596 = _382 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _598 = _424 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _600 = _594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _602 = _594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _604 = _594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _606 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _600);
                    float _608 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _602);
                    float _610 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _604);
                    float _612 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[25].z, _606);
                    float _614 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[24].z, _608);
                    float _616 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[26].z, _610);
                    float _618 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _612);
                    float _620 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _614);
                    float _622 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _616);
                    float _624 = _618 * _618;
                    float _626 = fma(_620, _620, _624);
                    float _628 = fma(_622, _622, _626);
                    float _630 = rsqrt(_628);
                    float _632 = _630 * 9.9999999747524270787835121154785e-07;
                    float _634 = _620 * _632;
                    float _636 = _618 * _632;
                    float _638 = _622 * _632;
                    _476 = _636;
                    _478 = _634;
                    _480 = _638;
                    _556 = true;
                }
                else
                {
                    float _640 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _642 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _644 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _646 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _648 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].y, _640);
                    float _650 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].x, _642);
                    float _652 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].z, _644);
                    float _654 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].w, _646);
                    float _656 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].y, _648);
                    float _658 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].x, _650);
                    float _660 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].z, _652);
                    float _662 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].w, _654);
                    float _664 = _396 * _656;
                    float _666 = _382 * _658;
                    float _668 = _424 * _660;
                    float _670 = _664 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _672 = _664 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _674 = _664 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _676 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].x, _670);
                    float _678 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _672);
                    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].x, _674);
                    float _682 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[25].z, _676);
                    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[24].z, _678);
                    float _686 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[26].z, _680);
                    float _688 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[25].w, _682);
                    float _690 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[24].w, _684);
                    float _692 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[26].w, _686);
                    float _694 = _688 * _688;
                    float _696 = fma(_690, _690, _694);
                    float _698 = fma(_692, _692, _696);
                    float _700 = rsqrt(_698);
                    float _702 = _700 * 9.9999999747524270787835121154785e-07;
                    float _704 = _690 * _702;
                    float _706 = _688 * _702;
                    float _708 = _692 * _702;
                    _476 = _706;
                    _478 = _704;
                    _480 = _708;
                    _556 = true;
                }
            }
            else
            {
                float _710 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _712 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _714 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _716 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _718 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].y, _710);
                float _720 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].x, _712);
                float _722 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].z, _714);
                float _724 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].w, _716);
                float _726 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].y, _718);
                float _728 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].x, _720);
                float _730 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].z, _722);
                float _732 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].w, _724);
                float _734 = _396 * _726;
                float _736 = _382 * _728;
                float _738 = _424 * _730;
                float _740 = _734 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _742 = _734 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _744 = _734 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _746 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].x, _740);
                float _748 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].x, _742);
                float _750 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].x, _744);
                float _752 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[25].z, _746);
                float _754 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[24].z, _748);
                float _756 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[26].z, _750);
                float _758 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[25].w, _752);
                float _760 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[24].w, _754);
                float _762 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[26].w, _756);
                float _764 = _758 * _758;
                float _766 = fma(_760, _760, _764);
                float _768 = fma(_762, _762, _766);
                float _770 = rsqrt(_768);
                float _772 = _770 * 9.9999999747524270787835121154785e-07;
                float _774 = _760 * _772;
                float _776 = _758 * _772;
                float _778 = _762 * _772;
                _476 = _776;
                _478 = _774;
                _480 = _778;
            }
        }
    }
    _556 = false;
    float _780 = _476;
    float _782 = _478;
    float _784 = _480;
    float _786 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _788 = int(_786);
    float _790 = in.m_53.x;
    float _792 = float(_90);
    float _794 = in.m_55.x;
    float _796 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _798 = int(_796);
    float _800 = float(_788);
    float _802 = 1.0 / _792;
    float _804 = float(uint(_798));
    float _806 = 1.0 / _800;
    int _808 = ~_798;
    int _810 = _808 + 1;
    int _812 = ~_798;
    int _814 = _812 + 1;
    out.m_57.x = _794;
    int _816 = ~_798;
    int _818 = _816 + 1;
    float _820 = 1.0 / _804;
    float _822 = _124 * _806;
    float _824 = trunc(_822);
    int _826 = int(_824);
    int _828 = as_type<int>(_820) + (-2);
    float _830 = float(uint(_826));
    float _832 = float(_826);
    float _834 = as_type<float>(_828) * _830;
    float _836 = trunc(_834);
    float _838 = precise::max(_836, 0.0);
    uint _841 = uint(_838);
    int _843 = _810 * int(_841);
    int _845 = _843 + _826;
    float _847 = float(uint(_845));
    float _849 = as_type<float>(_828) * _847;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _853 = _851 != 0;
    float _855 = trunc(_849);
    float _857 = precise::max(_855, 0.0);
    uint _859 = uint(_857);
    bool _861 = !_853;
    float _863 = _861 ? 7.345489978790283203125 : 1.0;
    float _865 = _863 * _790;
    int _867 = int(_841) + int(_859);
    float _869 = floor(_865);
    float _871 = float(_798);
    int _873 = _814 * _867;
    int _875 = _873 + _826;
    bool _877 = _832 >= _871;
    bool _879 = isnan(_832);
    bool _881 = _877 || _879;
    bool _883 = isnan(_871);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    bool _889 = uint(_875) >= uint(_798);
    float _891 = trunc(_887);
    int _893 = int(_891);
    bool _895 = !_889;
    int _897 = _895 ? 0 : (-1);
    bool _899 = _798 == 0;
    float _901 = -_869;
    float _903 = _865 + _901;
    int _905 = ~_867;
    int _907 = _905 + _897;
    int _909 = _907 + 1;
    float _911 = _903 * _871;
    float _913 = _124 * _871;
    int _915 = _798 * _909;
    int _917 = _915 + _826;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _921 = _919 != 0;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _929 = _927 != 0;
    float _931 = _913 * _802;
    float _933 = trunc(_911);
    int _935 = int(_933);
    int _937 = ~_893;
    int _939 = _937 + 1;
    int _941 = _939 + 1;
    bool _943 = !_899;
    int _945 = _943 ? _917 : (-1);
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _949 = _947 != 0;
    int _951 = _798 + (-1);
    float _953 = trunc(_931);
    int _955 = int(_953);
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _959 = _957 != 0;
    int _961 = _945 * _941;
    bool _963 = !_925;
    int _965 = _963 ? 0 : 1;
    bool _967 = !_959;
    int _969 = _967 ? 0 : 1;
    int _971 = _893 * _951;
    int _973 = _971 + _961;
    int _975 = abs(_965);
    bool _977 = !_921;
    int _979 = _977 ? 0 : 1;
    bool _981 = !_929;
    int _983 = _981 ? 0 : 1;
    int _985 = abs(_969);
    int _987 = abs(_979);
    int _989 = abs(_983);
    int _991 = _973 * _975;
    bool _993 = !_949;
    int _995 = _993 ? 0 : 1;
    int _997 = _935 * _985;
    int _999 = _997 + _826;
    int _1001 = _955 * _987;
    int _1003 = _1001 + _991;
    int _1005 = abs(_995);
    float _1007 = in.m_59.y;
    int _1009 = ~_798;
    int _1011 = _1009 + 1;
    int _1013 = _999 * _989;
    int _1015 = _1013 + _1003;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1023 = _1021 != 0;
    int _1025 = _935 * _1005;
    int _1027 = _1025 + _1015;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1031 = _1029 != 0;
    float _1033 = in.m_53.y;
    float _1035 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1037 = float(uint(_1027));
    float _1039 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1035);
    float _1041 = as_type<float>(_828) * _1037;
    float _1043 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1039);
    float _1045 = in.m_51.x;
    float _1047 = in.m_51.y;
    float _1049 = in.m_51.z;
    float _1051 = trunc(_1041);
    float _1053 = precise::max(_1051, 0.0);
    uint _1055 = uint(_1053);
    float _1057 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _1059 = _1033 > 0.5;
    float _1061 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1057);
    int _1063 = _1011 * int(_1055);
    int _1065 = _1063 + _1027;
    float _1067 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1061);
    float _1069 = float(uint(_1065));
    float _1071 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1073 = float(uint(_999));
    float _1075 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1077 = -_1007;
    float _1079 = _1077 + 1.0;
    float _1081 = as_type<float>(_828) * _1069;
    float _1083 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1085 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1087 = as_type<float>(_828) * _1073;
    float _1089 = trunc(_1081);
    float _1091 = precise::max(_1089, 0.0);
    uint _1093 = uint(_1091);
    float _1095 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1083);
    float _1097 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1085);
    int _1099 = ~_798;
    int _1101 = _1099 + 1;
    float _1103 = _1067 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1105 = _1007;
    if (_1023)
    {
        float _1107 = _1059 ? _1079 : _1007;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _1113 = ~_798;
    int _1115 = _1113 + 1;
    float _1117 = trunc(_1087);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1095);
    float _1125 = _396 * _1103;
    float _1127 = _382 * _1111;
    float _1129 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1097);
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1137 = int(_1055) + int(_1093);
    float _1139 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1141 = _424 * _1131;
    float _1143 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1133);
    float _1145 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _1147 = _1101 * _1137;
    int _1149 = _1147 + _1027;
    float _1151 = _1139 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1153 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1155 = _1115 * int(_1121);
    int _1157 = _1155 + _999;
    bool _1159 = uint(_1149) >= uint(_798);
    float _1161 = float(uint(_1157));
    bool _1163 = !_1159;
    int _1165 = _1163 ? 0 : (-1);
    float _1167 = as_type<float>(_828) * _1161;
    int _1169 = ~_1137;
    int _1171 = _1169 + _1165;
    int _1173 = _1171 + 1;
    float _1175 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1177 = _780 * _780;
    float _1179 = trunc(_1167);
    float _1181 = precise::max(_1179, 0.0);
    uint _1183 = uint(_1181);
    int _1185 = _798 * _1173;
    int _1187 = _1185 + _1027;
    float _1189 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1175);
    float _1191 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1135);
    float _1193 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1143);
    bool _1195 = !_899;
    int _1197 = _1195 ? _1187 : (-1);
    float _1199 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1189);
    float _1201 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1191);
    float _1203 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1193);
    int _1205 = _1197 >> 31;
    float _1207 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1199);
    float _1209 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1201);
    float _1211 = _1203 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    int _1213 = _1205 & 3;
    float _1215 = fma(_782, _782, _1177);
    float _1217 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1221 = _1211 + _1219;
    int _1223 = _1197 + _1213;
    float _1225 = fma(_784, _784, _1215);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1229 = _1217 + _1227;
    float _1231 = _1209 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    int _1233 = _1223 >> 2;
    float _1235 = in.m_61.x;
    float _1237 = in.m_61.y;
    float _1239 = in.m_61.z;
    float _1241 = _1229 * _1229;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1245 = _1231 + _1243;
    int _1247 = _1233 << 4;
    int _1249 = _1247 + 368;
    float _1251 = rsqrt(_1225);
    float _1253 = fma(_1221, _1221, _1241);
    int _1255 = int(_1121) + int(_1183);
    uint _1257 = uint(int(uint(_1249) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[int(_1267)][_1269];
    int _1273 = _1197 & 3;
    bool _1275 = _1273 != 0;
    float _1277 = fma(_1245, _1245, _1253);
    int _1279 = _1197 & 3;
    bool _1281 = _1279 != 0;
    int _1283 = _818 * _1255;
    int _1285 = _1283 + _999;
    bool _1287 = _1279 != 3;
    int _1289 = _1249 + 8;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    float _1307 = rsqrt(_1277);
    bool _1309 = uint(_1279) > 1u;
    int _1311 = _1275 ? 0 : 1;
    float _1313 = _1251 * _782;
    bool _1315 = uint(_1279) >= 2u;
    float _1317 = _1251 * _780;
    int _1319 = ~_1311;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1235);
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1239);
    int _1329 = _1315 ? 0 : 1;
    float _1331 = _1251 * _784;
    bool _1333 = !_1281;
    int _1335 = _1333 ? 0 : 1;
    float _1337 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1237);
    int _1339 = ~_1329;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    int _1345 = _1343;
    int _1347 = _1323;
    if (_1287)
    {
        int _1349 = ~_1329;
        int _1351 = _1349 + 1;
        _1345 = _1351;
    }
    int _1353 = _1345;
    float _1355 = _1229 * _1307;
    if (!_1309)
    {
        int _1357 = ~_1311;
        int _1359 = _1357 + 1;
        _1347 = _1359;
    }
    int _1361 = _1347;
    float _1363 = _1221 * _1307;
    bool _1365 = uint(_1285) >= uint(_798);
    float _1367 = -_1355;
    float _1369 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1229);
    int _1371 = abs(_1361);
    float _1373 = -_1363;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _1377 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1379 = int(_1377);
    float _1381 = _1369 * _1369;
    int _1383 = abs(_1335);
    float _1385 = _1245 * _1307;
    int _1387 = abs(_1353);
    float _1389 = fma(_1375, _1375, _1381);
    int _1391 = ~_1371;
    int _1393 = _1391 + 1;
    int _1395 = _1393 + 1;
    float _1397 = -_1385;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    int _1401 = ~_1383;
    int _1403 = _1401 + 1;
    int _1405 = _1403 + 1;
    float _1407 = fma(_1399, _1399, _1389);
    bool _1409 = _1279 != 3;
    float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1413 = _1317 * _1411;
    bool _1415 = !_1365;
    int _1417 = _1415 ? 0 : (-1);
    int _1419 = _1395 * as_type<int>(_1271);
    int _1421 = ~_1387;
    int _1423 = _1421 + 1;
    int _1425 = _1423 + 1;
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1429 = -_1413;
    float _1431 = fma(_1331, _1427, _1429);
    float _1433 = float(uint(_1379));
    int _1435 = _1405 * as_type<int>(_1263);
    int _1437 = _1435 + _1419;
    int _1439 = ~_1255;
    int _1441 = _1439 + _1417;
    int _1443 = _1441 + 1;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1447 = _1313 * _1445;
    float _1449 = 1.0 / _1433;
    int _1451 = _1425 * as_type<int>(_1297);
    int _1453 = _1451 + _1437;
    bool _1455 = !_1409;
    int _1457 = _1455 ? 0 : (-1);
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1461 = _1331 * _1459;
    bool _1463 = !_1031;
    int _1465 = _1463 ? 0 : 1;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1469 = -_1447;
    float _1471 = fma(_1317, _1467, _1469);
    int _1473 = abs(_1457);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1477 = -_1461;
    float _1479 = fma(_1313, _1475, _1477);
    float _1481 = sqrt(_1407);
    int _1483 = abs(_1465);
    float _1485 = _1479 * _1479;
    int _1487 = ~_1473;
    int _1489 = _1487 + 1;
    int _1491 = _1489 + 1;
    float _1493 = fma(_1431, _1431, _1485);
    int _1495 = _798 * _1443;
    int _1497 = _1495 + _999;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1501 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1503 = _1491 * as_type<int>(_1305);
    int _1505 = _1503 + _1453;
    int _1507 = ~_1483;
    int _1509 = _1507 + 1;
    int _1511 = _1509 + 1;
    float _1513 = fma(_1471, _1471, _1493);
    int _1515 = abs(_1379);
    float _1517 = -_1499;
    float _1519 = fma(_1501, 2.0, _1517);
    bool _1521 = !_899;
    int _1523 = _1521 ? _1497 : (-1);
    int _1525 = _1505 * _1511;
    float _1527 = rsqrt(_1513);
    float _1529 = _1307 * _1481;
    int _1531 = _1523 * _1483;
    int _1533 = _1531 + _1525;
    float _1535 = float(uint(_1515));
    float _1537 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1539 = as_type<int>(_1449) + (-2);
    float _1541 = _1153 * _1529;
    float _1543 = float(uint(_1533));
    float _1545 = _1537 * _1529;
    float _1547 = 1.0 / _1535;
    float _1549 = _1151 * _1529;
    float _1551 = _1541 * _1325;
    float _1553 = as_type<float>(_1539) * _1543;
    int _1555 = abs(_1533);
    float _1557 = _1549 * _1327;
    float _1559 = _1545 * _1337;
    float _1561 = _1471 * _1527;
    float _1563 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1565 = trunc(_1553);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    int _1571 = ~_1379;
    int _1573 = _1571 + 1;
    float _1575 = _1431 * _1527;
    float _1577 = _1479 * _1527;
    float _1579 = _1563 * _790;
    float _1581 = _1317 * _1561;
    int _1583 = as_type<int>(_1547) + (-2);
    float _1585 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1587 = float(uint(_1555));
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1591 = -_1581;
    float _1593 = fma(_1331, _1577, _1591);
    bool _1595 = _790 > 0.5;
    bool _1597 = _1595 && _1019;
    float _1599 = trunc(_1579);
    int _1601 = int(_1599);
    float _1603 = as_type<float>(_1583) * _1587;
    float _1605 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1589);
    int _1607 = _1573 * int(_1569);
    int _1609 = _1607 + _1533;
    int _1611 = ~_1515;
    int _1613 = _1611 + 1;
    float _1615 = _1559 * _1313;
    float _1617 = -_124;
    float _1619 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1519);
    float _1621 = trunc(_1603);
    float _1623 = precise::max(_1621, 0.0);
    uint _1625 = uint(_1623);
    float _1627 = float(uint(_1609));
    float _1629 = fma(_1551, _1575, _1615);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1633 = _1331 * _1575;
    float _1635 = as_type<float>(_1539) * _1627;
    float _1637 = fma(_1585, -2.0, _1631);
    float _1639 = fma(_1557, _1593, _1629);
    float _1641 = _1313 * _1577;
    float _1643 = _1559 * _1331;
    float _1645 = in.m_59.x;
    float _1647 = trunc(_1635);
    float _1649 = precise::max(_1647, 0.0);
    uint _1651 = uint(_1649);
    float _1653 = -_1641;
    float _1655 = fma(_1317, _1575, _1653);
    float _1657 = fma(_1551, _1561, _1643);
    int _1659 = _1613 * int(_1625);
    int _1661 = _1659 + _1555;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1665 = _1601 << 4;
    int _1667 = _1665 + 1712;
    float _1669 = fma(_1557, _1655, _1657);
    float _1671 = _1211 + _1639;
    float _1673 = float(uint(_1661));
    float _1675 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1663);
    float _1677 = _1231 + _1669;
    float _1679 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1605);
    float _1681 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1637);
    float _1683 = as_type<float>(_1583) * _1673;
    float _1685 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1675);
    uint _1687 = uint(int(uint(_1667) >> uint(2)));
    uint _1689 = uint(int(uint(int(_1687)) >> uint(2)));
    int _1691 = int(_1687) & 3;
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[int(_1689)][_1691];
    int _1695 = int(_1687) + 1;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    int _1699 = _1695 & 3;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[int(_1697)][_1699];
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1705 = _1671 + _1703;
    float _1707 = trunc(_1683);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1715 = _1677 + _1713;
    int _1717 = ~_1515;
    int _1719 = _1717 + 1;
    float _1721 = _1705 * _1705;
    int _1723 = ~_1379;
    int _1725 = _1723 + 1;
    float _1727 = _1715 * _1715;
    int _1729 = _1667 + 8;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[int(_1733)][_1735];
    float _1739 = _1675;
    float _1741 = as_type<float>(_1725);
    float _1743 = as_type<float>(_1533);
    float _1745 = _1721;
    float _1747 = _1727;
    if (_1019)
    {
        _1739 = _1645;
    }
    float _1749 = _1739;
    float _1751 = _1559 * _1317;
    float _1753 = _1721 + _1727;
    int _1755 = int(_1569) + int(_1651);
    float _1757 = -_1633;
    float _1759 = fma(_1313, _1561, _1757);
    float _1761 = _1749;
    if (_1597)
    {
        float _1763 = -_1749;
        float _1765 = _1763 + 1.0;
        _1761 = _1765;
    }
    float _1767 = _1761;
    float _1769 = sqrt(_1753);
    float _1771 = in.m_55.y;
    float _1773 = fma(_1551, _1577, _1751);
    int _1775 = int(_1625) + int(_1711);
    float _1777 = fma(_1557, _1759, _1773);
    if (!_1019)
    {
        _1741 = _1645;
    }
    float _1779 = _1741;
    int _1781 = _1719 * _1775;
    int _1783 = _1781 + _1555;
    float _1785 = _1779;
    if (_1019)
    {
        _1785 = _1767;
    }
    float _1787 = _1785;
    int _1789 = _1725 * _1755;
    int _1791 = _1789 + _1533;
    float _1793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1795 = _1217 + _1777;
    bool _1797 = uint(_1783) >= uint(_1515);
    int _1799 = _1533 ^ _1379;
    bool _1801 = !_1797;
    int _1803 = _1801 ? 0 : (-1);
    bool _1805 = _1769 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1807 = uint(_1791) >= uint(_1379);
    uint _1809 = uint(int(uint(_1799) >> uint(31)));
    int _1811 = ~_1803;
    int _1813 = _1775 + _1811;
    int _1815 = _1813 + 1;
    float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1819 = !_1807;
    int _1821 = _1819 ? 0 : (-1);
    int _1823 = ~int(_1809);
    int _1825 = _1823 + 1;
    int _1827 = ~_1755;
    int _1829 = _1827 + _1821;
    int _1831 = _1829 + 1;
    int _1833 = _1815 ^ _1825;
    bool _1835 = _1379 == 0;
    int _1837 = _1379 * _1831;
    int _1839 = _1837 + _1533;
    int _1841 = ~_1825;
    int _1843 = _1841 + _1833;
    int _1845 = _1843 + 1;
    bool _1847 = _1379 == 0;
    float _1849 = as_type<float>(_1831);
    float _1851 = as_type<float>(_1825);
    if (!_1805)
    {
        _1849 = _1671;
    }
    float _1853 = _1849;
    float _1855 = _1853;
    if (!_1805)
    {
        _1851 = _1677;
    }
    float _1857 = _1851;
    float _1859 = _1857;
    if (!_1805)
    {
        _1743 = _1795;
    }
    float _1861 = _1743;
    bool _1863 = !_1805;
    float _1865 = _1861;
    if (!_1863)
    {
        float _1867 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1871 = _1769 + _1869;
        float _1873 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1875 = rsqrt(_1753);
        float _1877 = _1871 * _1867;
        float _1879 = _1877 * 0.15915493667125701904296875;
        float _1881 = _1879 * 6.283185482025146484375;
        float _1883 = sin(_1881);
        float _1885 = _1879 * 6.283185482025146484375;
        float _1887 = cos(_1885);
        float _1889 = fma(_1883, _1873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1891 = _1875 * _1889;
        float _1893 = fma(_1705, _1891, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1895 = _1887 + (-1.0);
        float _1897 = fma(_1715, _1891, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1901 = _1893 + _1899;
        float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1907 = _1897 + _1905;
        float _1909 = _1901 * _1901;
        float _1911 = fma(_1795, _1887, _1903);
        float _1913 = _1907 * _1907;
        _1865 = _1911;
        _1745 = _1909;
        _1747 = _1913;
        _1855 = _1893;
        _1859 = _1897;
    }
    float _1915 = _1865;
    float _1917 = _1745;
    float _1919 = _1747;
    float _1921 = _1855;
    float _1923 = _1859;
    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1927 = _1915 + _1925;
    bool _1929 = !_1835;
    int _1931 = _1929 ? _1839 : (-1);
    float _1933 = in.m_55.w;
    bool _1935 = !_1847;
    int _1937 = _1935 ? _1845 : (-1);
    float _1939 = fma(_1927, _1927, _1917);
    float _1941 = float(_1931);
    float _1943 = in.m_55.z;
    float _1945 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1947 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1949 = float(_1937);
    float _1951 = _1939 + _1919;
    float _1953 = fma(_1945, _1787, -0.5);
    float _1955 = fma(_1945, _1941, _1619);
    float _1957 = fma(_1947, _1109, -0.5);
    float _1959 = -_1681;
    float _1961 = fma(_1947, _1949, _1959);
    float _1963 = fma(_1679, _1953, _1955);
    float _1965 = sqrt(_1951);
    float _1967 = fma(_1685, _1957, _1961);
    float _1969 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1971 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1979 = _1737 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1985 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1987 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1989 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1997 = _1963 + 0.5;
    float _1999 = _1967 + 0.5;
    out.m_57.y = _1771;
    bool _2001 = _1965 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2003 = isnan(_1965);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2009 = _2005 || _2007;
    out.m_57.z = _1943;
    out.m_57.w = _1933;
    out.m_63.x = _1985;
    out.m_63.y = _1987;
    out.m_63.z = _1989;
    out.m_63.w = _1983;
    float _2011 = _1969;
    if (!_2009)
    {
        _2011 = 1.0;
    }
    float _2013 = _2011;
    out.m_65.x = _1991;
    out.m_65.y = _1993;
    out.m_65.z = _1995;
    out.m_65.w = _1981;
    out.m_67.x = _1997;
    out.m_67.y = _1999;
    bool _2015 = !_2009;
    float _2017 = _2013;
    if (!_2015)
    {
        bool _2019 = _1965 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2021 = isnan(_1965);
        bool _2023 = _2019 || _2021;
        bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2027 = _2023 || _2025;
        if (!_2027)
        {
            float _2029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2031 = _1965 + _2029;
            float _2033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2033;
            float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2041 = 1.0 / _2035;
            float _2043 = _2031 * _2041;
            float _2045 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2017 = _2045;
            _2047 = true;
        }
        else
        {
            bool _2049 = _1965 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2051 = isnan(_1965);
            bool _2053 = _2049 || _2051;
            bool _2055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2057 = _2053 || _2055;
            if (!_2057)
            {
                float _2059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2061 = _1965 + _2059;
                float _2063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2065 = _2063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2069 = _2067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2071 = 1.0 / _2065;
                float _2073 = _2061 * _2071;
                float _2075 = fma(_2073, _2069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2017 = _2075;
                _2047 = true;
            }
            else
            {
                _2017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2047 = false;
    float _2077 = _2017;
    float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2081 = _1915 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2085 = _1921 + _2083;
    float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2089 = _1923 + _2087;
    float _2091 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2093 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2095 = fma(_2089, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -_1355;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2091);
    float _2101 = -_1363;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2093);
    float _2105 = -_1385;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2095);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2111 = _2099 + _2109;
    float _2113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2115 = _2103 + _2113;
    float _2117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2119 = _2107 + _2117;
    float _2121 = _2111 * _2111;
    float _2123 = fma(_2115, _2115, _2121);
    float _2125 = fma(_2119, _2119, _2123);
    float _2127 = rsqrt(_2125);
    float _2129 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2131 = _2115 * _2129;
    float _2133 = _2119 * _2129;
    float _2135 = _2131 * _2131;
    float _2137 = _2133 * _2133;
    float _2139 = _2135 + _2137;
    float _2141 = sqrt(_2139);
    bool _2143 = _2141 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2147 = _2141 + _2145;
    float _2149 = _2127;
    float _2151 = _2139;
    float _2153 = _2147;
    float _2155 = _2089;
    float _2157 = _2111;
    float _2159 = _2129;
    float _2161 = _2131;
    if (_2143)
    {
        float _2163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2149 = _2163;
    }
    float _2165 = _2149;
    if (_2143)
    {
        float _2167 = rsqrt(_2139);
        _2151 = _2167;
    }
    float _2169 = _2151;
    if (_2143)
    {
        float _2171 = _2147 * _2165;
        _2153 = _2171;
    }
    float _2173 = _2153;
    if (_2143)
    {
        float _2175 = _2173 * 0.15915493667125701904296875;
        _2155 = _2175;
    }
    float _2177 = _2155;
    float _2179 = _2165;
    float _2181 = _2177;
    if (_2143)
    {
        float _2183 = _2177 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        _2179 = _2185;
    }
    float _2187 = _2179;
    float _2189 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2191 = precise::max(0.0, _2189);
    float _2193 = _2119;
    float _2195 = _2191;
    if (_2143)
    {
        float _2197 = _2177 * 6.283185482025146484375;
        float _2199 = cos(_2197);
        _2193 = _2199;
    }
    float _2201 = _2193;
    float _2203 = -_2129;
    float _2205 = -_2191;
    float _2207 = fma(_2111, _2203, _2205);
    if (!_2143)
    {
        _2157 = _2133;
    }
    float _2209 = _2157;
    float _2211 = _2209;
    if (_2143)
    {
        float _2213 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2213;
    }
    float _2215 = _2195;
    float _2217 = _2187;
    float _2219 = _2215;
    if (_2143)
    {
        float _2221 = fma(_2187, _2215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2217 = _2221;
    }
    float _2223 = _2217;
    float _2225 = _2223;
    float _2227 = _2201;
    if (_2143)
    {
        float _2229 = _2201 + (-1.0);
        _2219 = _2229;
    }
    float _2231 = _2219;
    float _2233 = _2231;
    if (_2143)
    {
        float _2235 = _2169 * _2223;
        _2159 = _2235;
    }
    float _2237 = _2159;
    if (!_2143)
    {
        _2225 = _2207;
    }
    float _2239 = _2225;
    float _2241 = sqrt(_2125);
    float _2243 = _2239;
    if (_2143)
    {
        float _2245 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2181 = _2245;
    }
    float _2247 = _2181;
    if (_2143)
    {
        float _2249 = _2131 * _2237;
        _2161 = _2249;
    }
    float _2251 = _2161;
    if (!_2143)
    {
        _2233 = _2135;
    }
    float _2253 = _2233;
    float _2255 = _2253;
    if (_2143)
    {
        float _2257 = _2133 * _2237;
        _2211 = _2257;
    }
    float _2259 = _2211;
    if (_2143)
    {
        float _2261 = fma(_2207, _2201, _2247);
        _2243 = _2261;
    }
    float _2263 = _2243;
    if (_2143)
    {
        float _2265 = _2251 * _2251;
        _2255 = _2265;
    }
    float _2267 = _2255;
    if (!_2143)
    {
        _2227 = _2137;
    }
    float _2269 = _2227;
    float _2271 = _2269;
    if (_2143)
    {
        float _2273 = _2259 * _2259;
        _2271 = _2273;
    }
    float _2275 = _2271;
    float _2277 = fma(_2263, _2263, _2267);
    float _2279 = _2277 + _2275;
    float _2281 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2285 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2283);
    float _2287 = precise::clamp(_2285, 0.0, 1.0);
    float _2289 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2291 = rsqrt(_2279);
    float _2293 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2281);
    float _2295 = -_2287;
    float _2297 = _2295 + 1.0;
    float _2299 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2301 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2289);
    float _2303 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2305 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2293);
    float _2307 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2299);
    float _2309 = abs(_2297);
    float _2311 = log2(_2309);
    float _2313 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2301);
    float _2315 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2317 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2307);
    float _2319 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2303);
    float _2321 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2323 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2325 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2327 = _2291 * _2251;
    float _2329 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2319);
    float _2331 = _2317 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2333 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2335 = _2291 * _2263;
    float _2337 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2339 = -_2325;
    float _2341 = fma(_2339, _2323, 1.0);
    float _2343 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2333);
    float _2345 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2347 = _2291 * _2259;
    float _2349 = -_2337;
    float _2351 = fma(_2335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2349);
    float _2353 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2355 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2343);
    float _2357 = log2(_2341);
    float _2359 = -_2347;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2351);
    float _2363 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2365 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2355);
    float _2367 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2369 = fma(_2361, -0.5, 0.5);
    float _2371 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2363);
    float _2373 = fma(_2361, 0.5, 0.5);
    float _2375 = exp2(_2345);
    float _2377 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2367);
    float _2379 = _2335 + 1.0;
    float _2381 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2371);
    float _2383 = fma(_2373, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2385 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2377);
    float _2387 = 1.0 / _2365;
    float _2389 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2385);
    float _2391 = fma(_2373, _2383, -0.212114393711090087890625);
    float _2393 = _2357 * 0.693147182464599609375;
    float _2395 = fma(_2373, _2391, 1.570728778839111328125);
    float _2397 = sqrt(_2369);
    float _2399 = -_2335;
    float _2401 = fma(_2375, _2379, _2399);
    float _2403 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2381);
    float _2405 = fma(_2401, 0.5, 0.5);
    float _2407 = _2403 * _2387;
    float _2409 = _2389 * _2387;
    float _2411 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2413 = fma(_2407, 0.5, 0.5);
    float _2415 = fma(_2409, -0.5, 0.5);
    float _2417 = _2397 * 0.636619746685028076171875;
    float3 _6345 = float3(_2413, _2415, _2411);
    float _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6345, float3(0.0), isnan(_6345)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6345, float3(0.0), isnan(_6345)), level(0.0)).x;
    float3 _6356 = float3(_2413, _2415, _2411);
    float4 _2422 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6356, float3(0.0), isnan(_6356)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6356, float3(0.0), isnan(_6356)), level(0.0)).xyzw;
    float _2424 = _2422.x;
    float _2426 = _2422.y;
    float _2428 = _2422.z;
    float _2430 = _2422.w;
    float _2432 = -_2395;
    float _2434 = fma(_2417, _2432, 1.0);
    float2 _6378 = float2(_2434, _2405);
    float3 _2438 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6378, float2(0.0), isnan(_6378)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6378, float2(0.0), isnan(_6378)), level(0.0)).xyz;
    float _2440 = _2438.x;
    float _2442 = _2438.y;
    float _2444 = _2438.z;
    float _2446 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2448 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2450 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2448);
    float _2452 = exp2(_2446);
    float _2454 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2450);
    float _2456 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2454);
    float _2458 = _2456 + _2365;
    out.gl_Position.x = _2403;
    out.gl_Position.y = _2389;
    out.gl_Position.z = _2456;
    out.gl_Position.w = _2365;
    float _2460 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2462 = _2458 * 0.5;
    float _2464 = -_2452;
    float _2466 = _2464 + 1.0;
    out.m_47.x = _2460;
    float _2468 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2462;
    out.m_69.w = _2365;
    float _2470 = _2468 * _2419;
    float _2472 = -_2468;
    float _2474 = _2472 + 1.0;
    float _2476 = _2430 * _2470;
    float _2478 = _2444 * _2470;
    float _2480 = fma(_2440, _2476, _2424);
    float _2482 = fma(_2442, _2476, _2426);
    float _2484 = _2430 * _2474;
    float _2486 = fma(_2430, _2478, _2428);
    out.m_71.x = _2480;
    out.m_71.y = _2482;
    out.m_71.z = _2486;
    out.m_71.w = _2484;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2047 = false;
    bool _556 = false;
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
        float _2543 = as_type<float>(_106);
        out.gl_Position.z = _2543;
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
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2612 = as_type<float>(_142);
        out.gl_Position.z = _2612;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _164 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _162);
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _166);
    float _170 = _166;
    float _172 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _174 = _150;
    if (!_160)
    {
        float _176 = _150 * _150;
        float _178 = _176 * 0.5;
        _170 = _178;
    }
    float _180 = _170;
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _164);
    float _184 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _168);
    float _186 = _180;
    if (!_160)
    {
        float _188 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_160;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = exp2(_206);
        float _210 = _204 * 0.693147182464599609375;
        float _212 = 1.0 / _210;
        float _214 = 1.0 / _202;
        float _216 = _208 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _212, _150);
        float _222 = _220 * _214;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
        _172 = _208;
    }
    float _226 = _194;
    float _228 = _172;
    bool _230 = !_160;
    float _232 = _228;
    if (!_230)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _150 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _174 = _252;
        _232 = _242;
    }
    float _254 = _174;
    float _256 = _232;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _256;
    float _266 = _258;
    float _268 = _262;
    if (!_160)
    {
        float _270 = _124 * _124;
        float _272 = _270 * 0.5;
        _264 = _272;
    }
    float _274 = _264;
    float _276 = fma(_254, _144, _258);
    float _278 = fma(_254, _146, _260);
    float _280 = fma(_254, _148, _262);
    if (!_160)
    {
        float _282 = _274 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _282;
    }
    float _284 = _266;
    bool _286 = !_160;
    float _288 = _284;
    if (!_286)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _124 * _292;
        float _302 = 1.0 / _296;
        float _304 = _298 * 0.693147182464599609375;
        float _306 = exp2(_300);
        float _308 = 1.0 / _304;
        float _310 = _306 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _308, _124);
        float _316 = _314 * _302;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _318;
        _268 = _306;
    }
    float _320 = _288;
    float _322 = _268;
    float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = _322;
    if (!_160)
    {
        _326 = _124;
    }
    float _328 = _326;
    bool _330 = !_160;
    float _332 = _328;
    if (!_330)
    {
        float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _336 = log2(_334);
        float _338 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _340 = _338 + 1.0;
        float _342 = 1.0 / _340;
        float _344 = _124 * _336;
        float _346 = exp2(_344);
        float _348 = -_346;
        float _350 = _348 + 1.0;
        float _352 = _350 * _342;
        _332 = _352;
    }
    float _354 = _332;
    float _356 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _358 = fma(_354, _146, _324);
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _362 = fma(_354, _144, _356);
    float _364 = -_358;
    float _366 = _278 + _364;
    float _368 = fma(_354, _148, _360);
    float _370 = -_362;
    float _372 = _276 + _370;
    float _374 = _366 * _366;
    float _376 = -_368;
    float _378 = _280 + _376;
    float _380 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _382 = sqrt(_182);
    float _384 = fma(_372, _372, _374);
    float _386 = in.m_51.w;
    float _388 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _380);
    float _390 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _392 = fma(_378, _378, _384);
    float _394 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _396 = sqrt(_184);
    float _398 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].y, _390);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].z, _394);
    float _402 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _388);
    float _404 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _406 = sqrt(_392);
    float _408 = in.m_44.x;
    float _410 = in.m_44.y;
    float _412 = in.m_44.z;
    float _414 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].x, _404);
    float _418 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].z, _400);
    float _420 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].w, _414);
    float _422 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].x, _416);
    float _424 = sqrt(_402);
    float _426 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].y, _398);
    float _428 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].w, _420);
    float _430 = _382 * _422;
    float _432 = _396 * _426;
    bool _434 = _406 >= 9.9999999747524270787835121154785e-07;
    bool _436 = isnan(_406);
    bool _438 = _434 || _436;
    bool _440 = isnan(9.9999999747524270787835121154785e-07);
    bool _442 = _438 || _440;
    float _444 = _432 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _446 = _432 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _448 = _432 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _450 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _444);
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _446);
    float _454 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[26].x, _448);
    float _456 = _424 * _418;
    float _458 = fma(_276, _386, _408);
    float _460 = fma(_278, _386, _410);
    float _462 = fma(_280, _386, _412);
    float _464 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[24].z, _450);
    float _466 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[25].z, _452);
    float _468 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[26].z, _454);
    float _470 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[24].w, _464);
    float _472 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[25].w, _466);
    float _474 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[26].w, _468);
    float _476 = _472;
    float _478 = _470;
    float _480 = _474;
    if (!_442)
    {
        bool _482 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _484 = !_482;
        if (!_484)
        {
            float _486 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _488 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _490 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _492 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _486);
            float _494 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _488);
            float _496 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _490);
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _492);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _494);
            float _502 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _496);
            float _506 = _396 * _498;
            float _508 = _382 * _500;
            float _510 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _502);
            float _512 = _424 * _504;
            float _514 = _506 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _516 = _506 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _518 = _506 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _520 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _510);
            float _522 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[25].x, _514);
            float _524 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[24].x, _516);
            float _526 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[26].x, _518);
            float _528 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[25].z, _522);
            float _530 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[24].z, _524);
            float _532 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[26].z, _526);
            float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].w, _528);
            float _536 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].w, _530);
            float _538 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].w, _532);
            float _540 = _534 * _534;
            float _542 = fma(_536, _536, _540);
            float _544 = fma(_538, _538, _542);
            float _546 = rsqrt(_544);
            float _548 = _546 * 9.9999999747524270787835121154785e-07;
            float _550 = _536 * _548;
            float _552 = _534 * _548;
            float _554 = _538 * _548;
            _476 = _552;
            _478 = _550;
            _480 = _554;
            _556 = true;
        }
        else
        {
            float _558 = _146 * _146;
            float _560 = fma(_144, _144, _558);
            float _562 = fma(_148, _148, _560);
            float _564 = sqrt(_562);
            bool _566 = _564 >= 9.9999999747524270787835121154785e-07;
            bool _568 = isnan(_564);
            bool _570 = _566 || _568;
            bool _572 = isnan(9.9999999747524270787835121154785e-07);
            bool _574 = _570 || _572;
            if (!_574)
            {
                float _576 = _410 * _410;
                float _578 = fma(_408, _408, _576);
                float _580 = fma(_412, _412, _578);
                float _582 = sqrt(_580);
                bool _584 = _582 >= 9.9999999747524270787835121154785e-07;
                bool _586 = isnan(_582);
                bool _588 = _584 || _586;
                bool _590 = isnan(9.9999999747524270787835121154785e-07);
                bool _592 = _588 || _590;
                if (!_592)
                {
                    float _594 = _396 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _596 = _382 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _598 = _424 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _600 = _594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _602 = _594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _604 = _594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _606 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _600);
                    float _608 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _602);
                    float _610 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _604);
                    float _612 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[25].z, _606);
                    float _614 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[24].z, _608);
                    float _616 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[26].z, _610);
                    float _618 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _612);
                    float _620 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _614);
                    float _622 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _616);
                    float _624 = _618 * _618;
                    float _626 = fma(_620, _620, _624);
                    float _628 = fma(_622, _622, _626);
                    float _630 = rsqrt(_628);
                    float _632 = _630 * 9.9999999747524270787835121154785e-07;
                    float _634 = _620 * _632;
                    float _636 = _618 * _632;
                    float _638 = _622 * _632;
                    _476 = _636;
                    _478 = _634;
                    _480 = _638;
                    _556 = true;
                }
                else
                {
                    float _640 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _642 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _644 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _646 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _648 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].y, _640);
                    float _650 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].x, _642);
                    float _652 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].z, _644);
                    float _654 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].w, _646);
                    float _656 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].y, _648);
                    float _658 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].x, _650);
                    float _660 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].z, _652);
                    float _662 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].w, _654);
                    float _664 = _396 * _656;
                    float _666 = _382 * _658;
                    float _668 = _424 * _660;
                    float _670 = _664 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _672 = _664 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _674 = _664 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _676 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].x, _670);
                    float _678 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _672);
                    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].x, _674);
                    float _682 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[25].z, _676);
                    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[24].z, _678);
                    float _686 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[26].z, _680);
                    float _688 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[25].w, _682);
                    float _690 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[24].w, _684);
                    float _692 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[26].w, _686);
                    float _694 = _688 * _688;
                    float _696 = fma(_690, _690, _694);
                    float _698 = fma(_692, _692, _696);
                    float _700 = rsqrt(_698);
                    float _702 = _700 * 9.9999999747524270787835121154785e-07;
                    float _704 = _690 * _702;
                    float _706 = _688 * _702;
                    float _708 = _692 * _702;
                    _476 = _706;
                    _478 = _704;
                    _480 = _708;
                    _556 = true;
                }
            }
            else
            {
                float _710 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _712 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _714 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _716 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _718 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].y, _710);
                float _720 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].x, _712);
                float _722 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].z, _714);
                float _724 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].w, _716);
                float _726 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].y, _718);
                float _728 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].x, _720);
                float _730 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].z, _722);
                float _732 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].w, _724);
                float _734 = _396 * _726;
                float _736 = _382 * _728;
                float _738 = _424 * _730;
                float _740 = _734 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _742 = _734 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _744 = _734 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _746 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].x, _740);
                float _748 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].x, _742);
                float _750 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].x, _744);
                float _752 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[25].z, _746);
                float _754 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[24].z, _748);
                float _756 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[26].z, _750);
                float _758 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[25].w, _752);
                float _760 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[24].w, _754);
                float _762 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[26].w, _756);
                float _764 = _758 * _758;
                float _766 = fma(_760, _760, _764);
                float _768 = fma(_762, _762, _766);
                float _770 = rsqrt(_768);
                float _772 = _770 * 9.9999999747524270787835121154785e-07;
                float _774 = _760 * _772;
                float _776 = _758 * _772;
                float _778 = _762 * _772;
                _476 = _776;
                _478 = _774;
                _480 = _778;
            }
        }
    }
    _556 = false;
    float _780 = _476;
    float _782 = _478;
    float _784 = _480;
    float _786 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _788 = int(_786);
    float _790 = in.m_53.x;
    float _792 = float(_90);
    float _794 = in.m_55.x;
    float _796 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _798 = int(_796);
    float _800 = float(_788);
    float _802 = 1.0 / _792;
    float _804 = float(uint(_798));
    float _806 = 1.0 / _800;
    int _808 = ~_798;
    int _810 = _808 + 1;
    int _812 = ~_798;
    int _814 = _812 + 1;
    out.m_57.x = _794;
    int _816 = ~_798;
    int _818 = _816 + 1;
    float _820 = 1.0 / _804;
    float _822 = _124 * _806;
    float _824 = trunc(_822);
    int _826 = int(_824);
    int _828 = as_type<int>(_820) + (-2);
    float _830 = float(uint(_826));
    float _832 = float(_826);
    float _834 = as_type<float>(_828) * _830;
    float _836 = trunc(_834);
    float _838 = precise::max(_836, 0.0);
    uint _841 = uint(_838);
    int _843 = _810 * int(_841);
    int _845 = _843 + _826;
    float _847 = float(uint(_845));
    float _849 = as_type<float>(_828) * _847;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _853 = _851 != 0;
    float _855 = trunc(_849);
    float _857 = precise::max(_855, 0.0);
    uint _859 = uint(_857);
    bool _861 = !_853;
    float _863 = _861 ? 7.345489978790283203125 : 1.0;
    float _865 = _863 * _790;
    int _867 = int(_841) + int(_859);
    float _869 = floor(_865);
    float _871 = float(_798);
    int _873 = _814 * _867;
    int _875 = _873 + _826;
    bool _877 = _832 >= _871;
    bool _879 = isnan(_832);
    bool _881 = _877 || _879;
    bool _883 = isnan(_871);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    bool _889 = uint(_875) >= uint(_798);
    float _891 = trunc(_887);
    int _893 = int(_891);
    bool _895 = !_889;
    int _897 = _895 ? 0 : (-1);
    bool _899 = _798 == 0;
    float _901 = -_869;
    float _903 = _865 + _901;
    int _905 = ~_867;
    int _907 = _905 + _897;
    int _909 = _907 + 1;
    float _911 = _903 * _871;
    float _913 = _124 * _871;
    int _915 = _798 * _909;
    int _917 = _915 + _826;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _921 = _919 != 0;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _929 = _927 != 0;
    float _931 = _913 * _802;
    float _933 = trunc(_911);
    int _935 = int(_933);
    int _937 = ~_893;
    int _939 = _937 + 1;
    int _941 = _939 + 1;
    bool _943 = !_899;
    int _945 = _943 ? _917 : (-1);
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _949 = _947 != 0;
    int _951 = _798 + (-1);
    float _953 = trunc(_931);
    int _955 = int(_953);
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _959 = _957 != 0;
    int _961 = _945 * _941;
    bool _963 = !_925;
    int _965 = _963 ? 0 : 1;
    bool _967 = !_959;
    int _969 = _967 ? 0 : 1;
    int _971 = _893 * _951;
    int _973 = _971 + _961;
    int _975 = abs(_965);
    bool _977 = !_921;
    int _979 = _977 ? 0 : 1;
    bool _981 = !_929;
    int _983 = _981 ? 0 : 1;
    int _985 = abs(_969);
    int _987 = abs(_979);
    int _989 = abs(_983);
    int _991 = _973 * _975;
    bool _993 = !_949;
    int _995 = _993 ? 0 : 1;
    int _997 = _935 * _985;
    int _999 = _997 + _826;
    int _1001 = _955 * _987;
    int _1003 = _1001 + _991;
    int _1005 = abs(_995);
    float _1007 = in.m_59.y;
    int _1009 = ~_798;
    int _1011 = _1009 + 1;
    int _1013 = _999 * _989;
    int _1015 = _1013 + _1003;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1023 = _1021 != 0;
    int _1025 = _935 * _1005;
    int _1027 = _1025 + _1015;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1031 = _1029 != 0;
    float _1033 = in.m_53.y;
    float _1035 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1037 = float(uint(_1027));
    float _1039 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1035);
    float _1041 = as_type<float>(_828) * _1037;
    float _1043 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1039);
    float _1045 = in.m_51.x;
    float _1047 = in.m_51.y;
    float _1049 = in.m_51.z;
    float _1051 = trunc(_1041);
    float _1053 = precise::max(_1051, 0.0);
    uint _1055 = uint(_1053);
    float _1057 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _1059 = _1033 > 0.5;
    float _1061 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1057);
    int _1063 = _1011 * int(_1055);
    int _1065 = _1063 + _1027;
    float _1067 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1061);
    float _1069 = float(uint(_1065));
    float _1071 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1073 = float(uint(_999));
    float _1075 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1077 = -_1007;
    float _1079 = _1077 + 1.0;
    float _1081 = as_type<float>(_828) * _1069;
    float _1083 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1085 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1087 = as_type<float>(_828) * _1073;
    float _1089 = trunc(_1081);
    float _1091 = precise::max(_1089, 0.0);
    uint _1093 = uint(_1091);
    float _1095 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1083);
    float _1097 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1085);
    int _1099 = ~_798;
    int _1101 = _1099 + 1;
    float _1103 = _1067 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1105 = _1007;
    if (_1023)
    {
        float _1107 = _1059 ? _1079 : _1007;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _1113 = ~_798;
    int _1115 = _1113 + 1;
    float _1117 = trunc(_1087);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1095);
    float _1125 = _396 * _1103;
    float _1127 = _382 * _1111;
    float _1129 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1097);
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1137 = int(_1055) + int(_1093);
    float _1139 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1141 = _424 * _1131;
    float _1143 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1133);
    float _1145 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _1147 = _1101 * _1137;
    int _1149 = _1147 + _1027;
    float _1151 = _1139 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1153 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1155 = _1115 * int(_1121);
    int _1157 = _1155 + _999;
    bool _1159 = uint(_1149) >= uint(_798);
    float _1161 = float(uint(_1157));
    bool _1163 = !_1159;
    int _1165 = _1163 ? 0 : (-1);
    float _1167 = as_type<float>(_828) * _1161;
    int _1169 = ~_1137;
    int _1171 = _1169 + _1165;
    int _1173 = _1171 + 1;
    float _1175 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1177 = _780 * _780;
    float _1179 = trunc(_1167);
    float _1181 = precise::max(_1179, 0.0);
    uint _1183 = uint(_1181);
    int _1185 = _798 * _1173;
    int _1187 = _1185 + _1027;
    float _1189 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1175);
    float _1191 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1135);
    float _1193 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1143);
    bool _1195 = !_899;
    int _1197 = _1195 ? _1187 : (-1);
    float _1199 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1189);
    float _1201 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1191);
    float _1203 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1193);
    int _1205 = _1197 >> 31;
    float _1207 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1199);
    float _1209 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1201);
    float _1211 = _1203 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    int _1213 = _1205 & 3;
    float _1215 = fma(_782, _782, _1177);
    float _1217 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1221 = _1211 + _1219;
    int _1223 = _1197 + _1213;
    float _1225 = fma(_784, _784, _1215);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1229 = _1217 + _1227;
    float _1231 = _1209 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    int _1233 = _1223 >> 2;
    float _1235 = in.m_61.x;
    float _1237 = in.m_61.y;
    float _1239 = in.m_61.z;
    float _1241 = _1229 * _1229;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1245 = _1231 + _1243;
    int _1247 = _1233 << 4;
    int _1249 = _1247 + 368;
    float _1251 = rsqrt(_1225);
    float _1253 = fma(_1221, _1221, _1241);
    int _1255 = int(_1121) + int(_1183);
    uint _1257 = uint(int(uint(_1249) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[int(_1267)][_1269];
    int _1273 = _1197 & 3;
    bool _1275 = _1273 != 0;
    float _1277 = fma(_1245, _1245, _1253);
    int _1279 = _1197 & 3;
    bool _1281 = _1279 != 0;
    int _1283 = _818 * _1255;
    int _1285 = _1283 + _999;
    bool _1287 = _1279 != 3;
    int _1289 = _1249 + 8;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    float _1307 = rsqrt(_1277);
    bool _1309 = uint(_1279) > 1u;
    int _1311 = _1275 ? 0 : 1;
    float _1313 = _1251 * _782;
    bool _1315 = uint(_1279) >= 2u;
    float _1317 = _1251 * _780;
    int _1319 = ~_1311;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1235);
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1239);
    int _1329 = _1315 ? 0 : 1;
    float _1331 = _1251 * _784;
    bool _1333 = !_1281;
    int _1335 = _1333 ? 0 : 1;
    float _1337 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1237);
    int _1339 = ~_1329;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    int _1345 = _1343;
    int _1347 = _1323;
    if (_1287)
    {
        int _1349 = ~_1329;
        int _1351 = _1349 + 1;
        _1345 = _1351;
    }
    int _1353 = _1345;
    float _1355 = _1229 * _1307;
    if (!_1309)
    {
        int _1357 = ~_1311;
        int _1359 = _1357 + 1;
        _1347 = _1359;
    }
    int _1361 = _1347;
    float _1363 = _1221 * _1307;
    bool _1365 = uint(_1285) >= uint(_798);
    float _1367 = -_1355;
    float _1369 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1229);
    int _1371 = abs(_1361);
    float _1373 = -_1363;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _1377 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1379 = int(_1377);
    float _1381 = _1369 * _1369;
    int _1383 = abs(_1335);
    float _1385 = _1245 * _1307;
    int _1387 = abs(_1353);
    float _1389 = fma(_1375, _1375, _1381);
    int _1391 = ~_1371;
    int _1393 = _1391 + 1;
    int _1395 = _1393 + 1;
    float _1397 = -_1385;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    int _1401 = ~_1383;
    int _1403 = _1401 + 1;
    int _1405 = _1403 + 1;
    float _1407 = fma(_1399, _1399, _1389);
    bool _1409 = _1279 != 3;
    float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1413 = _1317 * _1411;
    bool _1415 = !_1365;
    int _1417 = _1415 ? 0 : (-1);
    int _1419 = _1395 * as_type<int>(_1271);
    int _1421 = ~_1387;
    int _1423 = _1421 + 1;
    int _1425 = _1423 + 1;
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1429 = -_1413;
    float _1431 = fma(_1331, _1427, _1429);
    float _1433 = float(uint(_1379));
    int _1435 = _1405 * as_type<int>(_1263);
    int _1437 = _1435 + _1419;
    int _1439 = ~_1255;
    int _1441 = _1439 + _1417;
    int _1443 = _1441 + 1;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1447 = _1313 * _1445;
    float _1449 = 1.0 / _1433;
    int _1451 = _1425 * as_type<int>(_1297);
    int _1453 = _1451 + _1437;
    bool _1455 = !_1409;
    int _1457 = _1455 ? 0 : (-1);
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1461 = _1331 * _1459;
    bool _1463 = !_1031;
    int _1465 = _1463 ? 0 : 1;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1469 = -_1447;
    float _1471 = fma(_1317, _1467, _1469);
    int _1473 = abs(_1457);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1477 = -_1461;
    float _1479 = fma(_1313, _1475, _1477);
    float _1481 = sqrt(_1407);
    int _1483 = abs(_1465);
    float _1485 = _1479 * _1479;
    int _1487 = ~_1473;
    int _1489 = _1487 + 1;
    int _1491 = _1489 + 1;
    float _1493 = fma(_1431, _1431, _1485);
    int _1495 = _798 * _1443;
    int _1497 = _1495 + _999;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1501 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1503 = _1491 * as_type<int>(_1305);
    int _1505 = _1503 + _1453;
    int _1507 = ~_1483;
    int _1509 = _1507 + 1;
    int _1511 = _1509 + 1;
    float _1513 = fma(_1471, _1471, _1493);
    int _1515 = abs(_1379);
    float _1517 = -_1499;
    float _1519 = fma(_1501, 2.0, _1517);
    bool _1521 = !_899;
    int _1523 = _1521 ? _1497 : (-1);
    int _1525 = _1505 * _1511;
    float _1527 = rsqrt(_1513);
    float _1529 = _1307 * _1481;
    int _1531 = _1523 * _1483;
    int _1533 = _1531 + _1525;
    float _1535 = float(uint(_1515));
    float _1537 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1539 = as_type<int>(_1449) + (-2);
    float _1541 = _1153 * _1529;
    float _1543 = float(uint(_1533));
    float _1545 = _1537 * _1529;
    float _1547 = 1.0 / _1535;
    float _1549 = _1151 * _1529;
    float _1551 = _1541 * _1325;
    float _1553 = as_type<float>(_1539) * _1543;
    int _1555 = abs(_1533);
    float _1557 = _1549 * _1327;
    float _1559 = _1545 * _1337;
    float _1561 = _1471 * _1527;
    float _1563 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1565 = trunc(_1553);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    int _1571 = ~_1379;
    int _1573 = _1571 + 1;
    float _1575 = _1431 * _1527;
    float _1577 = _1479 * _1527;
    float _1579 = _1563 * _790;
    float _1581 = _1317 * _1561;
    int _1583 = as_type<int>(_1547) + (-2);
    float _1585 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1587 = float(uint(_1555));
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1591 = -_1581;
    float _1593 = fma(_1331, _1577, _1591);
    bool _1595 = _790 > 0.5;
    bool _1597 = _1595 && _1019;
    float _1599 = trunc(_1579);
    int _1601 = int(_1599);
    float _1603 = as_type<float>(_1583) * _1587;
    float _1605 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1589);
    int _1607 = _1573 * int(_1569);
    int _1609 = _1607 + _1533;
    int _1611 = ~_1515;
    int _1613 = _1611 + 1;
    float _1615 = _1559 * _1313;
    float _1617 = -_124;
    float _1619 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1519);
    float _1621 = trunc(_1603);
    float _1623 = precise::max(_1621, 0.0);
    uint _1625 = uint(_1623);
    float _1627 = float(uint(_1609));
    float _1629 = fma(_1551, _1575, _1615);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1633 = _1331 * _1575;
    float _1635 = as_type<float>(_1539) * _1627;
    float _1637 = fma(_1585, -2.0, _1631);
    float _1639 = fma(_1557, _1593, _1629);
    float _1641 = _1313 * _1577;
    float _1643 = _1559 * _1331;
    float _1645 = in.m_59.x;
    float _1647 = trunc(_1635);
    float _1649 = precise::max(_1647, 0.0);
    uint _1651 = uint(_1649);
    float _1653 = -_1641;
    float _1655 = fma(_1317, _1575, _1653);
    float _1657 = fma(_1551, _1561, _1643);
    int _1659 = _1613 * int(_1625);
    int _1661 = _1659 + _1555;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1665 = _1601 << 4;
    int _1667 = _1665 + 1712;
    float _1669 = fma(_1557, _1655, _1657);
    float _1671 = _1211 + _1639;
    float _1673 = float(uint(_1661));
    float _1675 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1663);
    float _1677 = _1231 + _1669;
    float _1679 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1605);
    float _1681 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1637);
    float _1683 = as_type<float>(_1583) * _1673;
    float _1685 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1675);
    uint _1687 = uint(int(uint(_1667) >> uint(2)));
    uint _1689 = uint(int(uint(int(_1687)) >> uint(2)));
    int _1691 = int(_1687) & 3;
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[int(_1689)][_1691];
    int _1695 = int(_1687) + 1;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    int _1699 = _1695 & 3;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[int(_1697)][_1699];
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1705 = _1671 + _1703;
    float _1707 = trunc(_1683);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1715 = _1677 + _1713;
    int _1717 = ~_1515;
    int _1719 = _1717 + 1;
    float _1721 = _1705 * _1705;
    int _1723 = ~_1379;
    int _1725 = _1723 + 1;
    float _1727 = _1715 * _1715;
    int _1729 = _1667 + 8;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[int(_1733)][_1735];
    float _1739 = _1675;
    float _1741 = as_type<float>(_1725);
    float _1743 = as_type<float>(_1533);
    float _1745 = _1721;
    float _1747 = _1727;
    if (_1019)
    {
        _1739 = _1645;
    }
    float _1749 = _1739;
    float _1751 = _1559 * _1317;
    float _1753 = _1721 + _1727;
    int _1755 = int(_1569) + int(_1651);
    float _1757 = -_1633;
    float _1759 = fma(_1313, _1561, _1757);
    float _1761 = _1749;
    if (_1597)
    {
        float _1763 = -_1749;
        float _1765 = _1763 + 1.0;
        _1761 = _1765;
    }
    float _1767 = _1761;
    float _1769 = sqrt(_1753);
    float _1771 = in.m_55.y;
    float _1773 = fma(_1551, _1577, _1751);
    int _1775 = int(_1625) + int(_1711);
    float _1777 = fma(_1557, _1759, _1773);
    if (!_1019)
    {
        _1741 = _1645;
    }
    float _1779 = _1741;
    int _1781 = _1719 * _1775;
    int _1783 = _1781 + _1555;
    float _1785 = _1779;
    if (_1019)
    {
        _1785 = _1767;
    }
    float _1787 = _1785;
    int _1789 = _1725 * _1755;
    int _1791 = _1789 + _1533;
    float _1793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1795 = _1217 + _1777;
    bool _1797 = uint(_1783) >= uint(_1515);
    int _1799 = _1533 ^ _1379;
    bool _1801 = !_1797;
    int _1803 = _1801 ? 0 : (-1);
    bool _1805 = _1769 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1807 = uint(_1791) >= uint(_1379);
    uint _1809 = uint(int(uint(_1799) >> uint(31)));
    int _1811 = ~_1803;
    int _1813 = _1775 + _1811;
    int _1815 = _1813 + 1;
    float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1819 = !_1807;
    int _1821 = _1819 ? 0 : (-1);
    int _1823 = ~int(_1809);
    int _1825 = _1823 + 1;
    int _1827 = ~_1755;
    int _1829 = _1827 + _1821;
    int _1831 = _1829 + 1;
    int _1833 = _1815 ^ _1825;
    bool _1835 = _1379 == 0;
    int _1837 = _1379 * _1831;
    int _1839 = _1837 + _1533;
    int _1841 = ~_1825;
    int _1843 = _1841 + _1833;
    int _1845 = _1843 + 1;
    bool _1847 = _1379 == 0;
    float _1849 = as_type<float>(_1831);
    float _1851 = as_type<float>(_1825);
    if (!_1805)
    {
        _1849 = _1671;
    }
    float _1853 = _1849;
    float _1855 = _1853;
    if (!_1805)
    {
        _1851 = _1677;
    }
    float _1857 = _1851;
    float _1859 = _1857;
    if (!_1805)
    {
        _1743 = _1795;
    }
    float _1861 = _1743;
    bool _1863 = !_1805;
    float _1865 = _1861;
    if (!_1863)
    {
        float _1867 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1871 = _1769 + _1869;
        float _1873 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1875 = rsqrt(_1753);
        float _1877 = _1871 * _1867;
        float _1879 = _1877 * 0.15915493667125701904296875;
        float _1881 = _1879 * 6.283185482025146484375;
        float _1883 = sin(_1881);
        float _1885 = _1879 * 6.283185482025146484375;
        float _1887 = cos(_1885);
        float _1889 = fma(_1883, _1873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1891 = _1875 * _1889;
        float _1893 = fma(_1705, _1891, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1895 = _1887 + (-1.0);
        float _1897 = fma(_1715, _1891, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1901 = _1893 + _1899;
        float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1907 = _1897 + _1905;
        float _1909 = _1901 * _1901;
        float _1911 = fma(_1795, _1887, _1903);
        float _1913 = _1907 * _1907;
        _1865 = _1911;
        _1745 = _1909;
        _1747 = _1913;
        _1855 = _1893;
        _1859 = _1897;
    }
    float _1915 = _1865;
    float _1917 = _1745;
    float _1919 = _1747;
    float _1921 = _1855;
    float _1923 = _1859;
    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1927 = _1915 + _1925;
    bool _1929 = !_1835;
    int _1931 = _1929 ? _1839 : (-1);
    float _1933 = in.m_55.w;
    bool _1935 = !_1847;
    int _1937 = _1935 ? _1845 : (-1);
    float _1939 = fma(_1927, _1927, _1917);
    float _1941 = float(_1931);
    float _1943 = in.m_55.z;
    float _1945 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1947 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1949 = float(_1937);
    float _1951 = _1939 + _1919;
    float _1953 = fma(_1945, _1787, -0.5);
    float _1955 = fma(_1945, _1941, _1619);
    float _1957 = fma(_1947, _1109, -0.5);
    float _1959 = -_1681;
    float _1961 = fma(_1947, _1949, _1959);
    float _1963 = fma(_1679, _1953, _1955);
    float _1965 = sqrt(_1951);
    float _1967 = fma(_1685, _1957, _1961);
    float _1969 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1971 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1979 = _1737 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1985 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1987 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1989 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1997 = _1963 + 0.5;
    float _1999 = _1967 + 0.5;
    out.m_57.y = _1771;
    bool _2001 = _1965 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2003 = isnan(_1965);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2009 = _2005 || _2007;
    out.m_57.z = _1943;
    out.m_57.w = _1933;
    out.m_63.x = _1985;
    out.m_63.y = _1987;
    out.m_63.z = _1989;
    out.m_63.w = _1983;
    float _2011 = _1969;
    if (!_2009)
    {
        _2011 = 1.0;
    }
    float _2013 = _2011;
    out.m_65.x = _1991;
    out.m_65.y = _1993;
    out.m_65.z = _1995;
    out.m_65.w = _1981;
    out.m_67.x = _1997;
    out.m_67.y = _1999;
    bool _2015 = !_2009;
    float _2017 = _2013;
    if (!_2015)
    {
        bool _2019 = _1965 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2021 = isnan(_1965);
        bool _2023 = _2019 || _2021;
        bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2027 = _2023 || _2025;
        if (!_2027)
        {
            float _2029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2031 = _1965 + _2029;
            float _2033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2033;
            float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2041 = 1.0 / _2035;
            float _2043 = _2031 * _2041;
            float _2045 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2017 = _2045;
            _2047 = true;
        }
        else
        {
            bool _2049 = _1965 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2051 = isnan(_1965);
            bool _2053 = _2049 || _2051;
            bool _2055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2057 = _2053 || _2055;
            if (!_2057)
            {
                float _2059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2061 = _1965 + _2059;
                float _2063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2065 = _2063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2069 = _2067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2071 = 1.0 / _2065;
                float _2073 = _2061 * _2071;
                float _2075 = fma(_2073, _2069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2017 = _2075;
                _2047 = true;
            }
            else
            {
                _2017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2047 = false;
    float _2077 = _2017;
    float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2081 = _1915 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2085 = _1921 + _2083;
    float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2089 = _1923 + _2087;
    float _2091 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2093 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2095 = fma(_2089, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -_1355;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2091);
    float _2101 = -_1363;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2093);
    float _2105 = -_1385;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2095);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2111 = _2099 + _2109;
    float _2113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2115 = _2103 + _2113;
    float _2117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2119 = _2107 + _2117;
    float _2121 = _2111 * _2111;
    float _2123 = fma(_2115, _2115, _2121);
    float _2125 = fma(_2119, _2119, _2123);
    float _2127 = rsqrt(_2125);
    float _2129 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2131 = _2115 * _2129;
    float _2133 = _2119 * _2129;
    float _2135 = _2131 * _2131;
    float _2137 = _2133 * _2133;
    float _2139 = _2135 + _2137;
    float _2141 = sqrt(_2139);
    bool _2143 = _2141 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2147 = _2141 + _2145;
    float _2149 = _2127;
    float _2151 = _2139;
    float _2153 = _2147;
    float _2155 = _2089;
    float _2157 = _2111;
    float _2159 = _2129;
    float _2161 = _2131;
    if (_2143)
    {
        float _2163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2149 = _2163;
    }
    float _2165 = _2149;
    if (_2143)
    {
        float _2167 = rsqrt(_2139);
        _2151 = _2167;
    }
    float _2169 = _2151;
    if (_2143)
    {
        float _2171 = _2147 * _2165;
        _2153 = _2171;
    }
    float _2173 = _2153;
    if (_2143)
    {
        float _2175 = _2173 * 0.15915493667125701904296875;
        _2155 = _2175;
    }
    float _2177 = _2155;
    float _2179 = _2165;
    float _2181 = _2177;
    if (_2143)
    {
        float _2183 = _2177 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        _2179 = _2185;
    }
    float _2187 = _2179;
    float _2189 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2191 = precise::max(0.0, _2189);
    float _2193 = _2119;
    float _2195 = _2191;
    if (_2143)
    {
        float _2197 = _2177 * 6.283185482025146484375;
        float _2199 = cos(_2197);
        _2193 = _2199;
    }
    float _2201 = _2193;
    float _2203 = -_2129;
    float _2205 = -_2191;
    float _2207 = fma(_2111, _2203, _2205);
    if (!_2143)
    {
        _2157 = _2133;
    }
    float _2209 = _2157;
    float _2211 = _2209;
    if (_2143)
    {
        float _2213 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2213;
    }
    float _2215 = _2195;
    float _2217 = _2187;
    float _2219 = _2215;
    if (_2143)
    {
        float _2221 = fma(_2187, _2215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2217 = _2221;
    }
    float _2223 = _2217;
    float _2225 = _2223;
    float _2227 = _2201;
    if (_2143)
    {
        float _2229 = _2201 + (-1.0);
        _2219 = _2229;
    }
    float _2231 = _2219;
    float _2233 = _2231;
    if (_2143)
    {
        float _2235 = _2169 * _2223;
        _2159 = _2235;
    }
    float _2237 = _2159;
    if (!_2143)
    {
        _2225 = _2207;
    }
    float _2239 = _2225;
    float _2241 = sqrt(_2125);
    float _2243 = _2239;
    if (_2143)
    {
        float _2245 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2181 = _2245;
    }
    float _2247 = _2181;
    if (_2143)
    {
        float _2249 = _2131 * _2237;
        _2161 = _2249;
    }
    float _2251 = _2161;
    if (!_2143)
    {
        _2233 = _2135;
    }
    float _2253 = _2233;
    float _2255 = _2253;
    if (_2143)
    {
        float _2257 = _2133 * _2237;
        _2211 = _2257;
    }
    float _2259 = _2211;
    if (_2143)
    {
        float _2261 = fma(_2207, _2201, _2247);
        _2243 = _2261;
    }
    float _2263 = _2243;
    if (_2143)
    {
        float _2265 = _2251 * _2251;
        _2255 = _2265;
    }
    float _2267 = _2255;
    if (!_2143)
    {
        _2227 = _2137;
    }
    float _2269 = _2227;
    float _2271 = _2269;
    if (_2143)
    {
        float _2273 = _2259 * _2259;
        _2271 = _2273;
    }
    float _2275 = _2271;
    float _2277 = fma(_2263, _2263, _2267);
    float _2279 = _2277 + _2275;
    float _2281 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2285 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2283);
    float _2287 = precise::clamp(_2285, 0.0, 1.0);
    float _2289 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2291 = rsqrt(_2279);
    float _2293 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2281);
    float _2295 = -_2287;
    float _2297 = _2295 + 1.0;
    float _2299 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2301 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2289);
    float _2303 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2305 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2293);
    float _2307 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2299);
    float _2309 = abs(_2297);
    float _2311 = log2(_2309);
    float _2313 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2301);
    float _2315 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2317 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2307);
    float _2319 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2303);
    float _2321 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2323 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2325 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2327 = _2291 * _2251;
    float _2329 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2319);
    float _2331 = _2317 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2333 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2335 = _2291 * _2263;
    float _2337 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2339 = -_2325;
    float _2341 = fma(_2339, _2323, 1.0);
    float _2343 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2333);
    float _2345 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2347 = _2291 * _2259;
    float _2349 = -_2337;
    float _2351 = fma(_2335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2349);
    float _2353 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2355 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2343);
    float _2357 = log2(_2341);
    float _2359 = -_2347;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2351);
    float _2363 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2365 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2355);
    float _2367 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2369 = fma(_2361, -0.5, 0.5);
    float _2371 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2363);
    float _2373 = fma(_2361, 0.5, 0.5);
    float _2375 = exp2(_2345);
    float _2377 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2367);
    float _2379 = _2335 + 1.0;
    float _2381 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2371);
    float _2383 = fma(_2373, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2385 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2377);
    float _2387 = 1.0 / _2365;
    float _2389 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2385);
    float _2391 = fma(_2373, _2383, -0.212114393711090087890625);
    float _2393 = _2357 * 0.693147182464599609375;
    float _2395 = fma(_2373, _2391, 1.570728778839111328125);
    float _2397 = sqrt(_2369);
    float _2399 = -_2335;
    float _2401 = fma(_2375, _2379, _2399);
    float _2403 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2381);
    float _2405 = fma(_2401, 0.5, 0.5);
    float _2407 = _2403 * _2387;
    float _2409 = _2389 * _2387;
    float _2411 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2413 = fma(_2407, 0.5, 0.5);
    float _2415 = fma(_2409, -0.5, 0.5);
    float _2417 = _2397 * 0.636619746685028076171875;
    float3 _6345 = float3(_2413, _2415, _2411);
    float _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6345, float3(0.0), isnan(_6345)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6345, float3(0.0), isnan(_6345)), level(0.0)).x;
    float3 _6356 = float3(_2413, _2415, _2411);
    float4 _2422 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6356, float3(0.0), isnan(_6356)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6356, float3(0.0), isnan(_6356)), level(0.0)).xyzw;
    float _2424 = _2422.x;
    float _2426 = _2422.y;
    float _2428 = _2422.z;
    float _2430 = _2422.w;
    float _2432 = -_2395;
    float _2434 = fma(_2417, _2432, 1.0);
    float2 _6378 = float2(_2434, _2405);
    float3 _2438 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6378, float2(0.0), isnan(_6378)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6378, float2(0.0), isnan(_6378)), level(0.0)).xyz;
    float _2440 = _2438.x;
    float _2442 = _2438.y;
    float _2444 = _2438.z;
    float _2446 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2448 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2450 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2448);
    float _2452 = exp2(_2446);
    float _2454 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2450);
    float _2456 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2454);
    float _2458 = _2456 + _2365;
    out.gl_Position.x = _2403;
    out.gl_Position.y = _2389;
    out.gl_Position.z = _2456;
    out.gl_Position.w = _2365;
    float _2460 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2462 = _2458 * 0.5;
    float _2464 = -_2452;
    float _2466 = _2464 + 1.0;
    out.m_47.x = _2460;
    float _2468 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2462;
    out.m_69.w = _2365;
    float _2470 = _2468 * _2419;
    float _2472 = -_2468;
    float _2474 = _2472 + 1.0;
    float _2476 = _2430 * _2470;
    float _2478 = _2444 * _2470;
    float _2480 = fma(_2440, _2476, _2424);
    float _2482 = fma(_2442, _2476, _2426);
    float _2484 = _2430 * _2474;
    float _2486 = fma(_2430, _2478, _2428);
    out.m_71.x = _2480;
    out.m_71.y = _2482;
    out.m_71.z = _2486;
    out.m_71.w = _2484;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2047 = false;
    bool _556 = false;
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
        float _2543 = as_type<float>(_106);
        out.gl_Position.z = _2543;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2612 = as_type<float>(_142);
        out.gl_Position.z = _2612;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _164 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _162);
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _166);
    float _170 = _166;
    float _172 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _174 = _150;
    if (!_160)
    {
        float _176 = _150 * _150;
        float _178 = _176 * 0.5;
        _170 = _178;
    }
    float _180 = _170;
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _164);
    float _184 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _168);
    float _186 = _180;
    if (!_160)
    {
        float _188 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_160;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = exp2(_206);
        float _210 = _204 * 0.693147182464599609375;
        float _212 = 1.0 / _210;
        float _214 = 1.0 / _202;
        float _216 = _208 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _212, _150);
        float _222 = _220 * _214;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
        _172 = _208;
    }
    float _226 = _194;
    float _228 = _172;
    bool _230 = !_160;
    float _232 = _228;
    if (!_230)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _150 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _174 = _252;
        _232 = _242;
    }
    float _254 = _174;
    float _256 = _232;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _256;
    float _266 = _258;
    float _268 = _262;
    if (!_160)
    {
        float _270 = _124 * _124;
        float _272 = _270 * 0.5;
        _264 = _272;
    }
    float _274 = _264;
    float _276 = fma(_254, _144, _258);
    float _278 = fma(_254, _146, _260);
    float _280 = fma(_254, _148, _262);
    if (!_160)
    {
        float _282 = _274 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _266 = _282;
    }
    float _284 = _266;
    bool _286 = !_160;
    float _288 = _284;
    if (!_286)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _124 * _292;
        float _302 = 1.0 / _296;
        float _304 = _298 * 0.693147182464599609375;
        float _306 = exp2(_300);
        float _308 = 1.0 / _304;
        float _310 = _306 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _308, _124);
        float _316 = _314 * _302;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _318;
        _268 = _306;
    }
    float _320 = _288;
    float _322 = _268;
    float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = _322;
    if (!_160)
    {
        _326 = _124;
    }
    float _328 = _326;
    bool _330 = !_160;
    float _332 = _328;
    if (!_330)
    {
        float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _336 = log2(_334);
        float _338 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _340 = _338 + 1.0;
        float _342 = 1.0 / _340;
        float _344 = _124 * _336;
        float _346 = exp2(_344);
        float _348 = -_346;
        float _350 = _348 + 1.0;
        float _352 = _350 * _342;
        _332 = _352;
    }
    float _354 = _332;
    float _356 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _358 = fma(_354, _146, _324);
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _362 = fma(_354, _144, _356);
    float _364 = -_358;
    float _366 = _278 + _364;
    float _368 = fma(_354, _148, _360);
    float _370 = -_362;
    float _372 = _276 + _370;
    float _374 = _366 * _366;
    float _376 = -_368;
    float _378 = _280 + _376;
    float _380 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _382 = sqrt(_182);
    float _384 = fma(_372, _372, _374);
    float _386 = in.m_51.w;
    float _388 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _380);
    float _390 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _392 = fma(_378, _378, _384);
    float _394 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _396 = sqrt(_184);
    float _398 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].y, _390);
    float _400 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].z, _394);
    float _402 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _388);
    float _404 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _406 = sqrt(_392);
    float _408 = in.m_44.x;
    float _410 = in.m_44.y;
    float _412 = in.m_44.z;
    float _414 = _366 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].x, _404);
    float _418 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].z, _400);
    float _420 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[14].w, _414);
    float _422 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].x, _416);
    float _424 = sqrt(_402);
    float _426 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].y, _398);
    float _428 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[16].w, _420);
    float _430 = _382 * _422;
    float _432 = _396 * _426;
    bool _434 = _406 >= 9.9999999747524270787835121154785e-07;
    bool _436 = isnan(_406);
    bool _438 = _434 || _436;
    bool _440 = isnan(9.9999999747524270787835121154785e-07);
    bool _442 = _438 || _440;
    float _444 = _432 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _446 = _432 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _448 = _432 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _450 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _444);
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _446);
    float _454 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[26].x, _448);
    float _456 = _424 * _418;
    float _458 = fma(_276, _386, _408);
    float _460 = fma(_278, _386, _410);
    float _462 = fma(_280, _386, _412);
    float _464 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[24].z, _450);
    float _466 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[25].z, _452);
    float _468 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[26].z, _454);
    float _470 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[24].w, _464);
    float _472 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[25].w, _466);
    float _474 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[26].w, _468);
    float _476 = _472;
    float _478 = _470;
    float _480 = _474;
    if (!_442)
    {
        bool _482 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _484 = !_482;
        if (!_484)
        {
            float _486 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _488 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _490 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _492 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _486);
            float _494 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _488);
            float _496 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _490);
            float _498 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _492);
            float _500 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _494);
            float _502 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _504 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _496);
            float _506 = _396 * _498;
            float _508 = _382 * _500;
            float _510 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _502);
            float _512 = _424 * _504;
            float _514 = _506 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _516 = _506 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _518 = _506 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _520 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _510);
            float _522 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[25].x, _514);
            float _524 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[24].x, _516);
            float _526 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[26].x, _518);
            float _528 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[25].z, _522);
            float _530 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[24].z, _524);
            float _532 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[26].z, _526);
            float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].w, _528);
            float _536 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].w, _530);
            float _538 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].w, _532);
            float _540 = _534 * _534;
            float _542 = fma(_536, _536, _540);
            float _544 = fma(_538, _538, _542);
            float _546 = rsqrt(_544);
            float _548 = _546 * 9.9999999747524270787835121154785e-07;
            float _550 = _536 * _548;
            float _552 = _534 * _548;
            float _554 = _538 * _548;
            _476 = _552;
            _478 = _550;
            _480 = _554;
            _556 = true;
        }
        else
        {
            float _558 = _146 * _146;
            float _560 = fma(_144, _144, _558);
            float _562 = fma(_148, _148, _560);
            float _564 = sqrt(_562);
            bool _566 = _564 >= 9.9999999747524270787835121154785e-07;
            bool _568 = isnan(_564);
            bool _570 = _566 || _568;
            bool _572 = isnan(9.9999999747524270787835121154785e-07);
            bool _574 = _570 || _572;
            if (!_574)
            {
                float _576 = _410 * _410;
                float _578 = fma(_408, _408, _576);
                float _580 = fma(_412, _412, _578);
                float _582 = sqrt(_580);
                bool _584 = _582 >= 9.9999999747524270787835121154785e-07;
                bool _586 = isnan(_582);
                bool _588 = _584 || _586;
                bool _590 = isnan(9.9999999747524270787835121154785e-07);
                bool _592 = _588 || _590;
                if (!_592)
                {
                    float _594 = _396 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _596 = _382 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _598 = _424 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _600 = _594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _602 = _594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _604 = _594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _606 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _600);
                    float _608 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _602);
                    float _610 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _604);
                    float _612 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[25].z, _606);
                    float _614 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[24].z, _608);
                    float _616 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[26].z, _610);
                    float _618 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _612);
                    float _620 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _614);
                    float _622 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _616);
                    float _624 = _618 * _618;
                    float _626 = fma(_620, _620, _624);
                    float _628 = fma(_622, _622, _626);
                    float _630 = rsqrt(_628);
                    float _632 = _630 * 9.9999999747524270787835121154785e-07;
                    float _634 = _620 * _632;
                    float _636 = _618 * _632;
                    float _638 = _622 * _632;
                    _476 = _636;
                    _478 = _634;
                    _480 = _638;
                    _556 = true;
                }
                else
                {
                    float _640 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _642 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _644 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _646 = _410 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _648 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].y, _640);
                    float _650 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].x, _642);
                    float _652 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].z, _644);
                    float _654 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[14].w, _646);
                    float _656 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].y, _648);
                    float _658 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].x, _650);
                    float _660 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].z, _652);
                    float _662 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[16].w, _654);
                    float _664 = _396 * _656;
                    float _666 = _382 * _658;
                    float _668 = _424 * _660;
                    float _670 = _664 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _672 = _664 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _674 = _664 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _676 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].x, _670);
                    float _678 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _672);
                    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].x, _674);
                    float _682 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[25].z, _676);
                    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[24].z, _678);
                    float _686 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[26].z, _680);
                    float _688 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[25].w, _682);
                    float _690 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[24].w, _684);
                    float _692 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[26].w, _686);
                    float _694 = _688 * _688;
                    float _696 = fma(_690, _690, _694);
                    float _698 = fma(_692, _692, _696);
                    float _700 = rsqrt(_698);
                    float _702 = _700 * 9.9999999747524270787835121154785e-07;
                    float _704 = _690 * _702;
                    float _706 = _688 * _702;
                    float _708 = _692 * _702;
                    _476 = _706;
                    _478 = _704;
                    _480 = _708;
                    _556 = true;
                }
            }
            else
            {
                float _710 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _712 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _714 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _716 = _146 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _718 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].y, _710);
                float _720 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].x, _712);
                float _722 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].z, _714);
                float _724 = fma(_144, (*spvDescriptorSet0.vp_c10)._m0[14].w, _716);
                float _726 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].y, _718);
                float _728 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].x, _720);
                float _730 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].z, _722);
                float _732 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[16].w, _724);
                float _734 = _396 * _726;
                float _736 = _382 * _728;
                float _738 = _424 * _730;
                float _740 = _734 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _742 = _734 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _744 = _734 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _746 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[25].x, _740);
                float _748 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[24].x, _742);
                float _750 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[26].x, _744);
                float _752 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[25].z, _746);
                float _754 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[24].z, _748);
                float _756 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[26].z, _750);
                float _758 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[25].w, _752);
                float _760 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[24].w, _754);
                float _762 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[26].w, _756);
                float _764 = _758 * _758;
                float _766 = fma(_760, _760, _764);
                float _768 = fma(_762, _762, _766);
                float _770 = rsqrt(_768);
                float _772 = _770 * 9.9999999747524270787835121154785e-07;
                float _774 = _760 * _772;
                float _776 = _758 * _772;
                float _778 = _762 * _772;
                _476 = _776;
                _478 = _774;
                _480 = _778;
            }
        }
    }
    _556 = false;
    float _780 = _476;
    float _782 = _478;
    float _784 = _480;
    float _786 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _788 = int(_786);
    float _790 = in.m_53.x;
    float _792 = float(_90);
    float _794 = in.m_55.x;
    float _796 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _798 = int(_796);
    float _800 = float(_788);
    float _802 = 1.0 / _792;
    float _804 = float(uint(_798));
    float _806 = 1.0 / _800;
    int _808 = ~_798;
    int _810 = _808 + 1;
    int _812 = ~_798;
    int _814 = _812 + 1;
    out.m_57.x = _794;
    int _816 = ~_798;
    int _818 = _816 + 1;
    float _820 = 1.0 / _804;
    float _822 = _124 * _806;
    float _824 = trunc(_822);
    int _826 = int(_824);
    int _828 = as_type<int>(_820) + (-2);
    float _830 = float(uint(_826));
    float _832 = float(_826);
    float _834 = as_type<float>(_828) * _830;
    float _836 = trunc(_834);
    float _838 = precise::max(_836, 0.0);
    uint _841 = uint(_838);
    int _843 = _810 * int(_841);
    int _845 = _843 + _826;
    float _847 = float(uint(_845));
    float _849 = as_type<float>(_828) * _847;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _853 = _851 != 0;
    float _855 = trunc(_849);
    float _857 = precise::max(_855, 0.0);
    uint _859 = uint(_857);
    bool _861 = !_853;
    float _863 = _861 ? 7.345489978790283203125 : 1.0;
    float _865 = _863 * _790;
    int _867 = int(_841) + int(_859);
    float _869 = floor(_865);
    float _871 = float(_798);
    int _873 = _814 * _867;
    int _875 = _873 + _826;
    bool _877 = _832 >= _871;
    bool _879 = isnan(_832);
    bool _881 = _877 || _879;
    bool _883 = isnan(_871);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    bool _889 = uint(_875) >= uint(_798);
    float _891 = trunc(_887);
    int _893 = int(_891);
    bool _895 = !_889;
    int _897 = _895 ? 0 : (-1);
    bool _899 = _798 == 0;
    float _901 = -_869;
    float _903 = _865 + _901;
    int _905 = ~_867;
    int _907 = _905 + _897;
    int _909 = _907 + 1;
    float _911 = _903 * _871;
    float _913 = _124 * _871;
    int _915 = _798 * _909;
    int _917 = _915 + _826;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _921 = _919 != 0;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _929 = _927 != 0;
    float _931 = _913 * _802;
    float _933 = trunc(_911);
    int _935 = int(_933);
    int _937 = ~_893;
    int _939 = _937 + 1;
    int _941 = _939 + 1;
    bool _943 = !_899;
    int _945 = _943 ? _917 : (-1);
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _949 = _947 != 0;
    int _951 = _798 + (-1);
    float _953 = trunc(_931);
    int _955 = int(_953);
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _959 = _957 != 0;
    int _961 = _945 * _941;
    bool _963 = !_925;
    int _965 = _963 ? 0 : 1;
    bool _967 = !_959;
    int _969 = _967 ? 0 : 1;
    int _971 = _893 * _951;
    int _973 = _971 + _961;
    int _975 = abs(_965);
    bool _977 = !_921;
    int _979 = _977 ? 0 : 1;
    bool _981 = !_929;
    int _983 = _981 ? 0 : 1;
    int _985 = abs(_969);
    int _987 = abs(_979);
    int _989 = abs(_983);
    int _991 = _973 * _975;
    bool _993 = !_949;
    int _995 = _993 ? 0 : 1;
    int _997 = _935 * _985;
    int _999 = _997 + _826;
    int _1001 = _955 * _987;
    int _1003 = _1001 + _991;
    int _1005 = abs(_995);
    float _1007 = in.m_59.y;
    int _1009 = ~_798;
    int _1011 = _1009 + 1;
    int _1013 = _999 * _989;
    int _1015 = _1013 + _1003;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1023 = _1021 != 0;
    int _1025 = _935 * _1005;
    int _1027 = _1025 + _1015;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1031 = _1029 != 0;
    float _1033 = in.m_53.y;
    float _1035 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1037 = float(uint(_1027));
    float _1039 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1035);
    float _1041 = as_type<float>(_828) * _1037;
    float _1043 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1039);
    float _1045 = in.m_51.x;
    float _1047 = in.m_51.y;
    float _1049 = in.m_51.z;
    float _1051 = trunc(_1041);
    float _1053 = precise::max(_1051, 0.0);
    uint _1055 = uint(_1053);
    float _1057 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _1059 = _1033 > 0.5;
    float _1061 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1057);
    int _1063 = _1011 * int(_1055);
    int _1065 = _1063 + _1027;
    float _1067 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1061);
    float _1069 = float(uint(_1065));
    float _1071 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1073 = float(uint(_999));
    float _1075 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1077 = -_1007;
    float _1079 = _1077 + 1.0;
    float _1081 = as_type<float>(_828) * _1069;
    float _1083 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1085 = _460 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1087 = as_type<float>(_828) * _1073;
    float _1089 = trunc(_1081);
    float _1091 = precise::max(_1089, 0.0);
    uint _1093 = uint(_1091);
    float _1095 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1083);
    float _1097 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1085);
    int _1099 = ~_798;
    int _1101 = _1099 + 1;
    float _1103 = _1067 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1105 = _1007;
    if (_1023)
    {
        float _1107 = _1059 ? _1079 : _1007;
        _1105 = _1107;
    }
    float _1109 = _1105;
    float _1111 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    int _1113 = ~_798;
    int _1115 = _1113 + 1;
    float _1117 = trunc(_1087);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    float _1123 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1095);
    float _1125 = _396 * _1103;
    float _1127 = _382 * _1111;
    float _1129 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1097);
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1137 = int(_1055) + int(_1093);
    float _1139 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1141 = _424 * _1131;
    float _1143 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1133);
    float _1145 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _1147 = _1101 * _1137;
    int _1149 = _1147 + _1027;
    float _1151 = _1139 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1153 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1155 = _1115 * int(_1121);
    int _1157 = _1155 + _999;
    bool _1159 = uint(_1149) >= uint(_798);
    float _1161 = float(uint(_1157));
    bool _1163 = !_1159;
    int _1165 = _1163 ? 0 : (-1);
    float _1167 = as_type<float>(_828) * _1161;
    int _1169 = ~_1137;
    int _1171 = _1169 + _1165;
    int _1173 = _1171 + 1;
    float _1175 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1177 = _780 * _780;
    float _1179 = trunc(_1167);
    float _1181 = precise::max(_1179, 0.0);
    uint _1183 = uint(_1181);
    int _1185 = _798 * _1173;
    int _1187 = _1185 + _1027;
    float _1189 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1175);
    float _1191 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1135);
    float _1193 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1143);
    bool _1195 = !_899;
    int _1197 = _1195 ? _1187 : (-1);
    float _1199 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1189);
    float _1201 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1191);
    float _1203 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1193);
    int _1205 = _1197 >> 31;
    float _1207 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1199);
    float _1209 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1201);
    float _1211 = _1203 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    int _1213 = _1205 & 3;
    float _1215 = fma(_782, _782, _1177);
    float _1217 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1221 = _1211 + _1219;
    int _1223 = _1197 + _1213;
    float _1225 = fma(_784, _784, _1215);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1229 = _1217 + _1227;
    float _1231 = _1209 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    int _1233 = _1223 >> 2;
    float _1235 = in.m_61.x;
    float _1237 = in.m_61.y;
    float _1239 = in.m_61.z;
    float _1241 = _1229 * _1229;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1245 = _1231 + _1243;
    int _1247 = _1233 << 4;
    int _1249 = _1247 + 368;
    float _1251 = rsqrt(_1225);
    float _1253 = fma(_1221, _1221, _1241);
    int _1255 = int(_1121) + int(_1183);
    uint _1257 = uint(int(uint(_1249) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[int(_1267)][_1269];
    int _1273 = _1197 & 3;
    bool _1275 = _1273 != 0;
    float _1277 = fma(_1245, _1245, _1253);
    int _1279 = _1197 & 3;
    bool _1281 = _1279 != 0;
    int _1283 = _818 * _1255;
    int _1285 = _1283 + _999;
    bool _1287 = _1279 != 3;
    int _1289 = _1249 + 8;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[int(_1301)][_1303];
    float _1307 = rsqrt(_1277);
    bool _1309 = uint(_1279) > 1u;
    int _1311 = _1275 ? 0 : 1;
    float _1313 = _1251 * _782;
    bool _1315 = uint(_1279) >= 2u;
    float _1317 = _1251 * _780;
    int _1319 = ~_1311;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1235);
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1239);
    int _1329 = _1315 ? 0 : 1;
    float _1331 = _1251 * _784;
    bool _1333 = !_1281;
    int _1335 = _1333 ? 0 : 1;
    float _1337 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1237);
    int _1339 = ~_1329;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    int _1345 = _1343;
    int _1347 = _1323;
    if (_1287)
    {
        int _1349 = ~_1329;
        int _1351 = _1349 + 1;
        _1345 = _1351;
    }
    int _1353 = _1345;
    float _1355 = _1229 * _1307;
    if (!_1309)
    {
        int _1357 = ~_1311;
        int _1359 = _1357 + 1;
        _1347 = _1359;
    }
    int _1361 = _1347;
    float _1363 = _1221 * _1307;
    bool _1365 = uint(_1285) >= uint(_798);
    float _1367 = -_1355;
    float _1369 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1229);
    int _1371 = abs(_1361);
    float _1373 = -_1363;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _1377 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1379 = int(_1377);
    float _1381 = _1369 * _1369;
    int _1383 = abs(_1335);
    float _1385 = _1245 * _1307;
    int _1387 = abs(_1353);
    float _1389 = fma(_1375, _1375, _1381);
    int _1391 = ~_1371;
    int _1393 = _1391 + 1;
    int _1395 = _1393 + 1;
    float _1397 = -_1385;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    int _1401 = ~_1383;
    int _1403 = _1401 + 1;
    int _1405 = _1403 + 1;
    float _1407 = fma(_1399, _1399, _1389);
    bool _1409 = _1279 != 3;
    float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1413 = _1317 * _1411;
    bool _1415 = !_1365;
    int _1417 = _1415 ? 0 : (-1);
    int _1419 = _1395 * as_type<int>(_1271);
    int _1421 = ~_1387;
    int _1423 = _1421 + 1;
    int _1425 = _1423 + 1;
    float _1427 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1429 = -_1413;
    float _1431 = fma(_1331, _1427, _1429);
    float _1433 = float(uint(_1379));
    int _1435 = _1405 * as_type<int>(_1263);
    int _1437 = _1435 + _1419;
    int _1439 = ~_1255;
    int _1441 = _1439 + _1417;
    int _1443 = _1441 + 1;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1447 = _1313 * _1445;
    float _1449 = 1.0 / _1433;
    int _1451 = _1425 * as_type<int>(_1297);
    int _1453 = _1451 + _1437;
    bool _1455 = !_1409;
    int _1457 = _1455 ? 0 : (-1);
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1461 = _1331 * _1459;
    bool _1463 = !_1031;
    int _1465 = _1463 ? 0 : 1;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1469 = -_1447;
    float _1471 = fma(_1317, _1467, _1469);
    int _1473 = abs(_1457);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1477 = -_1461;
    float _1479 = fma(_1313, _1475, _1477);
    float _1481 = sqrt(_1407);
    int _1483 = abs(_1465);
    float _1485 = _1479 * _1479;
    int _1487 = ~_1473;
    int _1489 = _1487 + 1;
    int _1491 = _1489 + 1;
    float _1493 = fma(_1431, _1431, _1485);
    int _1495 = _798 * _1443;
    int _1497 = _1495 + _999;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1501 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1503 = _1491 * as_type<int>(_1305);
    int _1505 = _1503 + _1453;
    int _1507 = ~_1483;
    int _1509 = _1507 + 1;
    int _1511 = _1509 + 1;
    float _1513 = fma(_1471, _1471, _1493);
    int _1515 = abs(_1379);
    float _1517 = -_1499;
    float _1519 = fma(_1501, 2.0, _1517);
    bool _1521 = !_899;
    int _1523 = _1521 ? _1497 : (-1);
    int _1525 = _1505 * _1511;
    float _1527 = rsqrt(_1513);
    float _1529 = _1307 * _1481;
    int _1531 = _1523 * _1483;
    int _1533 = _1531 + _1525;
    float _1535 = float(uint(_1515));
    float _1537 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1539 = as_type<int>(_1449) + (-2);
    float _1541 = _1153 * _1529;
    float _1543 = float(uint(_1533));
    float _1545 = _1537 * _1529;
    float _1547 = 1.0 / _1535;
    float _1549 = _1151 * _1529;
    float _1551 = _1541 * _1325;
    float _1553 = as_type<float>(_1539) * _1543;
    int _1555 = abs(_1533);
    float _1557 = _1549 * _1327;
    float _1559 = _1545 * _1337;
    float _1561 = _1471 * _1527;
    float _1563 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1565 = trunc(_1553);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    int _1571 = ~_1379;
    int _1573 = _1571 + 1;
    float _1575 = _1431 * _1527;
    float _1577 = _1479 * _1527;
    float _1579 = _1563 * _790;
    float _1581 = _1317 * _1561;
    int _1583 = as_type<int>(_1547) + (-2);
    float _1585 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1587 = float(uint(_1555));
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1591 = -_1581;
    float _1593 = fma(_1331, _1577, _1591);
    bool _1595 = _790 > 0.5;
    bool _1597 = _1595 && _1019;
    float _1599 = trunc(_1579);
    int _1601 = int(_1599);
    float _1603 = as_type<float>(_1583) * _1587;
    float _1605 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1589);
    int _1607 = _1573 * int(_1569);
    int _1609 = _1607 + _1533;
    int _1611 = ~_1515;
    int _1613 = _1611 + 1;
    float _1615 = _1559 * _1313;
    float _1617 = -_124;
    float _1619 = fma(_1617, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1519);
    float _1621 = trunc(_1603);
    float _1623 = precise::max(_1621, 0.0);
    uint _1625 = uint(_1623);
    float _1627 = float(uint(_1609));
    float _1629 = fma(_1551, _1575, _1615);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1633 = _1331 * _1575;
    float _1635 = as_type<float>(_1539) * _1627;
    float _1637 = fma(_1585, -2.0, _1631);
    float _1639 = fma(_1557, _1593, _1629);
    float _1641 = _1313 * _1577;
    float _1643 = _1559 * _1331;
    float _1645 = in.m_59.x;
    float _1647 = trunc(_1635);
    float _1649 = precise::max(_1647, 0.0);
    uint _1651 = uint(_1649);
    float _1653 = -_1641;
    float _1655 = fma(_1317, _1575, _1653);
    float _1657 = fma(_1551, _1561, _1643);
    int _1659 = _1613 * int(_1625);
    int _1661 = _1659 + _1555;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1665 = _1601 << 4;
    int _1667 = _1665 + 1712;
    float _1669 = fma(_1557, _1655, _1657);
    float _1671 = _1211 + _1639;
    float _1673 = float(uint(_1661));
    float _1675 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1663);
    float _1677 = _1231 + _1669;
    float _1679 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1605);
    float _1681 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1637);
    float _1683 = as_type<float>(_1583) * _1673;
    float _1685 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1675);
    uint _1687 = uint(int(uint(_1667) >> uint(2)));
    uint _1689 = uint(int(uint(int(_1687)) >> uint(2)));
    int _1691 = int(_1687) & 3;
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[int(_1689)][_1691];
    int _1695 = int(_1687) + 1;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    int _1699 = _1695 & 3;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[int(_1697)][_1699];
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1705 = _1671 + _1703;
    float _1707 = trunc(_1683);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1715 = _1677 + _1713;
    int _1717 = ~_1515;
    int _1719 = _1717 + 1;
    float _1721 = _1705 * _1705;
    int _1723 = ~_1379;
    int _1725 = _1723 + 1;
    float _1727 = _1715 * _1715;
    int _1729 = _1667 + 8;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[int(_1733)][_1735];
    float _1739 = _1675;
    float _1741 = as_type<float>(_1725);
    float _1743 = as_type<float>(_1533);
    float _1745 = _1721;
    float _1747 = _1727;
    if (_1019)
    {
        _1739 = _1645;
    }
    float _1749 = _1739;
    float _1751 = _1559 * _1317;
    float _1753 = _1721 + _1727;
    int _1755 = int(_1569) + int(_1651);
    float _1757 = -_1633;
    float _1759 = fma(_1313, _1561, _1757);
    float _1761 = _1749;
    if (_1597)
    {
        float _1763 = -_1749;
        float _1765 = _1763 + 1.0;
        _1761 = _1765;
    }
    float _1767 = _1761;
    float _1769 = sqrt(_1753);
    float _1771 = in.m_55.y;
    float _1773 = fma(_1551, _1577, _1751);
    int _1775 = int(_1625) + int(_1711);
    float _1777 = fma(_1557, _1759, _1773);
    if (!_1019)
    {
        _1741 = _1645;
    }
    float _1779 = _1741;
    int _1781 = _1719 * _1775;
    int _1783 = _1781 + _1555;
    float _1785 = _1779;
    if (_1019)
    {
        _1785 = _1767;
    }
    float _1787 = _1785;
    int _1789 = _1725 * _1755;
    int _1791 = _1789 + _1533;
    float _1793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1795 = _1217 + _1777;
    bool _1797 = uint(_1783) >= uint(_1515);
    int _1799 = _1533 ^ _1379;
    bool _1801 = !_1797;
    int _1803 = _1801 ? 0 : (-1);
    bool _1805 = _1769 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1807 = uint(_1791) >= uint(_1379);
    uint _1809 = uint(int(uint(_1799) >> uint(31)));
    int _1811 = ~_1803;
    int _1813 = _1775 + _1811;
    int _1815 = _1813 + 1;
    float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1819 = !_1807;
    int _1821 = _1819 ? 0 : (-1);
    int _1823 = ~int(_1809);
    int _1825 = _1823 + 1;
    int _1827 = ~_1755;
    int _1829 = _1827 + _1821;
    int _1831 = _1829 + 1;
    int _1833 = _1815 ^ _1825;
    bool _1835 = _1379 == 0;
    int _1837 = _1379 * _1831;
    int _1839 = _1837 + _1533;
    int _1841 = ~_1825;
    int _1843 = _1841 + _1833;
    int _1845 = _1843 + 1;
    bool _1847 = _1379 == 0;
    float _1849 = as_type<float>(_1831);
    float _1851 = as_type<float>(_1825);
    if (!_1805)
    {
        _1849 = _1671;
    }
    float _1853 = _1849;
    float _1855 = _1853;
    if (!_1805)
    {
        _1851 = _1677;
    }
    float _1857 = _1851;
    float _1859 = _1857;
    if (!_1805)
    {
        _1743 = _1795;
    }
    float _1861 = _1743;
    bool _1863 = !_1805;
    float _1865 = _1861;
    if (!_1863)
    {
        float _1867 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1871 = _1769 + _1869;
        float _1873 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1875 = rsqrt(_1753);
        float _1877 = _1871 * _1867;
        float _1879 = _1877 * 0.15915493667125701904296875;
        float _1881 = _1879 * 6.283185482025146484375;
        float _1883 = sin(_1881);
        float _1885 = _1879 * 6.283185482025146484375;
        float _1887 = cos(_1885);
        float _1889 = fma(_1883, _1873, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1891 = _1875 * _1889;
        float _1893 = fma(_1705, _1891, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1895 = _1887 + (-1.0);
        float _1897 = fma(_1715, _1891, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1901 = _1893 + _1899;
        float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1907 = _1897 + _1905;
        float _1909 = _1901 * _1901;
        float _1911 = fma(_1795, _1887, _1903);
        float _1913 = _1907 * _1907;
        _1865 = _1911;
        _1745 = _1909;
        _1747 = _1913;
        _1855 = _1893;
        _1859 = _1897;
    }
    float _1915 = _1865;
    float _1917 = _1745;
    float _1919 = _1747;
    float _1921 = _1855;
    float _1923 = _1859;
    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1927 = _1915 + _1925;
    bool _1929 = !_1835;
    int _1931 = _1929 ? _1839 : (-1);
    float _1933 = in.m_55.w;
    bool _1935 = !_1847;
    int _1937 = _1935 ? _1845 : (-1);
    float _1939 = fma(_1927, _1927, _1917);
    float _1941 = float(_1931);
    float _1943 = in.m_55.z;
    float _1945 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1947 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1949 = float(_1937);
    float _1951 = _1939 + _1919;
    float _1953 = fma(_1945, _1787, -0.5);
    float _1955 = fma(_1945, _1941, _1619);
    float _1957 = fma(_1947, _1109, -0.5);
    float _1959 = -_1681;
    float _1961 = fma(_1947, _1949, _1959);
    float _1963 = fma(_1679, _1953, _1955);
    float _1965 = sqrt(_1951);
    float _1967 = fma(_1685, _1957, _1961);
    float _1969 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1971 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1979 = _1737 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1985 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1987 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1989 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1991 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1997 = _1963 + 0.5;
    float _1999 = _1967 + 0.5;
    out.m_57.y = _1771;
    bool _2001 = _1965 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2003 = isnan(_1965);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2009 = _2005 || _2007;
    out.m_57.z = _1943;
    out.m_57.w = _1933;
    out.m_63.x = _1985;
    out.m_63.y = _1987;
    out.m_63.z = _1989;
    out.m_63.w = _1983;
    float _2011 = _1969;
    if (!_2009)
    {
        _2011 = 1.0;
    }
    float _2013 = _2011;
    out.m_65.x = _1991;
    out.m_65.y = _1993;
    out.m_65.z = _1995;
    out.m_65.w = _1981;
    out.m_67.x = _1997;
    out.m_67.y = _1999;
    bool _2015 = !_2009;
    float _2017 = _2013;
    if (!_2015)
    {
        bool _2019 = _1965 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2021 = isnan(_1965);
        bool _2023 = _2019 || _2021;
        bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2027 = _2023 || _2025;
        if (!_2027)
        {
            float _2029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2031 = _1965 + _2029;
            float _2033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2033;
            float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2041 = 1.0 / _2035;
            float _2043 = _2031 * _2041;
            float _2045 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2017 = _2045;
            _2047 = true;
        }
        else
        {
            bool _2049 = _1965 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2051 = isnan(_1965);
            bool _2053 = _2049 || _2051;
            bool _2055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2057 = _2053 || _2055;
            if (!_2057)
            {
                float _2059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2061 = _1965 + _2059;
                float _2063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2065 = _2063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2069 = _2067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2071 = 1.0 / _2065;
                float _2073 = _2061 * _2071;
                float _2075 = fma(_2073, _2069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2017 = _2075;
                _2047 = true;
            }
            else
            {
                _2017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2047 = false;
    float _2077 = _2017;
    float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2081 = _1915 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2085 = _1921 + _2083;
    float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2089 = _1923 + _2087;
    float _2091 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2093 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2095 = fma(_2089, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -_1355;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2091);
    float _2101 = -_1363;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2093);
    float _2105 = -_1385;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2095);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2111 = _2099 + _2109;
    float _2113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2115 = _2103 + _2113;
    float _2117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2119 = _2107 + _2117;
    float _2121 = _2111 * _2111;
    float _2123 = fma(_2115, _2115, _2121);
    float _2125 = fma(_2119, _2119, _2123);
    float _2127 = rsqrt(_2125);
    float _2129 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2131 = _2115 * _2129;
    float _2133 = _2119 * _2129;
    float _2135 = _2131 * _2131;
    float _2137 = _2133 * _2133;
    float _2139 = _2135 + _2137;
    float _2141 = sqrt(_2139);
    bool _2143 = _2141 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2147 = _2141 + _2145;
    float _2149 = _2127;
    float _2151 = _2139;
    float _2153 = _2147;
    float _2155 = _2089;
    float _2157 = _2111;
    float _2159 = _2129;
    float _2161 = _2131;
    if (_2143)
    {
        float _2163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2149 = _2163;
    }
    float _2165 = _2149;
    if (_2143)
    {
        float _2167 = rsqrt(_2139);
        _2151 = _2167;
    }
    float _2169 = _2151;
    if (_2143)
    {
        float _2171 = _2147 * _2165;
        _2153 = _2171;
    }
    float _2173 = _2153;
    if (_2143)
    {
        float _2175 = _2173 * 0.15915493667125701904296875;
        _2155 = _2175;
    }
    float _2177 = _2155;
    float _2179 = _2165;
    float _2181 = _2177;
    if (_2143)
    {
        float _2183 = _2177 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        _2179 = _2185;
    }
    float _2187 = _2179;
    float _2189 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2191 = precise::max(0.0, _2189);
    float _2193 = _2119;
    float _2195 = _2191;
    if (_2143)
    {
        float _2197 = _2177 * 6.283185482025146484375;
        float _2199 = cos(_2197);
        _2193 = _2199;
    }
    float _2201 = _2193;
    float _2203 = -_2129;
    float _2205 = -_2191;
    float _2207 = fma(_2111, _2203, _2205);
    if (!_2143)
    {
        _2157 = _2133;
    }
    float _2209 = _2157;
    float _2211 = _2209;
    if (_2143)
    {
        float _2213 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2213;
    }
    float _2215 = _2195;
    float _2217 = _2187;
    float _2219 = _2215;
    if (_2143)
    {
        float _2221 = fma(_2187, _2215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2217 = _2221;
    }
    float _2223 = _2217;
    float _2225 = _2223;
    float _2227 = _2201;
    if (_2143)
    {
        float _2229 = _2201 + (-1.0);
        _2219 = _2229;
    }
    float _2231 = _2219;
    float _2233 = _2231;
    if (_2143)
    {
        float _2235 = _2169 * _2223;
        _2159 = _2235;
    }
    float _2237 = _2159;
    if (!_2143)
    {
        _2225 = _2207;
    }
    float _2239 = _2225;
    float _2241 = sqrt(_2125);
    float _2243 = _2239;
    if (_2143)
    {
        float _2245 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2181 = _2245;
    }
    float _2247 = _2181;
    if (_2143)
    {
        float _2249 = _2131 * _2237;
        _2161 = _2249;
    }
    float _2251 = _2161;
    if (!_2143)
    {
        _2233 = _2135;
    }
    float _2253 = _2233;
    float _2255 = _2253;
    if (_2143)
    {
        float _2257 = _2133 * _2237;
        _2211 = _2257;
    }
    float _2259 = _2211;
    if (_2143)
    {
        float _2261 = fma(_2207, _2201, _2247);
        _2243 = _2261;
    }
    float _2263 = _2243;
    if (_2143)
    {
        float _2265 = _2251 * _2251;
        _2255 = _2265;
    }
    float _2267 = _2255;
    if (!_2143)
    {
        _2227 = _2137;
    }
    float _2269 = _2227;
    float _2271 = _2269;
    if (_2143)
    {
        float _2273 = _2259 * _2259;
        _2271 = _2273;
    }
    float _2275 = _2271;
    float _2277 = fma(_2263, _2263, _2267);
    float _2279 = _2277 + _2275;
    float _2281 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2285 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2283);
    float _2287 = precise::clamp(_2285, 0.0, 1.0);
    float _2289 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2291 = rsqrt(_2279);
    float _2293 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2281);
    float _2295 = -_2287;
    float _2297 = _2295 + 1.0;
    float _2299 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2301 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2289);
    float _2303 = _2099 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2305 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2293);
    float _2307 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2299);
    float _2309 = abs(_2297);
    float _2311 = log2(_2309);
    float _2313 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2301);
    float _2315 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2317 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2307);
    float _2319 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2303);
    float _2321 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2323 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2325 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2327 = _2291 * _2251;
    float _2329 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2319);
    float _2331 = _2317 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2333 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2335 = _2291 * _2263;
    float _2337 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2339 = -_2325;
    float _2341 = fma(_2339, _2323, 1.0);
    float _2343 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2333);
    float _2345 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2347 = _2291 * _2259;
    float _2349 = -_2337;
    float _2351 = fma(_2335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2349);
    float _2353 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2355 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2343);
    float _2357 = log2(_2341);
    float _2359 = -_2347;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2351);
    float _2363 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2365 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2355);
    float _2367 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2369 = fma(_2361, -0.5, 0.5);
    float _2371 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2363);
    float _2373 = fma(_2361, 0.5, 0.5);
    float _2375 = exp2(_2345);
    float _2377 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2367);
    float _2379 = _2335 + 1.0;
    float _2381 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2371);
    float _2383 = fma(_2373, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2385 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2377);
    float _2387 = 1.0 / _2365;
    float _2389 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2385);
    float _2391 = fma(_2373, _2383, -0.212114393711090087890625);
    float _2393 = _2357 * 0.693147182464599609375;
    float _2395 = fma(_2373, _2391, 1.570728778839111328125);
    float _2397 = sqrt(_2369);
    float _2399 = -_2335;
    float _2401 = fma(_2375, _2379, _2399);
    float _2403 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2381);
    float _2405 = fma(_2401, 0.5, 0.5);
    float _2407 = _2403 * _2387;
    float _2409 = _2389 * _2387;
    float _2411 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2413 = fma(_2407, 0.5, 0.5);
    float _2415 = fma(_2409, -0.5, 0.5);
    float _2417 = _2397 * 0.636619746685028076171875;
    float3 _6345 = float3(_2413, _2415, _2411);
    float _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6345, float3(0.0), isnan(_6345)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6345, float3(0.0), isnan(_6345)), level(0.0)).x;
    float3 _6356 = float3(_2413, _2415, _2411);
    float4 _2422 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6356, float3(0.0), isnan(_6356)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6356, float3(0.0), isnan(_6356)), level(0.0)).xyzw;
    float _2424 = _2422.x;
    float _2426 = _2422.y;
    float _2428 = _2422.z;
    float _2430 = _2422.w;
    float _2432 = -_2395;
    float _2434 = fma(_2417, _2432, 1.0);
    float2 _6378 = float2(_2434, _2405);
    float3 _2438 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6378, float2(0.0), isnan(_6378)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6378, float2(0.0), isnan(_6378)), level(0.0)).xyz;
    float _2440 = _2438.x;
    float _2442 = _2438.y;
    float _2444 = _2438.z;
    float _2446 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2448 = _2321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2450 = fma(_2331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2448);
    float _2452 = exp2(_2446);
    float _2454 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2450);
    float _2456 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2454);
    float _2458 = _2456 + _2365;
    out.gl_Position.x = _2403;
    out.gl_Position.y = _2389;
    out.gl_Position.z = _2456;
    out.gl_Position.w = _2365;
    float _2460 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2462 = _2458 * 0.5;
    float _2464 = -_2452;
    float _2466 = _2464 + 1.0;
    out.m_47.x = _2460;
    float _2468 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2462;
    out.m_69.w = _2365;
    float _2470 = _2468 * _2419;
    float _2472 = -_2468;
    float _2474 = _2472 + 1.0;
    float _2476 = _2430 * _2470;
    float _2478 = _2444 * _2470;
    float _2480 = fma(_2440, _2476, _2424);
    float _2482 = fma(_2442, _2476, _2426);
    float _2484 = _2430 * _2474;
    float _2486 = fma(_2430, _2478, _2428);
    out.m_71.x = _2480;
    out.m_71.y = _2482;
    out.m_71.z = _2486;
    out.m_71.w = _2484;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

