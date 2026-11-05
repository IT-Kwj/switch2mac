#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_32 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_28 [[user(locn4)]];
    float4 m_30 [[user(locn5)]];
    float4 m_36 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _52 = gl_FragCoord.w;
    float _54 = in.m_28.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_28.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_28.z;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_30.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_30.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_30.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _92 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _90);
    float _94 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _92);
    float _96 = rsqrt(_94);
    float _98 = 1.0 / _52;
    float _100 = _96 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _102 = _96 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _104 = _98 * _58;
    float _106 = _98 * _64;
    float _108 = _98 * _70;
    float _110 = _98 * _82;
    float _112 = _104 * _104;
    float _114 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _116 = _110 + _114;
    float _118 = fma(_106, _106, _112);
    float _120 = fma(_108, _108, _118);
    float _122 = _98 * _76;
    float _124 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _126 = _122 + _124;
    float _128 = rsqrt(_120);
    float _130 = _98 * _88;
    float _132 = _126 * _126;
    float _134 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _136 = _130 + _134;
    float _138 = fma(_116, _116, _132);
    float _140 = fma(_136, _136, _138);
    float _142 = rsqrt(_140);
    float _144 = _104 * _128;
    float _146 = _106 * _128;
    float _148 = _108 * _128;
    float _150 = _144 * _144;
    float _152 = fma(_146, _146, _150);
    float _154 = fma(_148, _148, _152);
    float _156 = _126 * _142;
    float _158 = _116 * _142;
    float _160 = _136 * _142;
    float _162 = rsqrt(_154);
    float _164 = _156 * _156;
    float _166 = fma(_158, _158, _164);
    float _168 = fma(_160, _160, _166);
    float _170 = _144 * _162;
    float _172 = _146 * _162;
    float _174 = _148 * _162;
    float _176 = rsqrt(_168);
    float _178 = _170 * _170;
    float _180 = fma(_172, _172, _178);
    float _182 = fma(_174, _174, _180);
    float _184 = in.m_32.z;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = rsqrt(_182);
    float _192 = _158 * _176;
    float _194 = _156 * _176;
    float _196 = _160 * _176;
    float _198 = in.m_32.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_32.y;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = _170 * _194;
    float _212 = _170 * _190;
    float _214 = _172 * _190;
    float _216 = _174 * _190;
    float _218 = in.m_34.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = _212 * (-0.816474258899688720703125);
    float _226 = _212 * _100;
    float _228 = fma(_172, _192, _210);
    float _230 = -_224;
    float _232 = fma(_216, 0.577381789684295654296875, _230);
    float _234 = fma(_214, _102, _226);
    float _236 = in.m_36.w;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = _96 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _244 = fma(_232, 0.5, 0.5);
    float _246 = in.m_38.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_34.z;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = fma(_216, _242, _234);
    float _260 = _244 * _244;
    float _262 = in.m_34.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = fma(_174, _196, _228);
    float _270 = _98 * _188;
    float _272 = precise::max(_258, -1.0);
    float _274 = _98 * _202;
    float _276 = precise::max(0.0, _260);
    float _278 = abs(_268);
    float _280 = fma(_278, -2.0, 2.0);
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = precise::min(_272, 1.5);
    float _286 = _98 * _208;
    float _288 = precise::min(_276, 1.7999999523162841796875);
    float _290 = fma(_284, -0.20000000298023223876953125, 0.300000011920928955078125);
    float _292 = fma(_288, 0.5555555820465087890625, _290);
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = fma(_282, -2.0, 3.0);
    float _298 = _282 * _282;
    float _300 = _294 * 0.699999988079071044921875;
    float _302 = _296 * _298;
    float _304 = _98 * _240;
    float _306 = _274 * _300;
    float _308 = _286 * _300;
    float _310 = _270 * _300;
    bool _314 = _304 != 1.0;
    bool _316 = isnan(_304);
    bool _318 = _314 || _316;
    bool _320 = isnan(1.0);
    bool _322 = _318 || _320;
    float _324 = fma(_274, 0.300000011920928955078125, _306);
    float _326 = fma(_270, 0.300000011920928955078125, _310);
    float _328 = fma(_286, 0.300000011920928955078125, _308);
    float _330 = _98 * _266;
    float _332 = _302 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _334 = _98 * _222;
    float _336 = _98 * _256;
    float _338 = fma(_330, _332, _324);
    float _340 = fma(_334, _332, _328);
    float _342 = fma(_336, _332, _326);
    float _344 = _98 * _250;
    bool _346 = !_322;
    if (!_346)
    {
        float _348 = gl_FragCoord.x;
        float _350 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _352 = _348 / _350;
        float _354 = gl_FragCoord.y;
        float _356 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _358 = _354 / _356;
        float _360 = trunc(_352);
        int _363 = int(_360);
        float _365 = trunc(_358);
        int _367 = int(_365);
        int _369 = _363 + 2;
        int _371 = _369 >> 1;
        uint _374 = uint(int(uint(_367) >> uint(1)));
        int _376 = _371 ^ int(_374);
        int _378 = _376 << 16;
        int _380 = _378 ^ _371;
        int _382 = 983055 & _380;
        float _384 = _304 * 256.0;
        int _386 = _382 << 6;
        int _388 = _386 + _382;
        float _390 = trunc(_384);
        int _392 = int(_390);
        int _394 = _388 & 13369548;
        uint _396 = uint(int(uint(_394) >> uint(3)));
        int _398 = _394 | int(_396);
        int _400 = _398 & 5570560;
        int _402 = _398 & 85;
        uint _404 = uint(int(uint(_392) >> uint(7)));
        int _406 = int(_404) + _392;
        uint _408 = uint(int(uint(_400) >> uint(15)));
        int _410 = int(_408) + _402;
        bool _412 = uint(_406) > uint(_410);
        if (!_412)
        {
            discard_fragment();
        }
        if (!_412)
        {
            out.m_41.x = _338;
            out.m_41.y = _340;
            out.m_41.z = _342;
            out.m_41.w = _344;
            return out;
        }
    }
    float _414 = _340 * 0.715200006961822509765625;
    float _416 = in.m_43.w;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_43.x;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_43.y;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = fma(_338, 0.2125999927520751953125, _414);
    float _436 = in.m_43.z;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = fma(_342, 0.072200000286102294921875, _434);
    bool _444 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _446 = 1.0 / _442;
    float _448 = _446 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = fma(_450, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _454 = _98 * _420;
    float _456 = 0.0 + _344;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = _98 * _426;
    float _462 = _452 * _454;
    float _464 = _98 * _432;
    float _466 = _98 * _440;
    float _468 = fma(_338, _462, _460);
    float _470 = fma(_340, _462, _464);
    float _472 = fma(_342, _462, _466);
    float _474 = _460;
    if (!_444)
    {
        _474 = _458;
    }
    float _476 = _474;
    bool _478 = !_444;
    float _480 = _476;
    if (!_478)
    {
        float _482 = in.m_45.w;
        float _484 = gl_FragCoord.w;
        float _486 = _482 * _484;
        float _488 = in.m_45.z;
        float _490 = gl_FragCoord.w;
        float _492 = _488 * _490;
        float _494 = _98 * _486;
        float _496 = _98 * _492;
        float _498 = 1.0 / _494;
        float _500 = _496 * _498;
        float _502 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _504 = fma(_500, (*spvDescriptorSet0.fp_c8)._m0[30].w, _502);
        float _506 = 1.0 / _504;
        float _508 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _510 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _512 = fma(_506, _508, _510);
        float _514 = _512 * 8.0;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = _458 * _516;
        _480 = _518;
    }
    float _520 = _480;
    float _522 = 0.0 + _520;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    out.m_41.x = _468;
    out.m_41.y = _470;
    out.m_41.z = _472;
    out.m_41.w = _524;
    return out;
}

