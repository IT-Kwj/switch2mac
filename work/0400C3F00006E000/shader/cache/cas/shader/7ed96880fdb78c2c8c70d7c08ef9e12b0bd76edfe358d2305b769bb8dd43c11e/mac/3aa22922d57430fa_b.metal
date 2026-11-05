#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
};

static inline __attribute__((always_inline))
int _72(thread const int& _3031, thread const int& _3032, constant _10& support_buffer)
{
    float _3035 = as_type<float>(support_buffer._m4);
    int _3037 = _3032 + as_type<int>(_3035);
    int _3039 = 1 + _3037;
    float _3041 = support_buffer._m5[_3039].x;
    float _3043 = abs(_3041);
    bool _3045 = _3043 == 1.0;
    if (_3045)
    {
        return _3031;
    }
    float _3047 = float(_3031);
    float _3049 = _3047 / _3043;
    int _3051 = int(_3049);
    return _3051;
}

static inline __attribute__((always_inline))
int _73(thread const int& _3081, thread const int& _3082, constant _10& support_buffer)
{
    float _3085 = as_type<float>(support_buffer._m4);
    int _3087 = _3082 + as_type<int>(_3085);
    int _3089 = 1 + _3087;
    float _3091 = support_buffer._m5[_3089].x;
    bool _3093 = _3091 == 1.0;
    if (_3093)
    {
        return _3081;
    }
    float _3095 = float(_3081);
    float _3097 = _3095 * _3091;
    int _3099 = int(_3097);
    return _3099;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _393 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_37.w;
    float _79 = trunc(_77);
    int _81 = int(_79);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_40.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1239 = as_type<float>(_97);
        out.gl_Position.z = _1239;
    }
    if (!_85)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_42.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_81);
        _91 = _117;
    }
    float _119 = _91;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_40.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _99 = as_type<int>(_131);
    }
    int _133 = _99;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1308 = as_type<float>(_133);
        out.gl_Position.z = _1308;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_44.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_42.x;
    float _157 = in.m_42.y;
    float _159 = in.m_42.z;
    float _161 = _139 * _137;
    float _163 = 0.0;
    float _165 = _143;
    if (!_153)
    {
        float _167 = _143 * _143;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _175 = _171;
    if (!_153)
    {
        float _177 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = _173 * 6.283185482025146484375;
    float _183 = floor(_173);
    int _185 = as_type<int>(_141) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_141) & 2;
    bool _191 = _189 != 0;
    float _193 = _181 * 0.15915493667125701904296875;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = _193 * 6.283185482025146484375;
    float _201 = cos(_199);
    bool _203 = !_191;
    int _205 = _203 ? (-1090519040) : 1056964608;
    float _207 = -_183;
    float _209 = _173 + _207;
    bool _211 = !_187;
    int _213 = _211 ? (-1090519040) : 1056964608;
    bool _215 = _209 < 0.5;
    float _217 = float(_215);
    bool _219 = !_153;
    float _221 = _179;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _143 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _143);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_153;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _143 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _165 = _275;
    }
    float _277 = _165;
    float _279 = fma(_201, 0.5, 0.5);
    float _281 = -_217;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = -_209;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _289 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _291 = -_279;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _297 = _295 != 0;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _301 = _299 != 0;
    float _303 = in.m_49.w;
    float _305 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _307 = _289 * _135;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = in.m_37.x;
    float _313 = in.m_37.y;
    float _315 = in.m_37.z;
    bool _317 = !_297;
    int _319 = _317 ? 0 : 1;
    float _321 = fma(_277, _155, _305);
    bool _323 = !_197;
    int _325 = _323 ? 0 : 1;
    out.m_51.x = as_type<float>(_213);
    out.m_51.y = as_type<float>(_205);
    bool _327 = !_301;
    int _329 = _327 ? 0 : 1;
    float _331 = trunc(_307);
    int _333 = int(_331);
    int _335 = abs(_319);
    int _337 = abs(_325);
    float _339 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _341 = abs(_329);
    float _343 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = float(_335);
    float _347 = fma(_277, _157, _339);
    float _349 = float(_337);
    float _351 = fma(_277, _159, _343);
    float _353 = abs(_287);
    float _355 = _345 * _353;
    float _357 = float(_341);
    float _359 = fma(_349, _293, _355);
    int _361 = _333 << 4;
    int _363 = _361 + 1712;
    float _365 = fma(_321, _303, _311);
    float _367 = fma(_351, _303, _315);
    float _369 = fma(_347, _303, _313);
    float _371 = abs(_283);
    float _373 = fma(_357, _371, _359);
    bool _375 = !_309;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _379 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_81);
        float _397 = 1.0 / _395;
        float _399 = _115 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    int _403 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _405 = _403;
    int _407 = 0;
    int _409 = _72(_405, _407, (*spvDescriptorSet0.support_buffer));
    int _411 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _413 = _411;
    int _415 = 0;
    int _417 = _72(_413, _415, (*spvDescriptorSet0.support_buffer));
    float _419 = in.m_53.w;
    float _421 = trunc(_419);
    int _423 = int(_421);
    int _425 = abs(_423);
    uint _428 = uint(int(uint(_423) >> uint(31)));
    float _430 = float(uint(_425));
    int _432 = ~int(_428);
    int _434 = _432 + 1;
    float _436 = float(_417);
    float _438 = float(_409);
    float _440 = trunc(_436);
    int _442 = int(_440);
    int _444 = abs(_442);
    bool _446 = _442 == 0;
    float _448 = float(uint(_444));
    int _450 = ~_444;
    int _452 = _450 + 1;
    int _454 = ~_444;
    int _456 = _454 + 1;
    float _458 = 1.0 / _448;
    float _460 = _438 + 9.9999997473787516355514526367188e-06;
    float _462 = 1.0 / _460;
    int _464 = as_type<int>(_458) + (-2);
    float _466 = as_type<float>(_464) * _430;
    float _468 = trunc(_466);
    float _470 = precise::max(_468, 0.0);
    uint _472 = uint(_470);
    int _474 = _452 * int(_472);
    int _476 = _474 + _425;
    float _478 = float(uint(_476));
    float _480 = _115 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _482 = as_type<float>(_464) * _478;
    float _484 = fma(_480, _462, _135);
    float _486 = _438 + (-1.0);
    float _488 = floor(_484);
    float _490 = trunc(_482);
    float _492 = precise::max(_490, 0.0);
    uint _494 = uint(_492);
    float _496 = -_488;
    float _498 = _484 + _496;
    float _500 = trunc(_486);
    int _502 = int(_500);
    float _504 = _438 * _498;
    int _506 = int(_472) + int(_494);
    float _508 = trunc(_504);
    int _510 = int(_508);
    int _512 = _456 * _506;
    int _514 = _512 + _425;
    bool _516 = uint(_514) >= uint(_444);
    bool _518 = !_516;
    int _520 = _518 ? 0 : (-1);
    bool _522 = _510 >= _502;
    int _524 = ~_506;
    int _526 = _524 + _520;
    int _528 = _526 + 1;
    int _530 = _444 * _528;
    int _532 = _530 + _425;
    int _534 = _532 ^ _434;
    int _536 = ~_434;
    int _538 = _536 + _534;
    int _540 = _538 + 1;
    int _542 = _510 + 1;
    bool _544 = !_446;
    int _546 = _544 ? _540 : (-1);
    bool _548 = !_522;
    int _550 = _548 ? _542 : 0;
    int _552 = _510;
    int _554 = 0;
    int _556 = _73(_552, _554, (*spvDescriptorSet0.support_buffer));
    int _558 = _546;
    int _560 = 0;
    int _562 = _73(_558, _560, (*spvDescriptorSet0.support_buffer));
    float3 _566 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_556, _562)), 0).xyz;
    float _568 = _566.x;
    float _570 = _566.y;
    float _572 = _566.z;
    int _574 = _550;
    int _576 = 0;
    int _578 = _73(_574, _576, (*spvDescriptorSet0.support_buffer));
    int _580 = _546;
    int _582 = 0;
    int _584 = _73(_580, _582, (*spvDescriptorSet0.support_buffer));
    float3 _586 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_578, _584)), 0).xyz;
    float _588 = _586.x;
    float _590 = _586.y;
    float _592 = _586.z;
    float _594 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    uint _596 = uint(int(uint(_363) >> uint(2)));
    uint _598 = uint(int(uint(int(_596)) >> uint(2)));
    int _600 = int(_596) & 3;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[int(_598)][_600];
    int _604 = int(_596) + 1;
    uint _606 = uint(int(uint(_604) >> uint(2)));
    int _608 = _604 & 3;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[int(_606)][_608];
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _614 = _401 + _612;
    float _616 = _594 * _135;
    bool _618 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _620 = isnan(_401);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _634 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _636 = isnan(_401);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    int _646 = _363 + 8;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    uint _650 = uint(int(uint(int(_648)) >> uint(2)));
    int _652 = int(_648) & 3;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[int(_650)][_652];
    float _656 = trunc(_616);
    int _658 = int(_656);
    float _660 = -_628;
    float _662 = _660 + 1.0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _668 = _644 * _662;
    float _670 = 1.0 / _632;
    float _672 = -_644;
    float _674 = _672 + 1.0;
    int _676 = _658 << 4;
    int _678 = _676 + 1968;
    float _680 = 1.0 / _666;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _682;
    uint _686 = uint(int(uint(_678) >> uint(2)));
    uint _688 = uint(int(uint(int(_686)) >> uint(2)));
    int _690 = int(_686) & 3;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[int(_688)][_690];
    int _694 = int(_686) + 1;
    uint _696 = uint(int(uint(_694) >> uint(2)));
    int _698 = _694 & 3;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[int(_696)][_698];
    float _702 = _684 * _670;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _708 = _678 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[int(_712)][_714];
    float _718 = fma(_702, _614, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _720 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _722 = isnan(_401);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _718 * _668;
    float _734 = _706 * _680;
    float _736 = -_730;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _742 = _401 + _740;
    float _744 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[115].x, _732);
    float _746 = _628 * _738;
    float _748 = fma(_734, _742, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _750 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _752 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _756 = fma(_748, _746, _744);
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _764 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[117].x, _756);
    float _766 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _768 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _770 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _762);
    float _772 = _764 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _774 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _766);
    float _776 = floor(_504);
    float _778 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _780 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _770);
    float _782 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _774);
    float _784 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _786 = _778 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _788 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _758;
    out.m_55.y = _788;
    out.m_55.z = _790;
    out.m_55.w = _772;
    float _792 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _794 = _700 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _796 = in.m_49.x;
    float _798 = in.m_49.y;
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _806 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _800;
    out.m_57.y = _802;
    out.m_57.z = _806;
    out.m_57.w = _754;
    float _808 = -_776;
    float _810 = _504 + _808;
    float _812 = -_570;
    float _814 = _812 + _590;
    float _816 = -_568;
    float _818 = _816 + _588;
    float _820 = -_572;
    float _822 = _820 + _592;
    float _824 = fma(_810, _814, _570);
    float _826 = fma(_810, _818, _568);
    float _828 = fma(_810, _822, _572);
    float _830 = _780 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _832 = _824 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _834 = _824 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[5].x, _832);
    float _838 = _824 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _840 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[4].x, _834);
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[5].z, _836);
    float _844 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[6].x, _838);
    float _846 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[4].z, _840);
    float _848 = _798 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _850 = _786 + _842;
    float _852 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[6].z, _844);
    float _854 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _856 = _830 + _846;
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _850 + _858;
    float _862 = _854 + _852;
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _866 = _856 + _864;
    float _868 = _860 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _862 + _870;
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[28].x, _868);
    float _876 = _860 * _860;
    float _878 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _874);
    bool _880 = _878 >= 0.0;
    float _882 = fma(_866, _866, _876);
    float _884 = fma(_872, _872, _882);
    float _886 = _796 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _888 = rsqrt(_884);
    float _890 = _373 * _886;
    float _892 = _373 * _848;
    float _894 = _790;
    float _896 = _850;
    if (_880)
    {
        _894 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _898 = _894;
    int _900 = as_type<int>(_898);
    if (_880)
    {
        out.m_40.x = 0.0;
    }
    if (_880)
    {
        float _902 = _898 * 5.0;
        _900 = as_type<int>(_902);
    }
    int _904 = _900;
    int _906 = _904;
    if (_880)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2483 = as_type<float>(_904);
        out.gl_Position.z = _2483;
    }
    float _908 = _860 * _888;
    float _910 = _866 * _888;
    if (_880)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _912 = -_908;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _916 = -_910;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _920 = -_908;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _924 = -_910;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = _914 + _928;
    float _932 = _872 * _888;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _936 = _918 + _934;
    float _938 = _922 * _922;
    float _940 = _930 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _942 = -_932;
    float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _946 = -_932;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _950 = fma(_926, _926, _938);
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].x, _940);
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _956 = _944 + _954;
    float _958 = fma(_948, _948, _950);
    float _960 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[28].z, _952);
    float _962 = sqrt(_958);
    bool _964 = _960 >= 0.0;
    float _966 = _936;
    if (_964)
    {
        _966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _968 = _966;
    if (_964)
    {
        out.m_40.x = 0.0;
    }
    float _970 = _888 * _962;
    if (_964)
    {
        float _972 = _968 * 5.0;
        _906 = as_type<int>(_972);
    }
    int _974 = _906;
    if (_964)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2615 = as_type<float>(_974);
        out.gl_Position.z = _2615;
    }
    if (_964)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _976 = _892 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _978 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_205));
    float _980 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_213));
    float _984 = _970 * _976;
    float _986 = _970 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _988 = _986 * 0.5;
    float _990 = _970 * _980;
    float _992 = _978 * _984;
    float _994 = _982 * _990;
    float _996 = _992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _998 = _992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[26].x, _996);
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[24].x, _998);
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1002);
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1006);
    float _1014 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1020 = _862 + _1014;
    float _1022 = _856 + _1016;
    float _1024 = _850 + _1018;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1028 = _1020 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1032 = _1022 + _1030;
    float _1034 = _1028 * _1028;
    float _1036 = fma(_1032, _1032, _1034);
    float _1038 = sqrt(_1036);
    bool _1040 = _1038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1018;
    float _1044 = _1012;
    if (!_1040)
    {
        _1042 = _1022;
    }
    float _1046 = _1042;
    float _1048 = _1046;
    if (!_1040)
    {
        _1044 = _1020;
    }
    float _1050 = _1044;
    float _1052 = _1050;
    if (!_1040)
    {
        _896 = _1024;
    }
    float _1054 = _896;
    bool _1056 = !_1040;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _1038 + _1062;
        float _1066 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = _1064 * _1060;
        float _1070 = rsqrt(_1036);
        float _1072 = _1068 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1024, _1076, _1084);
        float _1090 = _1070 * _1086;
        float _1092 = fma(_1032, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_1028, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1058 = _1088;
        _1048 = _1092;
        _1052 = _1094;
    }
    float _1096 = _1058;
    float _1098 = _1048;
    float _1100 = _1052;
    float _1102 = -_908;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1096);
    float _1106 = -_910;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1098);
    float _1110 = -_932;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1116 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1118 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1120 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1122 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1114);
    float _1124 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1116);
    float _1126 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1118);
    float _1128 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1120);
    float _1130 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1122);
    float _1132 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1124);
    float _1134 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1126);
    float _1136 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1128);
    float _1138 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1140 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1142 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1144 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1146 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1150 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1152 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1154 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1146);
    float _1156 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1148);
    float _1158 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1150);
    float _1160 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1152);
    float _1162 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1154);
    float _1164 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1156);
    float _1166 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1158);
    float _1168 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1160);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1162);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1164);
    float _1174 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1166);
    float _1176 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1168);
    float _1178 = _1170 + _1172;
    float _1180 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1182 = _1178 * 0.5;
    out.m_40.x = _1180;
    out.gl_Position.x = _1174;
    out.gl_Position.y = _1176;
    out.gl_Position.z = _1170;
    out.gl_Position.w = _1172;
    out.m_59.z = _1182;
    out.m_59.w = _1172;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _393 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_37.w;
    float _79 = trunc(_77);
    int _81 = int(_79);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_40.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1239 = as_type<float>(_97);
        out.gl_Position.z = _1239;
    }
    if (!_85)
    {
        return out;
    }
    float _101 = in.m_42.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_81);
        _91 = _117;
    }
    float _119 = _91;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_40.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _99 = as_type<int>(_131);
    }
    int _133 = _99;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1308 = as_type<float>(_133);
        out.gl_Position.z = _1308;
    }
    if (_125)
    {
        return out;
    }
    float _135 = in.m_44.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_42.x;
    float _157 = in.m_42.y;
    float _159 = in.m_42.z;
    float _161 = _139 * _137;
    float _163 = 0.0;
    float _165 = _143;
    if (!_153)
    {
        float _167 = _143 * _143;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _175 = _171;
    if (!_153)
    {
        float _177 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = _173 * 6.283185482025146484375;
    float _183 = floor(_173);
    int _185 = as_type<int>(_141) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_141) & 2;
    bool _191 = _189 != 0;
    float _193 = _181 * 0.15915493667125701904296875;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = _193 * 6.283185482025146484375;
    float _201 = cos(_199);
    bool _203 = !_191;
    int _205 = _203 ? (-1090519040) : 1056964608;
    float _207 = -_183;
    float _209 = _173 + _207;
    bool _211 = !_187;
    int _213 = _211 ? (-1090519040) : 1056964608;
    bool _215 = _209 < 0.5;
    float _217 = float(_215);
    bool _219 = !_153;
    float _221 = _179;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _143 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _143);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_153;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _143 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _165 = _275;
    }
    float _277 = _165;
    float _279 = fma(_201, 0.5, 0.5);
    float _281 = -_217;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = -_209;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _289 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _291 = -_279;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _297 = _295 != 0;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _301 = _299 != 0;
    float _303 = in.m_49.w;
    float _305 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _307 = _289 * _135;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = in.m_37.x;
    float _313 = in.m_37.y;
    float _315 = in.m_37.z;
    bool _317 = !_297;
    int _319 = _317 ? 0 : 1;
    float _321 = fma(_277, _155, _305);
    bool _323 = !_197;
    int _325 = _323 ? 0 : 1;
    out.m_51.x = as_type<float>(_213);
    out.m_51.y = as_type<float>(_205);
    bool _327 = !_301;
    int _329 = _327 ? 0 : 1;
    float _331 = trunc(_307);
    int _333 = int(_331);
    int _335 = abs(_319);
    int _337 = abs(_325);
    float _339 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _341 = abs(_329);
    float _343 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = float(_335);
    float _347 = fma(_277, _157, _339);
    float _349 = float(_337);
    float _351 = fma(_277, _159, _343);
    float _353 = abs(_287);
    float _355 = _345 * _353;
    float _357 = float(_341);
    float _359 = fma(_349, _293, _355);
    int _361 = _333 << 4;
    int _363 = _361 + 1712;
    float _365 = fma(_321, _303, _311);
    float _367 = fma(_351, _303, _315);
    float _369 = fma(_347, _303, _313);
    float _371 = abs(_283);
    float _373 = fma(_357, _371, _359);
    bool _375 = !_309;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _379 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_81);
        float _397 = 1.0 / _395;
        float _399 = _115 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    int _403 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _405 = _403;
    int _407 = 0;
    int _409 = _72(_405, _407, (*spvDescriptorSet0.support_buffer));
    int _411 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _413 = _411;
    int _415 = 0;
    int _417 = _72(_413, _415, (*spvDescriptorSet0.support_buffer));
    float _419 = in.m_53.w;
    float _421 = trunc(_419);
    int _423 = int(_421);
    int _425 = abs(_423);
    uint _428 = uint(int(uint(_423) >> uint(31)));
    float _430 = float(uint(_425));
    int _432 = ~int(_428);
    int _434 = _432 + 1;
    float _436 = float(_417);
    float _438 = float(_409);
    float _440 = trunc(_436);
    int _442 = int(_440);
    int _444 = abs(_442);
    bool _446 = _442 == 0;
    float _448 = float(uint(_444));
    int _450 = ~_444;
    int _452 = _450 + 1;
    int _454 = ~_444;
    int _456 = _454 + 1;
    float _458 = 1.0 / _448;
    float _460 = _438 + 9.9999997473787516355514526367188e-06;
    float _462 = 1.0 / _460;
    int _464 = as_type<int>(_458) + (-2);
    float _466 = as_type<float>(_464) * _430;
    float _468 = trunc(_466);
    float _470 = precise::max(_468, 0.0);
    uint _472 = uint(_470);
    int _474 = _452 * int(_472);
    int _476 = _474 + _425;
    float _478 = float(uint(_476));
    float _480 = _115 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _482 = as_type<float>(_464) * _478;
    float _484 = fma(_480, _462, _135);
    float _486 = _438 + (-1.0);
    float _488 = floor(_484);
    float _490 = trunc(_482);
    float _492 = precise::max(_490, 0.0);
    uint _494 = uint(_492);
    float _496 = -_488;
    float _498 = _484 + _496;
    float _500 = trunc(_486);
    int _502 = int(_500);
    float _504 = _438 * _498;
    int _506 = int(_472) + int(_494);
    float _508 = trunc(_504);
    int _510 = int(_508);
    int _512 = _456 * _506;
    int _514 = _512 + _425;
    bool _516 = uint(_514) >= uint(_444);
    bool _518 = !_516;
    int _520 = _518 ? 0 : (-1);
    bool _522 = _510 >= _502;
    int _524 = ~_506;
    int _526 = _524 + _520;
    int _528 = _526 + 1;
    int _530 = _444 * _528;
    int _532 = _530 + _425;
    int _534 = _532 ^ _434;
    int _536 = ~_434;
    int _538 = _536 + _534;
    int _540 = _538 + 1;
    int _542 = _510 + 1;
    bool _544 = !_446;
    int _546 = _544 ? _540 : (-1);
    bool _548 = !_522;
    int _550 = _548 ? _542 : 0;
    int _552 = _510;
    int _554 = 0;
    int _556 = _73(_552, _554, (*spvDescriptorSet0.support_buffer));
    int _558 = _546;
    int _560 = 0;
    int _562 = _73(_558, _560, (*spvDescriptorSet0.support_buffer));
    float3 _566 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_556, _562)), 0).xyz;
    float _568 = _566.x;
    float _570 = _566.y;
    float _572 = _566.z;
    int _574 = _550;
    int _576 = 0;
    int _578 = _73(_574, _576, (*spvDescriptorSet0.support_buffer));
    int _580 = _546;
    int _582 = 0;
    int _584 = _73(_580, _582, (*spvDescriptorSet0.support_buffer));
    float3 _586 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_578, _584)), 0).xyz;
    float _588 = _586.x;
    float _590 = _586.y;
    float _592 = _586.z;
    float _594 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    uint _596 = uint(int(uint(_363) >> uint(2)));
    uint _598 = uint(int(uint(int(_596)) >> uint(2)));
    int _600 = int(_596) & 3;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[int(_598)][_600];
    int _604 = int(_596) + 1;
    uint _606 = uint(int(uint(_604) >> uint(2)));
    int _608 = _604 & 3;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[int(_606)][_608];
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _614 = _401 + _612;
    float _616 = _594 * _135;
    bool _618 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _620 = isnan(_401);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _634 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _636 = isnan(_401);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    int _646 = _363 + 8;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    uint _650 = uint(int(uint(int(_648)) >> uint(2)));
    int _652 = int(_648) & 3;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[int(_650)][_652];
    float _656 = trunc(_616);
    int _658 = int(_656);
    float _660 = -_628;
    float _662 = _660 + 1.0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _668 = _644 * _662;
    float _670 = 1.0 / _632;
    float _672 = -_644;
    float _674 = _672 + 1.0;
    int _676 = _658 << 4;
    int _678 = _676 + 1968;
    float _680 = 1.0 / _666;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _682;
    uint _686 = uint(int(uint(_678) >> uint(2)));
    uint _688 = uint(int(uint(int(_686)) >> uint(2)));
    int _690 = int(_686) & 3;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[int(_688)][_690];
    int _694 = int(_686) + 1;
    uint _696 = uint(int(uint(_694) >> uint(2)));
    int _698 = _694 & 3;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[int(_696)][_698];
    float _702 = _684 * _670;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _708 = _678 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[int(_712)][_714];
    float _718 = fma(_702, _614, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _720 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _722 = isnan(_401);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _718 * _668;
    float _734 = _706 * _680;
    float _736 = -_730;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _742 = _401 + _740;
    float _744 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[115].x, _732);
    float _746 = _628 * _738;
    float _748 = fma(_734, _742, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _750 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _752 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _756 = fma(_748, _746, _744);
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _764 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[117].x, _756);
    float _766 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _768 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _770 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _762);
    float _772 = _764 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _774 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _766);
    float _776 = floor(_504);
    float _778 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _780 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _770);
    float _782 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _774);
    float _784 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _786 = _778 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _788 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _758;
    out.m_55.y = _788;
    out.m_55.z = _790;
    out.m_55.w = _772;
    float _792 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _794 = _700 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _796 = in.m_49.x;
    float _798 = in.m_49.y;
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _806 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _800;
    out.m_57.y = _802;
    out.m_57.z = _806;
    out.m_57.w = _754;
    float _808 = -_776;
    float _810 = _504 + _808;
    float _812 = -_570;
    float _814 = _812 + _590;
    float _816 = -_568;
    float _818 = _816 + _588;
    float _820 = -_572;
    float _822 = _820 + _592;
    float _824 = fma(_810, _814, _570);
    float _826 = fma(_810, _818, _568);
    float _828 = fma(_810, _822, _572);
    float _830 = _780 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _832 = _824 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _834 = _824 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[5].x, _832);
    float _838 = _824 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _840 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[4].x, _834);
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[5].z, _836);
    float _844 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[6].x, _838);
    float _846 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[4].z, _840);
    float _848 = _798 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _850 = _786 + _842;
    float _852 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[6].z, _844);
    float _854 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _856 = _830 + _846;
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _850 + _858;
    float _862 = _854 + _852;
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _866 = _856 + _864;
    float _868 = _860 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _862 + _870;
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[28].x, _868);
    float _876 = _860 * _860;
    float _878 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _874);
    bool _880 = _878 >= 0.0;
    float _882 = fma(_866, _866, _876);
    float _884 = fma(_872, _872, _882);
    float _886 = _796 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _888 = rsqrt(_884);
    float _890 = _373 * _886;
    float _892 = _373 * _848;
    float _894 = _790;
    float _896 = _850;
    if (_880)
    {
        _894 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _898 = _894;
    int _900 = as_type<int>(_898);
    if (_880)
    {
        out.m_40.x = 0.0;
    }
    if (_880)
    {
        float _902 = _898 * 5.0;
        _900 = as_type<int>(_902);
    }
    int _904 = _900;
    int _906 = _904;
    if (_880)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2483 = as_type<float>(_904);
        out.gl_Position.z = _2483;
    }
    float _908 = _860 * _888;
    float _910 = _866 * _888;
    if (_880)
    {
        return out;
    }
    float _912 = -_908;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _916 = -_910;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _920 = -_908;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _924 = -_910;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = _914 + _928;
    float _932 = _872 * _888;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _936 = _918 + _934;
    float _938 = _922 * _922;
    float _940 = _930 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _942 = -_932;
    float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _946 = -_932;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _950 = fma(_926, _926, _938);
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].x, _940);
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _956 = _944 + _954;
    float _958 = fma(_948, _948, _950);
    float _960 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[28].z, _952);
    float _962 = sqrt(_958);
    bool _964 = _960 >= 0.0;
    float _966 = _936;
    if (_964)
    {
        _966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _968 = _966;
    if (_964)
    {
        out.m_40.x = 0.0;
    }
    float _970 = _888 * _962;
    if (_964)
    {
        float _972 = _968 * 5.0;
        _906 = as_type<int>(_972);
    }
    int _974 = _906;
    if (_964)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2615 = as_type<float>(_974);
        out.gl_Position.z = _2615;
    }
    if (_964)
    {
        return out;
    }
    float _976 = _892 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _978 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_205));
    float _980 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_213));
    float _984 = _970 * _976;
    float _986 = _970 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _988 = _986 * 0.5;
    float _990 = _970 * _980;
    float _992 = _978 * _984;
    float _994 = _982 * _990;
    float _996 = _992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _998 = _992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[26].x, _996);
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[24].x, _998);
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1002);
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1006);
    float _1014 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1020 = _862 + _1014;
    float _1022 = _856 + _1016;
    float _1024 = _850 + _1018;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1028 = _1020 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1032 = _1022 + _1030;
    float _1034 = _1028 * _1028;
    float _1036 = fma(_1032, _1032, _1034);
    float _1038 = sqrt(_1036);
    bool _1040 = _1038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1018;
    float _1044 = _1012;
    if (!_1040)
    {
        _1042 = _1022;
    }
    float _1046 = _1042;
    float _1048 = _1046;
    if (!_1040)
    {
        _1044 = _1020;
    }
    float _1050 = _1044;
    float _1052 = _1050;
    if (!_1040)
    {
        _896 = _1024;
    }
    float _1054 = _896;
    bool _1056 = !_1040;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _1038 + _1062;
        float _1066 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = _1064 * _1060;
        float _1070 = rsqrt(_1036);
        float _1072 = _1068 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1024, _1076, _1084);
        float _1090 = _1070 * _1086;
        float _1092 = fma(_1032, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_1028, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1058 = _1088;
        _1048 = _1092;
        _1052 = _1094;
    }
    float _1096 = _1058;
    float _1098 = _1048;
    float _1100 = _1052;
    float _1102 = -_908;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1096);
    float _1106 = -_910;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1098);
    float _1110 = -_932;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1116 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1118 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1120 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1122 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1114);
    float _1124 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1116);
    float _1126 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1118);
    float _1128 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1120);
    float _1130 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1122);
    float _1132 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1124);
    float _1134 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1126);
    float _1136 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1128);
    float _1138 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1140 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1142 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1144 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1146 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1150 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1152 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1154 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1146);
    float _1156 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1148);
    float _1158 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1150);
    float _1160 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1152);
    float _1162 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1154);
    float _1164 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1156);
    float _1166 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1158);
    float _1168 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1160);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1162);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1164);
    float _1174 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1166);
    float _1176 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1168);
    float _1178 = _1170 + _1172;
    float _1180 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1182 = _1178 * 0.5;
    out.m_40.x = _1180;
    out.gl_Position.x = _1174;
    out.gl_Position.y = _1176;
    out.gl_Position.z = _1170;
    out.gl_Position.w = _1172;
    out.m_59.z = _1182;
    out.m_59.w = _1172;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _393 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_37.w;
    float _79 = trunc(_77);
    int _81 = int(_79);
    bool _85 = _81 >= 1;
    float _87 = 0.0;
    if (!_85)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_85)
    {
        out.m_40.x = 0.0;
    }
    int _93 = 0;
    if (!_85)
    {
        float _95 = _89 * 5.0;
        _93 = as_type<int>(_95);
    }
    int _97 = _93;
    int _99 = _97;
    if (!_85)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1239 = as_type<float>(_97);
        out.gl_Position.z = _1239;
    }
    if (!_85)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_42.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_81);
        _91 = _117;
    }
    float _119 = _91;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_40.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _99 = as_type<int>(_131);
    }
    int _133 = _99;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1308 = as_type<float>(_133);
        out.gl_Position.z = _1308;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_44.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_42.x;
    float _157 = in.m_42.y;
    float _159 = in.m_42.z;
    float _161 = _139 * _137;
    float _163 = 0.0;
    float _165 = _143;
    if (!_153)
    {
        float _167 = _143 * _143;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _175 = _171;
    if (!_153)
    {
        float _177 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = _173 * 6.283185482025146484375;
    float _183 = floor(_173);
    int _185 = as_type<int>(_141) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_141) & 2;
    bool _191 = _189 != 0;
    float _193 = _181 * 0.15915493667125701904296875;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = _193 * 6.283185482025146484375;
    float _201 = cos(_199);
    bool _203 = !_191;
    int _205 = _203 ? (-1090519040) : 1056964608;
    float _207 = -_183;
    float _209 = _173 + _207;
    bool _211 = !_187;
    int _213 = _211 ? (-1090519040) : 1056964608;
    bool _215 = _209 < 0.5;
    float _217 = float(_215);
    bool _219 = !_153;
    float _221 = _179;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _143 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _143);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_153;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _143 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _165 = _275;
    }
    float _277 = _165;
    float _279 = fma(_201, 0.5, 0.5);
    float _281 = -_217;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = -_209;
    float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _289 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _291 = -_279;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _297 = _295 != 0;
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _301 = _299 != 0;
    float _303 = in.m_49.w;
    float _305 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _307 = _289 * _135;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = in.m_37.x;
    float _313 = in.m_37.y;
    float _315 = in.m_37.z;
    bool _317 = !_297;
    int _319 = _317 ? 0 : 1;
    float _321 = fma(_277, _155, _305);
    bool _323 = !_197;
    int _325 = _323 ? 0 : 1;
    out.m_51.x = as_type<float>(_213);
    out.m_51.y = as_type<float>(_205);
    bool _327 = !_301;
    int _329 = _327 ? 0 : 1;
    float _331 = trunc(_307);
    int _333 = int(_331);
    int _335 = abs(_319);
    int _337 = abs(_325);
    float _339 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _341 = abs(_329);
    float _343 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = float(_335);
    float _347 = fma(_277, _157, _339);
    float _349 = float(_337);
    float _351 = fma(_277, _159, _343);
    float _353 = abs(_287);
    float _355 = _345 * _353;
    float _357 = float(_341);
    float _359 = fma(_349, _293, _355);
    int _361 = _333 << 4;
    int _363 = _361 + 1712;
    float _365 = fma(_321, _303, _311);
    float _367 = fma(_351, _303, _315);
    float _369 = fma(_347, _303, _313);
    float _371 = abs(_283);
    float _373 = fma(_357, _371, _359);
    bool _375 = !_309;
    float _391;
    if (!_375)
    {
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _379 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_81);
        float _397 = 1.0 / _395;
        float _399 = _115 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    int _403 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _405 = _403;
    int _407 = 0;
    int _409 = _72(_405, _407, (*spvDescriptorSet0.support_buffer));
    int _411 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _413 = _411;
    int _415 = 0;
    int _417 = _72(_413, _415, (*spvDescriptorSet0.support_buffer));
    float _419 = in.m_53.w;
    float _421 = trunc(_419);
    int _423 = int(_421);
    int _425 = abs(_423);
    uint _428 = uint(int(uint(_423) >> uint(31)));
    float _430 = float(uint(_425));
    int _432 = ~int(_428);
    int _434 = _432 + 1;
    float _436 = float(_417);
    float _438 = float(_409);
    float _440 = trunc(_436);
    int _442 = int(_440);
    int _444 = abs(_442);
    bool _446 = _442 == 0;
    float _448 = float(uint(_444));
    int _450 = ~_444;
    int _452 = _450 + 1;
    int _454 = ~_444;
    int _456 = _454 + 1;
    float _458 = 1.0 / _448;
    float _460 = _438 + 9.9999997473787516355514526367188e-06;
    float _462 = 1.0 / _460;
    int _464 = as_type<int>(_458) + (-2);
    float _466 = as_type<float>(_464) * _430;
    float _468 = trunc(_466);
    float _470 = precise::max(_468, 0.0);
    uint _472 = uint(_470);
    int _474 = _452 * int(_472);
    int _476 = _474 + _425;
    float _478 = float(uint(_476));
    float _480 = _115 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _482 = as_type<float>(_464) * _478;
    float _484 = fma(_480, _462, _135);
    float _486 = _438 + (-1.0);
    float _488 = floor(_484);
    float _490 = trunc(_482);
    float _492 = precise::max(_490, 0.0);
    uint _494 = uint(_492);
    float _496 = -_488;
    float _498 = _484 + _496;
    float _500 = trunc(_486);
    int _502 = int(_500);
    float _504 = _438 * _498;
    int _506 = int(_472) + int(_494);
    float _508 = trunc(_504);
    int _510 = int(_508);
    int _512 = _456 * _506;
    int _514 = _512 + _425;
    bool _516 = uint(_514) >= uint(_444);
    bool _518 = !_516;
    int _520 = _518 ? 0 : (-1);
    bool _522 = _510 >= _502;
    int _524 = ~_506;
    int _526 = _524 + _520;
    int _528 = _526 + 1;
    int _530 = _444 * _528;
    int _532 = _530 + _425;
    int _534 = _532 ^ _434;
    int _536 = ~_434;
    int _538 = _536 + _534;
    int _540 = _538 + 1;
    int _542 = _510 + 1;
    bool _544 = !_446;
    int _546 = _544 ? _540 : (-1);
    bool _548 = !_522;
    int _550 = _548 ? _542 : 0;
    int _552 = _510;
    int _554 = 0;
    int _556 = _73(_552, _554, (*spvDescriptorSet0.support_buffer));
    int _558 = _546;
    int _560 = 0;
    int _562 = _73(_558, _560, (*spvDescriptorSet0.support_buffer));
    float3 _566 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_556, _562)), 0).xyz;
    float _568 = _566.x;
    float _570 = _566.y;
    float _572 = _566.z;
    int _574 = _550;
    int _576 = 0;
    int _578 = _73(_574, _576, (*spvDescriptorSet0.support_buffer));
    int _580 = _546;
    int _582 = 0;
    int _584 = _73(_580, _582, (*spvDescriptorSet0.support_buffer));
    float3 _586 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_578, _584)), 0).xyz;
    float _588 = _586.x;
    float _590 = _586.y;
    float _592 = _586.z;
    float _594 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    uint _596 = uint(int(uint(_363) >> uint(2)));
    uint _598 = uint(int(uint(int(_596)) >> uint(2)));
    int _600 = int(_596) & 3;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[int(_598)][_600];
    int _604 = int(_596) + 1;
    uint _606 = uint(int(uint(_604) >> uint(2)));
    int _608 = _604 & 3;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[int(_606)][_608];
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _614 = _401 + _612;
    float _616 = _594 * _135;
    bool _618 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _620 = isnan(_401);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _634 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _636 = isnan(_401);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    int _646 = _363 + 8;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    uint _650 = uint(int(uint(int(_648)) >> uint(2)));
    int _652 = int(_648) & 3;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[int(_650)][_652];
    float _656 = trunc(_616);
    int _658 = int(_656);
    float _660 = -_628;
    float _662 = _660 + 1.0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _668 = _644 * _662;
    float _670 = 1.0 / _632;
    float _672 = -_644;
    float _674 = _672 + 1.0;
    int _676 = _658 << 4;
    int _678 = _676 + 1968;
    float _680 = 1.0 / _666;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _682;
    uint _686 = uint(int(uint(_678) >> uint(2)));
    uint _688 = uint(int(uint(int(_686)) >> uint(2)));
    int _690 = int(_686) & 3;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[int(_688)][_690];
    int _694 = int(_686) + 1;
    uint _696 = uint(int(uint(_694) >> uint(2)));
    int _698 = _694 & 3;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[int(_696)][_698];
    float _702 = _684 * _670;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _708 = _678 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[int(_712)][_714];
    float _718 = fma(_702, _614, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _720 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _722 = isnan(_401);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _718 * _668;
    float _734 = _706 * _680;
    float _736 = -_730;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _742 = _401 + _740;
    float _744 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[115].x, _732);
    float _746 = _628 * _738;
    float _748 = fma(_734, _742, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _750 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _752 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _756 = fma(_748, _746, _744);
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _764 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[117].x, _756);
    float _766 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _768 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _770 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _762);
    float _772 = _764 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _774 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _766);
    float _776 = floor(_504);
    float _778 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _780 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _770);
    float _782 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _774);
    float _784 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _786 = _778 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _788 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _758;
    out.m_55.y = _788;
    out.m_55.z = _790;
    out.m_55.w = _772;
    float _792 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _794 = _700 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _796 = in.m_49.x;
    float _798 = in.m_49.y;
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _716 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _806 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _800;
    out.m_57.y = _802;
    out.m_57.z = _806;
    out.m_57.w = _754;
    float _808 = -_776;
    float _810 = _504 + _808;
    float _812 = -_570;
    float _814 = _812 + _590;
    float _816 = -_568;
    float _818 = _816 + _588;
    float _820 = -_572;
    float _822 = _820 + _592;
    float _824 = fma(_810, _814, _570);
    float _826 = fma(_810, _818, _568);
    float _828 = fma(_810, _822, _572);
    float _830 = _780 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _832 = _824 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _834 = _824 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[5].x, _832);
    float _838 = _824 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _840 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[4].x, _834);
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[5].z, _836);
    float _844 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[6].x, _838);
    float _846 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[4].z, _840);
    float _848 = _798 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _850 = _786 + _842;
    float _852 = fma(_828, (*spvDescriptorSet0.vp_c10)._m0[6].z, _844);
    float _854 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _856 = _830 + _846;
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _850 + _858;
    float _862 = _854 + _852;
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _866 = _856 + _864;
    float _868 = _860 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _862 + _870;
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[28].x, _868);
    float _876 = _860 * _860;
    float _878 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _874);
    bool _880 = _878 >= 0.0;
    float _882 = fma(_866, _866, _876);
    float _884 = fma(_872, _872, _882);
    float _886 = _796 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _888 = rsqrt(_884);
    float _890 = _373 * _886;
    float _892 = _373 * _848;
    float _894 = _790;
    float _896 = _850;
    if (_880)
    {
        _894 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _898 = _894;
    int _900 = as_type<int>(_898);
    if (_880)
    {
        out.m_40.x = 0.0;
    }
    if (_880)
    {
        float _902 = _898 * 5.0;
        _900 = as_type<int>(_902);
    }
    int _904 = _900;
    int _906 = _904;
    if (_880)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2483 = as_type<float>(_904);
        out.gl_Position.z = _2483;
    }
    float _908 = _860 * _888;
    float _910 = _866 * _888;
    if (_880)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _912 = -_908;
    float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _916 = -_910;
    float _918 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _920 = -_908;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _924 = -_910;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = _914 + _928;
    float _932 = _872 * _888;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _936 = _918 + _934;
    float _938 = _922 * _922;
    float _940 = _930 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _942 = -_932;
    float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    float _946 = -_932;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _950 = fma(_926, _926, _938);
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].x, _940);
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _956 = _944 + _954;
    float _958 = fma(_948, _948, _950);
    float _960 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[28].z, _952);
    float _962 = sqrt(_958);
    bool _964 = _960 >= 0.0;
    float _966 = _936;
    if (_964)
    {
        _966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _968 = _966;
    if (_964)
    {
        out.m_40.x = 0.0;
    }
    float _970 = _888 * _962;
    if (_964)
    {
        float _972 = _968 * 5.0;
        _906 = as_type<int>(_972);
    }
    int _974 = _906;
    if (_964)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2615 = as_type<float>(_974);
        out.gl_Position.z = _2615;
    }
    if (_964)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _976 = _892 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _978 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_205));
    float _980 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_213));
    float _984 = _970 * _976;
    float _986 = _970 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _988 = _986 * 0.5;
    float _990 = _970 * _980;
    float _992 = _978 * _984;
    float _994 = _982 * _990;
    float _996 = _992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _998 = _992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[26].x, _996);
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[24].x, _998);
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1002);
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1006);
    float _1014 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1016 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1020 = _862 + _1014;
    float _1022 = _856 + _1016;
    float _1024 = _850 + _1018;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1028 = _1020 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1032 = _1022 + _1030;
    float _1034 = _1028 * _1028;
    float _1036 = fma(_1032, _1032, _1034);
    float _1038 = sqrt(_1036);
    bool _1040 = _1038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1018;
    float _1044 = _1012;
    if (!_1040)
    {
        _1042 = _1022;
    }
    float _1046 = _1042;
    float _1048 = _1046;
    if (!_1040)
    {
        _1044 = _1020;
    }
    float _1050 = _1044;
    float _1052 = _1050;
    if (!_1040)
    {
        _896 = _1024;
    }
    float _1054 = _896;
    bool _1056 = !_1040;
    float _1058 = _1054;
    if (!_1056)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1064 = _1038 + _1062;
        float _1066 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = _1064 * _1060;
        float _1070 = rsqrt(_1036);
        float _1072 = _1068 * 0.15915493667125701904296875;
        float _1074 = _1072 * 6.283185482025146484375;
        float _1076 = cos(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = _1076 + (-1.0);
        float _1084 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = fma(_1080, _1066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1088 = fma(_1024, _1076, _1084);
        float _1090 = _1070 * _1086;
        float _1092 = fma(_1032, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1094 = fma(_1028, _1090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1058 = _1088;
        _1048 = _1092;
        _1052 = _1094;
    }
    float _1096 = _1058;
    float _1098 = _1048;
    float _1100 = _1052;
    float _1102 = -_908;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1096);
    float _1106 = -_910;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1098);
    float _1110 = -_932;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1116 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1118 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1120 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1122 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1114);
    float _1124 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1116);
    float _1126 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1118);
    float _1128 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1120);
    float _1130 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1122);
    float _1132 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1124);
    float _1134 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1126);
    float _1136 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1128);
    float _1138 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1140 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1142 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1144 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1146 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1150 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1152 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1154 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1146);
    float _1156 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1148);
    float _1158 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1150);
    float _1160 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1152);
    float _1162 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1154);
    float _1164 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1156);
    float _1166 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1158);
    float _1168 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1160);
    float _1170 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1162);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1164);
    float _1174 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1166);
    float _1176 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1168);
    float _1178 = _1170 + _1172;
    float _1180 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1182 = _1178 * 0.5;
    out.m_40.x = _1180;
    out.gl_Position.x = _1174;
    out.gl_Position.y = _1176;
    out.gl_Position.z = _1170;
    out.gl_Position.w = _1172;
    out.m_59.z = _1182;
    out.m_59.w = _1172;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

