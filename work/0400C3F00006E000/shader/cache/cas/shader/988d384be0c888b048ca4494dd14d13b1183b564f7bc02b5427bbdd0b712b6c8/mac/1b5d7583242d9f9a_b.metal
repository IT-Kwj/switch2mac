#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c5 [[id(0)]];
    constant _16* vp_c11 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c6 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
};

struct main0_out
{
    float4 m_41 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
    uint4 m_31 [[attribute(6)]];
    float4 m_38 [[attribute(10)]];
    float4 m_36 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_31.x);
    float _57 = in.m_34.x;
    float _59 = in.m_34.y;
    float _61 = in.m_34.z;
    float _63 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _65 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _63;
    float _67 = in.m_36.x;
    float _69 = in.m_36.y;
    float _71 = in.m_36.z;
    float _73 = in.m_36.w;
    float _75 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _77 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _75;
    float _79 = _65 * _65;
    float _81 = fma(_77, _77, _79);
    int _84 = as_type<int>(_55) * 48;
    int _86 = _84 + 16;
    uint _89 = uint(int(uint(_86) >> uint(2)));
    uint _91 = uint(int(uint(int(_89)) >> uint(2)));
    int _93 = int(_89) & 3;
    float _95 = (*spvDescriptorSet0.vp_c5)._m0[int(_91)][_93];
    int _97 = int(_89) + 1;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    int _101 = _97 & 3;
    float _103 = (*spvDescriptorSet0.vp_c5)._m0[int(_99)][_101];
    float _105 = _61 + (-0.2599999904632568359375);
    float _107 = _73 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _109 = _105 * _105;
    float _111 = _71 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _113 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _115 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _113;
    uint _117 = uint(int(uint(_84) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.vp_c5)._m0[int(_119)][_121];
    int _125 = int(_117) + 1;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    int _129 = _125 & 3;
    float _131 = (*spvDescriptorSet0.vp_c5)._m0[int(_127)][_129];
    float _133 = fma(_57, _57, _109);
    float _135 = fma(_69, (*spvDescriptorSet0.vp_c11)._m0[21].y, _107);
    float _137 = fma(_115, _115, _81);
    float _139 = fma(_67, (*spvDescriptorSet0.vp_c11)._m0[21].x, _111);
    float _141 = _135 + _59;
    float _143 = rsqrt(_133);
    int _145 = _84 + 32;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    uint _149 = uint(int(uint(int(_147)) >> uint(2)));
    int _151 = int(_147) & 3;
    float _153 = (*spvDescriptorSet0.vp_c5)._m0[int(_149)][_151];
    int _155 = int(_147) + 1;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    int _159 = _155 & 3;
    float _161 = (*spvDescriptorSet0.vp_c5)._m0[int(_157)][_159];
    float _163 = sqrt(_137);
    int _165 = _84 + 24;
    uint _167 = uint(int(uint(_165) >> uint(2)));
    uint _169 = uint(int(uint(int(_167)) >> uint(2)));
    int _171 = int(_167) & 3;
    float _173 = (*spvDescriptorSet0.vp_c5)._m0[int(_169)][_171];
    int _175 = int(_167) + 1;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    int _179 = _175 & 3;
    float _181 = (*spvDescriptorSet0.vp_c5)._m0[int(_177)][_179];
    float _183 = _143 * _57;
    int _185 = _84 + 8;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    uint _189 = uint(int(uint(int(_187)) >> uint(2)));
    int _191 = int(_187) & 3;
    float _193 = (*spvDescriptorSet0.vp_c5)._m0[int(_189)][_191];
    int _195 = int(_187) + 1;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    int _199 = _195 & 3;
    float _201 = (*spvDescriptorSet0.vp_c5)._m0[int(_197)][_199];
    float _203 = _105 * _143;
    float _205 = fma(_183, _139, _57);
    float _207 = fma(_203, _111, _61);
    bool _211 = _163 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _213 = isnan(_163);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _219 = _215 || _217;
    int _221 = _84 + 40;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    uint _225 = uint(int(uint(int(_223)) >> uint(2)));
    int _227 = int(_223) & 3;
    float _229 = (*spvDescriptorSet0.vp_c5)._m0[int(_225)][_227];
    int _231 = int(_223) + 1;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    int _235 = _231 & 3;
    float _237 = (*spvDescriptorSet0.vp_c5)._m0[int(_233)][_235];
    float _239 = _141 * _103;
    float _241 = fma(_205, _95, _239);
    float _243 = _141 * _131;
    float _245 = fma(_205, _123, _243);
    float _247 = _141 * _161;
    float _249 = fma(_205, _153, _247);
    float _251 = fma(_207, _173, _241);
    float _253 = _251 + _181;
    float _255 = fma(_207, _193, _245);
    float _257 = _253 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _259 = _253 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _261 = _255 + _201;
    float _263 = fma(_207, _229, _249);
    float _265 = _253 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _267 = fma(_261, (*spvDescriptorSet0.vp_c6)._m0[3].x, _257);
    float _269 = fma(_261, (*spvDescriptorSet0.vp_c6)._m0[5].x, _259);
    float _271 = _263 + _237;
    float _273 = fma(_261, (*spvDescriptorSet0.vp_c6)._m0[4].x, _265);
    float _275 = _253;
    if (!_219)
    {
        _275 = 1.0;
    }
    float _277 = _275;
    float _279 = fma(_271, (*spvDescriptorSet0.vp_c6)._m0[3].z, _267);
    float _281 = fma(_271, (*spvDescriptorSet0.vp_c6)._m0[4].z, _273);
    float _283 = fma(_271, (*spvDescriptorSet0.vp_c6)._m0[5].z, _269);
    float _285 = _279 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _287 = _281 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _289 = _283 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _291 = !_219;
    float _293 = _277;
    if (!_291)
    {
        bool _295 = _163 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _297 = isnan(_163);
        bool _299 = _295 || _297;
        bool _301 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _303 = _299 || _301;
        if (!_303)
        {
            float _305 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _307 = _163 + _305;
            float _309 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _311 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _309;
            float _313 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _315 = _313 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _317 = 1.0 / _311;
            float _319 = _307 * _317;
            float _321 = fma(_319, _315, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _293 = _321;
            _323 = true;
        }
        else
        {
            bool _325 = _163 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _327 = isnan(_163);
            bool _329 = _325 || _327;
            bool _331 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _333 = _329 || _331;
            if (!_333)
            {
                float _335 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _337 = _163 + _335;
                float _339 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _341 = _339 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _343 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _345 = _343 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _347 = 1.0 / _341;
                float _349 = _337 * _347;
                float _351 = fma(_349, _345, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _293 = _351;
                _323 = true;
            }
            else
            {
                _293 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _323 = false;
    float _353 = _293;
    float _355 = _353 + (-1.0);
    float _357 = _355 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _359 = _355 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _361 = _355 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _363 = fma(_287, _353, _357);
    float _365 = fma(_285, _353, _359);
    float _367 = fma(_289, _353, _361);
    float _369 = _363 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _371 = _363 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _373 = fma(_365, (*spvDescriptorSet0.vp_c6)._m0[2].x, _369);
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c6)._m0[0].x, _371);
    float _377 = _363 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c6)._m0[2].z, _373);
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c6)._m0[0].z, _375);
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c6)._m0[1].x, _377);
    float _385 = _379 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _387 = _381 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _389 = fma(_367, (*spvDescriptorSet0.vp_c6)._m0[1].z, _383);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _393 = _385 + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _397 = _387 + _395;
    float _399 = _389 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _401 = _393 * _393;
    float _403 = _399 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _405 = fma(_397, _397, _401);
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[2].x, _403);
    float _409 = sqrt(_405);
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[2].z, _407);
    float _413 = _411 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _415 = _409 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _417 = _367;
    float _419 = _411;
    float _421 = _389;
    float _423 = _413;
    if (!_415)
    {
        _417 = _387;
    }
    float _425 = _417;
    float _427 = _425;
    if (!_415)
    {
        _419 = _385;
    }
    float _429 = _419;
    float _431 = _429;
    if (!_415)
    {
        _421 = _399;
    }
    float _433 = _421;
    bool _435 = !_415;
    float _437 = _433;
    if (!_435)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _441 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _443 = _409 + _441;
        float _445 = rsqrt(_405);
        float _447 = _443 * _439;
        float _449 = _399 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _451 = _447 * 0.15915493667125701904296875;
        float _453 = _451 * 6.283185482025146484375;
        float _455 = cos(_453);
        float _457 = _451 * 6.283185482025146484375;
        float _459 = sin(_457);
        float _461 = _455 + (-1.0);
        float _463 = _461 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _465 = fma(_459, _449, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _467 = fma(_399, _455, _463);
        float _469 = _445 * _465;
        float _471 = _467 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _473 = fma(_397, _469, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _475 = fma(_393, _469, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _477 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[2].x, _471);
        float _479 = fma(_475, (*spvDescriptorSet0.vp_c4)._m0[2].z, _477);
        float _481 = _479 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _437 = _467;
        _427 = _473;
        _431 = _475;
        _423 = _481;
    }
    float _483 = _437;
    float _485 = _427;
    float _487 = _431;
    float _489 = _423;
    float _491 = _483 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _493 = _483 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _495 = in.m_38.x;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c4)._m0[1].x, _491);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c4)._m0[0].x, _493);
    float _501 = in.m_38.y;
    float _503 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[1].z, _497);
    float _505 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[0].z, _499);
    float _507 = _503 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _509 = _505 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _511 = _507 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _513 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[9].x, _511);
    float _515 = _507 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _517 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[9].z, _513);
    float _519 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[10].x, _515);
    out.m_41.z = _495;
    float _521 = _517 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _523 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[10].z, _519);
    out.m_41.w = _501;
    float _525 = _521 * 10000.0;
    float _527 = precise::clamp(_525, 0.0, 1.0);
    float _529 = _523 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _531 = _527 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _533 = _507 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _535 = _507 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _537 = fma(_531, (*spvDescriptorSet0.vp_c4)._m0[10].z, _529);
    float _539 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[7].x, _533);
    float _541 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[8].x, _535);
    float _543 = fma(_531, (*spvDescriptorSet0.vp_c4)._m0[9].z, _521);
    float _545 = 1.0 / _537;
    float _547 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[7].z, _539);
    float _549 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[8].z, _541);
    float _551 = _547 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _553 = _549 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _555 = _529 * _545;
    float _557 = _543 * _555;
    out.gl_Position.x = _551;
    out.gl_Position.y = _553;
    out.gl_Position.z = _557;
    out.gl_Position.w = _529;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_31.x);
    float _57 = in.m_34.x;
    float _59 = in.m_34.y;
    float _61 = in.m_34.z;
    float _63 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _65 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _63;
    float _67 = in.m_36.x;
    float _69 = in.m_36.y;
    float _71 = in.m_36.z;
    float _73 = in.m_36.w;
    float _75 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _77 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _75;
    float _79 = _65 * _65;
    float _81 = fma(_77, _77, _79);
    int _84 = as_type<int>(_55) * 48;
    int _86 = _84 + 16;
    uint _89 = uint(int(uint(_86) >> uint(2)));
    uint _91 = uint(int(uint(int(_89)) >> uint(2)));
    int _93 = int(_89) & 3;
    float _95 = (*spvDescriptorSet0.vp_c5)._m0[int(_91)][_93];
    int _97 = int(_89) + 1;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    int _101 = _97 & 3;
    float _103 = (*spvDescriptorSet0.vp_c5)._m0[int(_99)][_101];
    float _105 = _61 + (-0.2599999904632568359375);
    float _107 = _73 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _109 = _105 * _105;
    float _111 = _71 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _113 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _115 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _113;
    uint _117 = uint(int(uint(_84) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.vp_c5)._m0[int(_119)][_121];
    int _125 = int(_117) + 1;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    int _129 = _125 & 3;
    float _131 = (*spvDescriptorSet0.vp_c5)._m0[int(_127)][_129];
    float _133 = fma(_57, _57, _109);
    float _135 = fma(_69, (*spvDescriptorSet0.vp_c11)._m0[21].y, _107);
    float _137 = fma(_115, _115, _81);
    float _139 = fma(_67, (*spvDescriptorSet0.vp_c11)._m0[21].x, _111);
    float _141 = _135 + _59;
    float _143 = rsqrt(_133);
    int _145 = _84 + 32;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    uint _149 = uint(int(uint(int(_147)) >> uint(2)));
    int _151 = int(_147) & 3;
    float _153 = (*spvDescriptorSet0.vp_c5)._m0[int(_149)][_151];
    int _155 = int(_147) + 1;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    int _159 = _155 & 3;
    float _161 = (*spvDescriptorSet0.vp_c5)._m0[int(_157)][_159];
    float _163 = sqrt(_137);
    int _165 = _84 + 24;
    uint _167 = uint(int(uint(_165) >> uint(2)));
    uint _169 = uint(int(uint(int(_167)) >> uint(2)));
    int _171 = int(_167) & 3;
    float _173 = (*spvDescriptorSet0.vp_c5)._m0[int(_169)][_171];
    int _175 = int(_167) + 1;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    int _179 = _175 & 3;
    float _181 = (*spvDescriptorSet0.vp_c5)._m0[int(_177)][_179];
    float _183 = _143 * _57;
    int _185 = _84 + 8;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    uint _189 = uint(int(uint(int(_187)) >> uint(2)));
    int _191 = int(_187) & 3;
    float _193 = (*spvDescriptorSet0.vp_c5)._m0[int(_189)][_191];
    int _195 = int(_187) + 1;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    int _199 = _195 & 3;
    float _201 = (*spvDescriptorSet0.vp_c5)._m0[int(_197)][_199];
    float _203 = _105 * _143;
    float _205 = fma(_183, _139, _57);
    float _207 = fma(_203, _111, _61);
    bool _211 = _163 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _213 = isnan(_163);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _219 = _215 || _217;
    int _221 = _84 + 40;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    uint _225 = uint(int(uint(int(_223)) >> uint(2)));
    int _227 = int(_223) & 3;
    float _229 = (*spvDescriptorSet0.vp_c5)._m0[int(_225)][_227];
    int _231 = int(_223) + 1;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    int _235 = _231 & 3;
    float _237 = (*spvDescriptorSet0.vp_c5)._m0[int(_233)][_235];
    float _239 = _141 * _103;
    float _241 = fma(_205, _95, _239);
    float _243 = _141 * _131;
    float _245 = fma(_205, _123, _243);
    float _247 = _141 * _161;
    float _249 = fma(_205, _153, _247);
    float _251 = fma(_207, _173, _241);
    float _253 = _251 + _181;
    float _255 = fma(_207, _193, _245);
    float _257 = _253 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _259 = _253 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _261 = _255 + _201;
    float _263 = fma(_207, _229, _249);
    float _265 = _253 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _267 = fma(_261, (*spvDescriptorSet0.vp_c6)._m0[3].x, _257);
    float _269 = fma(_261, (*spvDescriptorSet0.vp_c6)._m0[5].x, _259);
    float _271 = _263 + _237;
    float _273 = fma(_261, (*spvDescriptorSet0.vp_c6)._m0[4].x, _265);
    float _275 = _253;
    if (!_219)
    {
        _275 = 1.0;
    }
    float _277 = _275;
    float _279 = fma(_271, (*spvDescriptorSet0.vp_c6)._m0[3].z, _267);
    float _281 = fma(_271, (*spvDescriptorSet0.vp_c6)._m0[4].z, _273);
    float _283 = fma(_271, (*spvDescriptorSet0.vp_c6)._m0[5].z, _269);
    float _285 = _279 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _287 = _281 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _289 = _283 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _291 = !_219;
    float _293 = _277;
    if (!_291)
    {
        bool _295 = _163 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _297 = isnan(_163);
        bool _299 = _295 || _297;
        bool _301 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _303 = _299 || _301;
        if (!_303)
        {
            float _305 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _307 = _163 + _305;
            float _309 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _311 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _309;
            float _313 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _315 = _313 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _317 = 1.0 / _311;
            float _319 = _307 * _317;
            float _321 = fma(_319, _315, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _293 = _321;
            _323 = true;
        }
        else
        {
            bool _325 = _163 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _327 = isnan(_163);
            bool _329 = _325 || _327;
            bool _331 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _333 = _329 || _331;
            if (!_333)
            {
                float _335 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _337 = _163 + _335;
                float _339 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _341 = _339 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _343 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _345 = _343 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _347 = 1.0 / _341;
                float _349 = _337 * _347;
                float _351 = fma(_349, _345, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _293 = _351;
                _323 = true;
            }
            else
            {
                _293 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _323 = false;
    float _353 = _293;
    float _355 = _353 + (-1.0);
    float _357 = _355 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _359 = _355 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _361 = _355 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _363 = fma(_287, _353, _357);
    float _365 = fma(_285, _353, _359);
    float _367 = fma(_289, _353, _361);
    float _369 = _363 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _371 = _363 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _373 = fma(_365, (*spvDescriptorSet0.vp_c6)._m0[2].x, _369);
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c6)._m0[0].x, _371);
    float _377 = _363 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c6)._m0[2].z, _373);
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c6)._m0[0].z, _375);
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c6)._m0[1].x, _377);
    float _385 = _379 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _387 = _381 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _389 = fma(_367, (*spvDescriptorSet0.vp_c6)._m0[1].z, _383);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _393 = _385 + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _397 = _387 + _395;
    float _399 = _389 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _401 = _393 * _393;
    float _403 = _399 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _405 = fma(_397, _397, _401);
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[2].x, _403);
    float _409 = sqrt(_405);
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[2].z, _407);
    float _413 = _411 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _415 = _409 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _417 = _367;
    float _419 = _411;
    float _421 = _389;
    float _423 = _413;
    if (!_415)
    {
        _417 = _387;
    }
    float _425 = _417;
    float _427 = _425;
    if (!_415)
    {
        _419 = _385;
    }
    float _429 = _419;
    float _431 = _429;
    if (!_415)
    {
        _421 = _399;
    }
    float _433 = _421;
    bool _435 = !_415;
    float _437 = _433;
    if (!_435)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _441 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _443 = _409 + _441;
        float _445 = rsqrt(_405);
        float _447 = _443 * _439;
        float _449 = _399 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _451 = _447 * 0.15915493667125701904296875;
        float _453 = _451 * 6.283185482025146484375;
        float _455 = cos(_453);
        float _457 = _451 * 6.283185482025146484375;
        float _459 = sin(_457);
        float _461 = _455 + (-1.0);
        float _463 = _461 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _465 = fma(_459, _449, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _467 = fma(_399, _455, _463);
        float _469 = _445 * _465;
        float _471 = _467 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _473 = fma(_397, _469, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _475 = fma(_393, _469, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _477 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[2].x, _471);
        float _479 = fma(_475, (*spvDescriptorSet0.vp_c4)._m0[2].z, _477);
        float _481 = _479 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _437 = _467;
        _427 = _473;
        _431 = _475;
        _423 = _481;
    }
    float _483 = _437;
    float _485 = _427;
    float _487 = _431;
    float _489 = _423;
    float _491 = _483 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _493 = _483 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _495 = in.m_38.x;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c4)._m0[1].x, _491);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c4)._m0[0].x, _493);
    float _501 = in.m_38.y;
    float _503 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[1].z, _497);
    float _505 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[0].z, _499);
    float _507 = _503 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _509 = _505 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _511 = _507 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _513 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[9].x, _511);
    float _515 = _507 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _517 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[9].z, _513);
    float _519 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[10].x, _515);
    out.m_41.z = _495;
    float _521 = _517 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _523 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[10].z, _519);
    out.m_41.w = _501;
    float _525 = _521 * 10000.0;
    float _527 = precise::clamp(_525, 0.0, 1.0);
    float _529 = _523 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _531 = _527 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _533 = _507 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _535 = _507 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _537 = fma(_531, (*spvDescriptorSet0.vp_c4)._m0[10].z, _529);
    float _539 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[7].x, _533);
    float _541 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[8].x, _535);
    float _543 = fma(_531, (*spvDescriptorSet0.vp_c4)._m0[9].z, _521);
    float _545 = 1.0 / _537;
    float _547 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[7].z, _539);
    float _549 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[8].z, _541);
    float _551 = _547 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _553 = _549 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _555 = _529 * _545;
    float _557 = _543 * _555;
    out.gl_Position.x = _551;
    out.gl_Position.y = _553;
    out.gl_Position.z = _557;
    out.gl_Position.w = _529;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_31.x);
    float _57 = in.m_34.x;
    float _59 = in.m_34.y;
    float _61 = in.m_34.z;
    float _63 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _65 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _63;
    float _67 = in.m_36.x;
    float _69 = in.m_36.y;
    float _71 = in.m_36.z;
    float _73 = in.m_36.w;
    float _75 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _77 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _75;
    float _79 = _65 * _65;
    float _81 = fma(_77, _77, _79);
    int _84 = as_type<int>(_55) * 48;
    int _86 = _84 + 16;
    uint _89 = uint(int(uint(_86) >> uint(2)));
    uint _91 = uint(int(uint(int(_89)) >> uint(2)));
    int _93 = int(_89) & 3;
    float _95 = (*spvDescriptorSet0.vp_c5)._m0[int(_91)][_93];
    int _97 = int(_89) + 1;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    int _101 = _97 & 3;
    float _103 = (*spvDescriptorSet0.vp_c5)._m0[int(_99)][_101];
    float _105 = _61 + (-0.2599999904632568359375);
    float _107 = _73 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _109 = _105 * _105;
    float _111 = _71 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _113 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _115 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _113;
    uint _117 = uint(int(uint(_84) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.vp_c5)._m0[int(_119)][_121];
    int _125 = int(_117) + 1;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    int _129 = _125 & 3;
    float _131 = (*spvDescriptorSet0.vp_c5)._m0[int(_127)][_129];
    float _133 = fma(_57, _57, _109);
    float _135 = fma(_69, (*spvDescriptorSet0.vp_c11)._m0[21].y, _107);
    float _137 = fma(_115, _115, _81);
    float _139 = fma(_67, (*spvDescriptorSet0.vp_c11)._m0[21].x, _111);
    float _141 = _135 + _59;
    float _143 = rsqrt(_133);
    int _145 = _84 + 32;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    uint _149 = uint(int(uint(int(_147)) >> uint(2)));
    int _151 = int(_147) & 3;
    float _153 = (*spvDescriptorSet0.vp_c5)._m0[int(_149)][_151];
    int _155 = int(_147) + 1;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    int _159 = _155 & 3;
    float _161 = (*spvDescriptorSet0.vp_c5)._m0[int(_157)][_159];
    float _163 = sqrt(_137);
    int _165 = _84 + 24;
    uint _167 = uint(int(uint(_165) >> uint(2)));
    uint _169 = uint(int(uint(int(_167)) >> uint(2)));
    int _171 = int(_167) & 3;
    float _173 = (*spvDescriptorSet0.vp_c5)._m0[int(_169)][_171];
    int _175 = int(_167) + 1;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    int _179 = _175 & 3;
    float _181 = (*spvDescriptorSet0.vp_c5)._m0[int(_177)][_179];
    float _183 = _143 * _57;
    int _185 = _84 + 8;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    uint _189 = uint(int(uint(int(_187)) >> uint(2)));
    int _191 = int(_187) & 3;
    float _193 = (*spvDescriptorSet0.vp_c5)._m0[int(_189)][_191];
    int _195 = int(_187) + 1;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    int _199 = _195 & 3;
    float _201 = (*spvDescriptorSet0.vp_c5)._m0[int(_197)][_199];
    float _203 = _105 * _143;
    float _205 = fma(_183, _139, _57);
    float _207 = fma(_203, _111, _61);
    bool _211 = _163 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _213 = isnan(_163);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _219 = _215 || _217;
    int _221 = _84 + 40;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    uint _225 = uint(int(uint(int(_223)) >> uint(2)));
    int _227 = int(_223) & 3;
    float _229 = (*spvDescriptorSet0.vp_c5)._m0[int(_225)][_227];
    int _231 = int(_223) + 1;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    int _235 = _231 & 3;
    float _237 = (*spvDescriptorSet0.vp_c5)._m0[int(_233)][_235];
    float _239 = _141 * _103;
    float _241 = fma(_205, _95, _239);
    float _243 = _141 * _131;
    float _245 = fma(_205, _123, _243);
    float _247 = _141 * _161;
    float _249 = fma(_205, _153, _247);
    float _251 = fma(_207, _173, _241);
    float _253 = _251 + _181;
    float _255 = fma(_207, _193, _245);
    float _257 = _253 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _259 = _253 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _261 = _255 + _201;
    float _263 = fma(_207, _229, _249);
    float _265 = _253 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _267 = fma(_261, (*spvDescriptorSet0.vp_c6)._m0[3].x, _257);
    float _269 = fma(_261, (*spvDescriptorSet0.vp_c6)._m0[5].x, _259);
    float _271 = _263 + _237;
    float _273 = fma(_261, (*spvDescriptorSet0.vp_c6)._m0[4].x, _265);
    float _275 = _253;
    if (!_219)
    {
        _275 = 1.0;
    }
    float _277 = _275;
    float _279 = fma(_271, (*spvDescriptorSet0.vp_c6)._m0[3].z, _267);
    float _281 = fma(_271, (*spvDescriptorSet0.vp_c6)._m0[4].z, _273);
    float _283 = fma(_271, (*spvDescriptorSet0.vp_c6)._m0[5].z, _269);
    float _285 = _279 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _287 = _281 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _289 = _283 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _291 = !_219;
    float _293 = _277;
    if (!_291)
    {
        bool _295 = _163 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _297 = isnan(_163);
        bool _299 = _295 || _297;
        bool _301 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _303 = _299 || _301;
        if (!_303)
        {
            float _305 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _307 = _163 + _305;
            float _309 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _311 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _309;
            float _313 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _315 = _313 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _317 = 1.0 / _311;
            float _319 = _307 * _317;
            float _321 = fma(_319, _315, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _293 = _321;
            _323 = true;
        }
        else
        {
            bool _325 = _163 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _327 = isnan(_163);
            bool _329 = _325 || _327;
            bool _331 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _333 = _329 || _331;
            if (!_333)
            {
                float _335 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _337 = _163 + _335;
                float _339 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _341 = _339 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _343 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _345 = _343 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _347 = 1.0 / _341;
                float _349 = _337 * _347;
                float _351 = fma(_349, _345, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _293 = _351;
                _323 = true;
            }
            else
            {
                _293 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _323 = false;
    float _353 = _293;
    float _355 = _353 + (-1.0);
    float _357 = _355 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _359 = _355 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _361 = _355 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _363 = fma(_287, _353, _357);
    float _365 = fma(_285, _353, _359);
    float _367 = fma(_289, _353, _361);
    float _369 = _363 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _371 = _363 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _373 = fma(_365, (*spvDescriptorSet0.vp_c6)._m0[2].x, _369);
    float _375 = fma(_365, (*spvDescriptorSet0.vp_c6)._m0[0].x, _371);
    float _377 = _363 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c6)._m0[2].z, _373);
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c6)._m0[0].z, _375);
    float _383 = fma(_365, (*spvDescriptorSet0.vp_c6)._m0[1].x, _377);
    float _385 = _379 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _387 = _381 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _389 = fma(_367, (*spvDescriptorSet0.vp_c6)._m0[1].z, _383);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _393 = _385 + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _397 = _387 + _395;
    float _399 = _389 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _401 = _393 * _393;
    float _403 = _399 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _405 = fma(_397, _397, _401);
    float _407 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[2].x, _403);
    float _409 = sqrt(_405);
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[2].z, _407);
    float _413 = _411 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _415 = _409 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _417 = _367;
    float _419 = _411;
    float _421 = _389;
    float _423 = _413;
    if (!_415)
    {
        _417 = _387;
    }
    float _425 = _417;
    float _427 = _425;
    if (!_415)
    {
        _419 = _385;
    }
    float _429 = _419;
    float _431 = _429;
    if (!_415)
    {
        _421 = _399;
    }
    float _433 = _421;
    bool _435 = !_415;
    float _437 = _433;
    if (!_435)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _441 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _443 = _409 + _441;
        float _445 = rsqrt(_405);
        float _447 = _443 * _439;
        float _449 = _399 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _451 = _447 * 0.15915493667125701904296875;
        float _453 = _451 * 6.283185482025146484375;
        float _455 = cos(_453);
        float _457 = _451 * 6.283185482025146484375;
        float _459 = sin(_457);
        float _461 = _455 + (-1.0);
        float _463 = _461 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _465 = fma(_459, _449, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _467 = fma(_399, _455, _463);
        float _469 = _445 * _465;
        float _471 = _467 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _473 = fma(_397, _469, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _475 = fma(_393, _469, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _477 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[2].x, _471);
        float _479 = fma(_475, (*spvDescriptorSet0.vp_c4)._m0[2].z, _477);
        float _481 = _479 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _437 = _467;
        _427 = _473;
        _431 = _475;
        _423 = _481;
    }
    float _483 = _437;
    float _485 = _427;
    float _487 = _431;
    float _489 = _423;
    float _491 = _483 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _493 = _483 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _495 = in.m_38.x;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c4)._m0[1].x, _491);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c4)._m0[0].x, _493);
    float _501 = in.m_38.y;
    float _503 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[1].z, _497);
    float _505 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[0].z, _499);
    float _507 = _503 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _509 = _505 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _511 = _507 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _513 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[9].x, _511);
    float _515 = _507 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _517 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[9].z, _513);
    float _519 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[10].x, _515);
    out.m_41.z = _495;
    float _521 = _517 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _523 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[10].z, _519);
    out.m_41.w = _501;
    float _525 = _521 * 10000.0;
    float _527 = precise::clamp(_525, 0.0, 1.0);
    float _529 = _523 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _531 = _527 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _533 = _507 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _535 = _507 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _537 = fma(_531, (*spvDescriptorSet0.vp_c4)._m0[10].z, _529);
    float _539 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[7].x, _533);
    float _541 = fma(_509, (*spvDescriptorSet0.vp_c4)._m0[8].x, _535);
    float _543 = fma(_531, (*spvDescriptorSet0.vp_c4)._m0[9].z, _521);
    float _545 = 1.0 / _537;
    float _547 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[7].z, _539);
    float _549 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[8].z, _541);
    float _551 = _547 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _553 = _549 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _555 = _529 * _545;
    float _557 = _543 * _555;
    out.gl_Position.x = _551;
    out.gl_Position.y = _553;
    out.gl_Position.z = _557;
    out.gl_Position.w = _529;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

