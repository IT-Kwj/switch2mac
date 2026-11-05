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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 m_39 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
    float4 m_32 [[attribute(4)]];
    uint4 m_29 [[attribute(6)]];
    float4 m_36 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _437 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = as_type<float>(in.m_29.x);
    float _55 = as_type<float>(in.m_29.y);
    float _57 = in.m_32.x;
    float _59 = in.m_32.y;
    float _61 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _63 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _61;
    float _65 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _67 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _65;
    float _69 = _63 * _63;
    float _71 = fma(_67, _67, _69);
    int _74 = as_type<int>(_53) * 48;
    int _76 = as_type<int>(_55) * 48;
    uint _79 = uint(int(uint(_74) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c5)._m0[int(_81)][_83];
    int _87 = int(_79) + 1;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    int _91 = _87 & 3;
    float _93 = (*spvDescriptorSet0.vp_c5)._m0[int(_89)][_91];
    float _95 = in.m_34.x;
    float _97 = in.m_34.y;
    float _99 = in.m_34.z;
    int _101 = _74 + 16;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.vp_c5)._m0[int(_105)][_107];
    int _111 = int(_103) + 1;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    int _115 = _111 & 3;
    float _117 = (*spvDescriptorSet0.vp_c5)._m0[int(_113)][_115];
    int _119 = _74 + 32;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c5)._m0[int(_123)][_125];
    int _129 = int(_121) + 1;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    int _133 = _129 & 3;
    float _135 = (*spvDescriptorSet0.vp_c5)._m0[int(_131)][_133];
    uint _137 = uint(int(uint(_76) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c5)._m0[int(_139)][_141];
    int _145 = int(_137) + 1;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    int _149 = _145 & 3;
    float _151 = (*spvDescriptorSet0.vp_c5)._m0[int(_147)][_149];
    int _153 = _76 + 16;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.vp_c5)._m0[int(_157)][_159];
    int _163 = int(_155) + 1;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    int _167 = _163 & 3;
    float _169 = (*spvDescriptorSet0.vp_c5)._m0[int(_165)][_167];
    int _171 = _76 + 32;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    uint _175 = uint(int(uint(int(_173)) >> uint(2)));
    int _177 = int(_173) & 3;
    float _179 = (*spvDescriptorSet0.vp_c5)._m0[int(_175)][_177];
    int _181 = int(_173) + 1;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    int _185 = _181 & 3;
    float _187 = (*spvDescriptorSet0.vp_c5)._m0[int(_183)][_185];
    int _189 = _76 + 24;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    uint _193 = uint(int(uint(int(_191)) >> uint(2)));
    int _195 = int(_191) & 3;
    float _197 = (*spvDescriptorSet0.vp_c5)._m0[int(_193)][_195];
    int _199 = int(_191) + 1;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    int _203 = _199 & 3;
    float _205 = (*spvDescriptorSet0.vp_c5)._m0[int(_201)][_203];
    float _207 = _97 * _93;
    float _209 = fma(_95, _85, _207);
    int _211 = _74 + 24;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    uint _215 = uint(int(uint(int(_213)) >> uint(2)));
    int _217 = int(_213) & 3;
    float _219 = (*spvDescriptorSet0.vp_c5)._m0[int(_215)][_217];
    int _221 = int(_213) + 1;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    int _225 = _221 & 3;
    float _227 = (*spvDescriptorSet0.vp_c5)._m0[int(_223)][_225];
    float _229 = _97 * _117;
    float _231 = fma(_95, _109, _229);
    int _233 = _76 + 8;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    uint _237 = uint(int(uint(int(_235)) >> uint(2)));
    int _239 = int(_235) & 3;
    float _241 = (*spvDescriptorSet0.vp_c5)._m0[int(_237)][_239];
    int _243 = int(_235) + 1;
    uint _245 = uint(int(uint(_243) >> uint(2)));
    int _247 = _243 & 3;
    float _249 = (*spvDescriptorSet0.vp_c5)._m0[int(_245)][_247];
    float _251 = _97 * _135;
    float _253 = fma(_95, _127, _251);
    int _255 = _74 + 8;
    uint _257 = uint(int(uint(_255) >> uint(2)));
    uint _259 = uint(int(uint(int(_257)) >> uint(2)));
    int _261 = int(_257) & 3;
    float _263 = (*spvDescriptorSet0.vp_c5)._m0[int(_259)][_261];
    int _265 = int(_257) + 1;
    uint _267 = uint(int(uint(_265) >> uint(2)));
    int _269 = _265 & 3;
    float _271 = (*spvDescriptorSet0.vp_c5)._m0[int(_267)][_269];
    float _273 = _97 * _151;
    float _275 = fma(_95, _143, _273);
    int _277 = _76 + 40;
    uint _279 = uint(int(uint(_277) >> uint(2)));
    uint _281 = uint(int(uint(int(_279)) >> uint(2)));
    int _283 = int(_279) & 3;
    float _285 = (*spvDescriptorSet0.vp_c5)._m0[int(_281)][_283];
    int _287 = int(_279) + 1;
    uint _289 = uint(int(uint(_287) >> uint(2)));
    int _291 = _287 & 3;
    float _293 = (*spvDescriptorSet0.vp_c5)._m0[int(_289)][_291];
    float _295 = _97 * _169;
    float _297 = fma(_95, _161, _295);
    int _299 = _74 + 40;
    uint _301 = uint(int(uint(_299) >> uint(2)));
    uint _303 = uint(int(uint(int(_301)) >> uint(2)));
    int _305 = int(_301) & 3;
    float _307 = (*spvDescriptorSet0.vp_c5)._m0[int(_303)][_305];
    int _309 = int(_301) + 1;
    uint _311 = uint(int(uint(_309) >> uint(2)));
    int _313 = _309 & 3;
    float _315 = (*spvDescriptorSet0.vp_c5)._m0[int(_311)][_313];
    float _317 = _97 * _187;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _321 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _319;
    float _323 = fma(_95, _179, _317);
    float _325 = fma(_321, _321, _71);
    float _327 = fma(_99, _197, _297);
    float _329 = sqrt(_325);
    float _331 = _327 + _205;
    float _333 = fma(_99, _219, _231);
    float _335 = _331 * _59;
    float _337 = _333 + _227;
    float _339 = fma(_99, _241, _275);
    float _341 = fma(_337, _57, _335);
    float _343 = _339 + _249;
    bool _347 = _329 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _349 = isnan(_329);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _355 = _351 || _353;
    float _357 = _341 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _359 = _341 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _361 = fma(_99, _263, _209);
    float _363 = _343 * _59;
    float _365 = _341 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _367 = _361 + _271;
    float _369 = fma(_99, _285, _323);
    float _371 = fma(_367, _57, _363);
    float _373 = _369 + _293;
    float _375 = fma(_371, (*spvDescriptorSet0.vp_c6)._m0[3].x, _357);
    float _377 = fma(_99, _307, _253);
    float _379 = _373 * _59;
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c6)._m0[4].x, _359);
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c6)._m0[5].x, _365);
    float _385 = _377 + _315;
    float _387 = fma(_385, _57, _379);
    float _389 = fma(_387, (*spvDescriptorSet0.vp_c6)._m0[3].z, _375);
    float _391 = fma(_387, (*spvDescriptorSet0.vp_c6)._m0[4].z, _381);
    float _393 = fma(_387, (*spvDescriptorSet0.vp_c6)._m0[5].z, _383);
    float _395 = _375;
    if (!_355)
    {
        _395 = 1.0;
    }
    float _397 = _395;
    float _399 = _389 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _401 = _391 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _403 = _393 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _405 = !_355;
    float _407 = _397;
    if (!_405)
    {
        bool _409 = _329 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _411 = isnan(_329);
        bool _413 = _409 || _411;
        bool _415 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _417 = _413 || _415;
        if (!_417)
        {
            float _419 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _421 = _329 + _419;
            float _423 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _425 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _423;
            float _427 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _429 = _427 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _431 = 1.0 / _425;
            float _433 = _421 * _431;
            float _435 = fma(_433, _429, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _407 = _435;
            _437 = true;
        }
        else
        {
            bool _439 = _329 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _441 = isnan(_329);
            bool _443 = _439 || _441;
            bool _445 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _447 = _443 || _445;
            if (!_447)
            {
                float _449 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _451 = _329 + _449;
                float _453 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _455 = _453 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _457 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _459 = _457 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _461 = 1.0 / _455;
                float _463 = _451 * _461;
                float _465 = fma(_463, _459, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _407 = _465;
                _437 = true;
            }
            else
            {
                _407 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _437 = false;
    float _467 = _407;
    float _469 = _467 + (-1.0);
    float _471 = _469 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _473 = _469 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _475 = _469 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _477 = fma(_401, _467, _471);
    float _479 = fma(_399, _467, _473);
    float _481 = fma(_403, _467, _475);
    float _483 = _477 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _485 = _477 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _487 = fma(_479, (*spvDescriptorSet0.vp_c6)._m0[2].x, _483);
    float _489 = fma(_479, (*spvDescriptorSet0.vp_c6)._m0[0].x, _485);
    float _491 = _477 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _493 = fma(_481, (*spvDescriptorSet0.vp_c6)._m0[2].z, _487);
    float _495 = fma(_481, (*spvDescriptorSet0.vp_c6)._m0[0].z, _489);
    float _497 = fma(_479, (*spvDescriptorSet0.vp_c6)._m0[1].x, _491);
    float _499 = _493 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _501 = _495 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _503 = fma(_481, (*spvDescriptorSet0.vp_c6)._m0[1].z, _497);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _507 = _499 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _511 = _501 + _509;
    float _513 = _503 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _515 = _507 * _507;
    float _517 = _513 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _519 = fma(_511, _511, _515);
    float _521 = fma(_501, (*spvDescriptorSet0.vp_c4)._m0[2].x, _517);
    float _523 = sqrt(_519);
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c4)._m0[2].z, _521);
    float _527 = _525 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _529 = _523 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _531 = _481;
    float _533 = _525;
    float _535 = _503;
    float _537 = _527;
    if (!_529)
    {
        _531 = _501;
    }
    float _539 = _531;
    float _541 = _539;
    if (!_529)
    {
        _533 = _499;
    }
    float _543 = _533;
    float _545 = _543;
    if (!_529)
    {
        _535 = _513;
    }
    float _547 = _535;
    bool _549 = !_529;
    float _551 = _547;
    if (!_549)
    {
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _555 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _557 = _523 + _555;
        float _559 = _513 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _561 = rsqrt(_519);
        float _563 = _557 * _553;
        float _565 = _563 * 0.15915493667125701904296875;
        float _567 = _565 * 6.283185482025146484375;
        float _569 = cos(_567);
        float _571 = _565 * 6.283185482025146484375;
        float _573 = sin(_571);
        float _575 = _569 + (-1.0);
        float _577 = _575 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _579 = fma(_573, _559, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _581 = fma(_513, _569, _577);
        float _583 = _561 * _579;
        float _585 = _581 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _587 = fma(_511, _583, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _589 = fma(_507, _583, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _591 = fma(_587, (*spvDescriptorSet0.vp_c4)._m0[2].x, _585);
        float _593 = fma(_589, (*spvDescriptorSet0.vp_c4)._m0[2].z, _591);
        float _595 = _593 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _551 = _581;
        _541 = _587;
        _545 = _589;
        _537 = _595;
    }
    float _597 = _551;
    float _599 = _541;
    float _601 = _545;
    float _603 = _537;
    float _605 = _597 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _607 = _597 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _609 = in.m_36.x;
    float _611 = fma(_599, (*spvDescriptorSet0.vp_c4)._m0[1].x, _605);
    float _613 = fma(_599, (*spvDescriptorSet0.vp_c4)._m0[0].x, _607);
    float _615 = in.m_36.y;
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c4)._m0[1].z, _611);
    float _619 = fma(_601, (*spvDescriptorSet0.vp_c4)._m0[0].z, _613);
    float _621 = _617 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _623 = _619 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _625 = _621 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _627 = _621 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _629 = _621 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _631 = _621 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _633 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[8].x, _625);
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[7].x, _627);
    float _637 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[9].x, _629);
    float _639 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[10].x, _631);
    float _641 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[8].z, _633);
    float _643 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[7].z, _635);
    float _645 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[9].z, _637);
    float _647 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[10].z, _639);
    float _649 = _643 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _651 = _641 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _653 = _645 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _655 = _647 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_39.x = _609;
    out.m_39.y = _615;
    out.gl_Position.x = _649;
    out.gl_Position.y = _651;
    out.gl_Position.z = _653;
    out.gl_Position.w = _655;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _437 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = as_type<float>(in.m_29.x);
    float _55 = as_type<float>(in.m_29.y);
    float _57 = in.m_32.x;
    float _59 = in.m_32.y;
    float _61 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _63 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _61;
    float _65 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _67 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _65;
    float _69 = _63 * _63;
    float _71 = fma(_67, _67, _69);
    int _74 = as_type<int>(_53) * 48;
    int _76 = as_type<int>(_55) * 48;
    uint _79 = uint(int(uint(_74) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c5)._m0[int(_81)][_83];
    int _87 = int(_79) + 1;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    int _91 = _87 & 3;
    float _93 = (*spvDescriptorSet0.vp_c5)._m0[int(_89)][_91];
    float _95 = in.m_34.x;
    float _97 = in.m_34.y;
    float _99 = in.m_34.z;
    int _101 = _74 + 16;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.vp_c5)._m0[int(_105)][_107];
    int _111 = int(_103) + 1;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    int _115 = _111 & 3;
    float _117 = (*spvDescriptorSet0.vp_c5)._m0[int(_113)][_115];
    int _119 = _74 + 32;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c5)._m0[int(_123)][_125];
    int _129 = int(_121) + 1;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    int _133 = _129 & 3;
    float _135 = (*spvDescriptorSet0.vp_c5)._m0[int(_131)][_133];
    uint _137 = uint(int(uint(_76) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c5)._m0[int(_139)][_141];
    int _145 = int(_137) + 1;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    int _149 = _145 & 3;
    float _151 = (*spvDescriptorSet0.vp_c5)._m0[int(_147)][_149];
    int _153 = _76 + 16;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.vp_c5)._m0[int(_157)][_159];
    int _163 = int(_155) + 1;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    int _167 = _163 & 3;
    float _169 = (*spvDescriptorSet0.vp_c5)._m0[int(_165)][_167];
    int _171 = _76 + 32;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    uint _175 = uint(int(uint(int(_173)) >> uint(2)));
    int _177 = int(_173) & 3;
    float _179 = (*spvDescriptorSet0.vp_c5)._m0[int(_175)][_177];
    int _181 = int(_173) + 1;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    int _185 = _181 & 3;
    float _187 = (*spvDescriptorSet0.vp_c5)._m0[int(_183)][_185];
    int _189 = _76 + 24;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    uint _193 = uint(int(uint(int(_191)) >> uint(2)));
    int _195 = int(_191) & 3;
    float _197 = (*spvDescriptorSet0.vp_c5)._m0[int(_193)][_195];
    int _199 = int(_191) + 1;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    int _203 = _199 & 3;
    float _205 = (*spvDescriptorSet0.vp_c5)._m0[int(_201)][_203];
    float _207 = _97 * _93;
    float _209 = fma(_95, _85, _207);
    int _211 = _74 + 24;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    uint _215 = uint(int(uint(int(_213)) >> uint(2)));
    int _217 = int(_213) & 3;
    float _219 = (*spvDescriptorSet0.vp_c5)._m0[int(_215)][_217];
    int _221 = int(_213) + 1;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    int _225 = _221 & 3;
    float _227 = (*spvDescriptorSet0.vp_c5)._m0[int(_223)][_225];
    float _229 = _97 * _117;
    float _231 = fma(_95, _109, _229);
    int _233 = _76 + 8;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    uint _237 = uint(int(uint(int(_235)) >> uint(2)));
    int _239 = int(_235) & 3;
    float _241 = (*spvDescriptorSet0.vp_c5)._m0[int(_237)][_239];
    int _243 = int(_235) + 1;
    uint _245 = uint(int(uint(_243) >> uint(2)));
    int _247 = _243 & 3;
    float _249 = (*spvDescriptorSet0.vp_c5)._m0[int(_245)][_247];
    float _251 = _97 * _135;
    float _253 = fma(_95, _127, _251);
    int _255 = _74 + 8;
    uint _257 = uint(int(uint(_255) >> uint(2)));
    uint _259 = uint(int(uint(int(_257)) >> uint(2)));
    int _261 = int(_257) & 3;
    float _263 = (*spvDescriptorSet0.vp_c5)._m0[int(_259)][_261];
    int _265 = int(_257) + 1;
    uint _267 = uint(int(uint(_265) >> uint(2)));
    int _269 = _265 & 3;
    float _271 = (*spvDescriptorSet0.vp_c5)._m0[int(_267)][_269];
    float _273 = _97 * _151;
    float _275 = fma(_95, _143, _273);
    int _277 = _76 + 40;
    uint _279 = uint(int(uint(_277) >> uint(2)));
    uint _281 = uint(int(uint(int(_279)) >> uint(2)));
    int _283 = int(_279) & 3;
    float _285 = (*spvDescriptorSet0.vp_c5)._m0[int(_281)][_283];
    int _287 = int(_279) + 1;
    uint _289 = uint(int(uint(_287) >> uint(2)));
    int _291 = _287 & 3;
    float _293 = (*spvDescriptorSet0.vp_c5)._m0[int(_289)][_291];
    float _295 = _97 * _169;
    float _297 = fma(_95, _161, _295);
    int _299 = _74 + 40;
    uint _301 = uint(int(uint(_299) >> uint(2)));
    uint _303 = uint(int(uint(int(_301)) >> uint(2)));
    int _305 = int(_301) & 3;
    float _307 = (*spvDescriptorSet0.vp_c5)._m0[int(_303)][_305];
    int _309 = int(_301) + 1;
    uint _311 = uint(int(uint(_309) >> uint(2)));
    int _313 = _309 & 3;
    float _315 = (*spvDescriptorSet0.vp_c5)._m0[int(_311)][_313];
    float _317 = _97 * _187;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _321 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _319;
    float _323 = fma(_95, _179, _317);
    float _325 = fma(_321, _321, _71);
    float _327 = fma(_99, _197, _297);
    float _329 = sqrt(_325);
    float _331 = _327 + _205;
    float _333 = fma(_99, _219, _231);
    float _335 = _331 * _59;
    float _337 = _333 + _227;
    float _339 = fma(_99, _241, _275);
    float _341 = fma(_337, _57, _335);
    float _343 = _339 + _249;
    bool _347 = _329 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _349 = isnan(_329);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _355 = _351 || _353;
    float _357 = _341 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _359 = _341 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _361 = fma(_99, _263, _209);
    float _363 = _343 * _59;
    float _365 = _341 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _367 = _361 + _271;
    float _369 = fma(_99, _285, _323);
    float _371 = fma(_367, _57, _363);
    float _373 = _369 + _293;
    float _375 = fma(_371, (*spvDescriptorSet0.vp_c6)._m0[3].x, _357);
    float _377 = fma(_99, _307, _253);
    float _379 = _373 * _59;
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c6)._m0[4].x, _359);
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c6)._m0[5].x, _365);
    float _385 = _377 + _315;
    float _387 = fma(_385, _57, _379);
    float _389 = fma(_387, (*spvDescriptorSet0.vp_c6)._m0[3].z, _375);
    float _391 = fma(_387, (*spvDescriptorSet0.vp_c6)._m0[4].z, _381);
    float _393 = fma(_387, (*spvDescriptorSet0.vp_c6)._m0[5].z, _383);
    float _395 = _375;
    if (!_355)
    {
        _395 = 1.0;
    }
    float _397 = _395;
    float _399 = _389 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _401 = _391 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _403 = _393 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _405 = !_355;
    float _407 = _397;
    if (!_405)
    {
        bool _409 = _329 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _411 = isnan(_329);
        bool _413 = _409 || _411;
        bool _415 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _417 = _413 || _415;
        if (!_417)
        {
            float _419 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _421 = _329 + _419;
            float _423 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _425 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _423;
            float _427 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _429 = _427 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _431 = 1.0 / _425;
            float _433 = _421 * _431;
            float _435 = fma(_433, _429, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _407 = _435;
            _437 = true;
        }
        else
        {
            bool _439 = _329 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _441 = isnan(_329);
            bool _443 = _439 || _441;
            bool _445 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _447 = _443 || _445;
            if (!_447)
            {
                float _449 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _451 = _329 + _449;
                float _453 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _455 = _453 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _457 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _459 = _457 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _461 = 1.0 / _455;
                float _463 = _451 * _461;
                float _465 = fma(_463, _459, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _407 = _465;
                _437 = true;
            }
            else
            {
                _407 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _437 = false;
    float _467 = _407;
    float _469 = _467 + (-1.0);
    float _471 = _469 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _473 = _469 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _475 = _469 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _477 = fma(_401, _467, _471);
    float _479 = fma(_399, _467, _473);
    float _481 = fma(_403, _467, _475);
    float _483 = _477 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _485 = _477 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _487 = fma(_479, (*spvDescriptorSet0.vp_c6)._m0[2].x, _483);
    float _489 = fma(_479, (*spvDescriptorSet0.vp_c6)._m0[0].x, _485);
    float _491 = _477 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _493 = fma(_481, (*spvDescriptorSet0.vp_c6)._m0[2].z, _487);
    float _495 = fma(_481, (*spvDescriptorSet0.vp_c6)._m0[0].z, _489);
    float _497 = fma(_479, (*spvDescriptorSet0.vp_c6)._m0[1].x, _491);
    float _499 = _493 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _501 = _495 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _503 = fma(_481, (*spvDescriptorSet0.vp_c6)._m0[1].z, _497);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _507 = _499 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _511 = _501 + _509;
    float _513 = _503 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _515 = _507 * _507;
    float _517 = _513 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _519 = fma(_511, _511, _515);
    float _521 = fma(_501, (*spvDescriptorSet0.vp_c4)._m0[2].x, _517);
    float _523 = sqrt(_519);
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c4)._m0[2].z, _521);
    float _527 = _525 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _529 = _523 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _531 = _481;
    float _533 = _525;
    float _535 = _503;
    float _537 = _527;
    if (!_529)
    {
        _531 = _501;
    }
    float _539 = _531;
    float _541 = _539;
    if (!_529)
    {
        _533 = _499;
    }
    float _543 = _533;
    float _545 = _543;
    if (!_529)
    {
        _535 = _513;
    }
    float _547 = _535;
    bool _549 = !_529;
    float _551 = _547;
    if (!_549)
    {
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _555 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _557 = _523 + _555;
        float _559 = _513 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _561 = rsqrt(_519);
        float _563 = _557 * _553;
        float _565 = _563 * 0.15915493667125701904296875;
        float _567 = _565 * 6.283185482025146484375;
        float _569 = cos(_567);
        float _571 = _565 * 6.283185482025146484375;
        float _573 = sin(_571);
        float _575 = _569 + (-1.0);
        float _577 = _575 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _579 = fma(_573, _559, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _581 = fma(_513, _569, _577);
        float _583 = _561 * _579;
        float _585 = _581 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _587 = fma(_511, _583, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _589 = fma(_507, _583, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _591 = fma(_587, (*spvDescriptorSet0.vp_c4)._m0[2].x, _585);
        float _593 = fma(_589, (*spvDescriptorSet0.vp_c4)._m0[2].z, _591);
        float _595 = _593 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _551 = _581;
        _541 = _587;
        _545 = _589;
        _537 = _595;
    }
    float _597 = _551;
    float _599 = _541;
    float _601 = _545;
    float _603 = _537;
    float _605 = _597 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _607 = _597 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _609 = in.m_36.x;
    float _611 = fma(_599, (*spvDescriptorSet0.vp_c4)._m0[1].x, _605);
    float _613 = fma(_599, (*spvDescriptorSet0.vp_c4)._m0[0].x, _607);
    float _615 = in.m_36.y;
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c4)._m0[1].z, _611);
    float _619 = fma(_601, (*spvDescriptorSet0.vp_c4)._m0[0].z, _613);
    float _621 = _617 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _623 = _619 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _625 = _621 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _627 = _621 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _629 = _621 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _631 = _621 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _633 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[8].x, _625);
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[7].x, _627);
    float _637 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[9].x, _629);
    float _639 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[10].x, _631);
    float _641 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[8].z, _633);
    float _643 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[7].z, _635);
    float _645 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[9].z, _637);
    float _647 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[10].z, _639);
    float _649 = _643 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _651 = _641 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _653 = _645 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _655 = _647 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_39.x = _609;
    out.m_39.y = _615;
    out.gl_Position.x = _649;
    out.gl_Position.y = _651;
    out.gl_Position.z = _653;
    out.gl_Position.w = _655;
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
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _437 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = as_type<float>(in.m_29.x);
    float _55 = as_type<float>(in.m_29.y);
    float _57 = in.m_32.x;
    float _59 = in.m_32.y;
    float _61 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _63 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _61;
    float _65 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _67 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _65;
    float _69 = _63 * _63;
    float _71 = fma(_67, _67, _69);
    int _74 = as_type<int>(_53) * 48;
    int _76 = as_type<int>(_55) * 48;
    uint _79 = uint(int(uint(_74) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c5)._m0[int(_81)][_83];
    int _87 = int(_79) + 1;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    int _91 = _87 & 3;
    float _93 = (*spvDescriptorSet0.vp_c5)._m0[int(_89)][_91];
    float _95 = in.m_34.x;
    float _97 = in.m_34.y;
    float _99 = in.m_34.z;
    int _101 = _74 + 16;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.vp_c5)._m0[int(_105)][_107];
    int _111 = int(_103) + 1;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    int _115 = _111 & 3;
    float _117 = (*spvDescriptorSet0.vp_c5)._m0[int(_113)][_115];
    int _119 = _74 + 32;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.vp_c5)._m0[int(_123)][_125];
    int _129 = int(_121) + 1;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    int _133 = _129 & 3;
    float _135 = (*spvDescriptorSet0.vp_c5)._m0[int(_131)][_133];
    uint _137 = uint(int(uint(_76) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c5)._m0[int(_139)][_141];
    int _145 = int(_137) + 1;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    int _149 = _145 & 3;
    float _151 = (*spvDescriptorSet0.vp_c5)._m0[int(_147)][_149];
    int _153 = _76 + 16;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    uint _157 = uint(int(uint(int(_155)) >> uint(2)));
    int _159 = int(_155) & 3;
    float _161 = (*spvDescriptorSet0.vp_c5)._m0[int(_157)][_159];
    int _163 = int(_155) + 1;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    int _167 = _163 & 3;
    float _169 = (*spvDescriptorSet0.vp_c5)._m0[int(_165)][_167];
    int _171 = _76 + 32;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    uint _175 = uint(int(uint(int(_173)) >> uint(2)));
    int _177 = int(_173) & 3;
    float _179 = (*spvDescriptorSet0.vp_c5)._m0[int(_175)][_177];
    int _181 = int(_173) + 1;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    int _185 = _181 & 3;
    float _187 = (*spvDescriptorSet0.vp_c5)._m0[int(_183)][_185];
    int _189 = _76 + 24;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    uint _193 = uint(int(uint(int(_191)) >> uint(2)));
    int _195 = int(_191) & 3;
    float _197 = (*spvDescriptorSet0.vp_c5)._m0[int(_193)][_195];
    int _199 = int(_191) + 1;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    int _203 = _199 & 3;
    float _205 = (*spvDescriptorSet0.vp_c5)._m0[int(_201)][_203];
    float _207 = _97 * _93;
    float _209 = fma(_95, _85, _207);
    int _211 = _74 + 24;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    uint _215 = uint(int(uint(int(_213)) >> uint(2)));
    int _217 = int(_213) & 3;
    float _219 = (*spvDescriptorSet0.vp_c5)._m0[int(_215)][_217];
    int _221 = int(_213) + 1;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    int _225 = _221 & 3;
    float _227 = (*spvDescriptorSet0.vp_c5)._m0[int(_223)][_225];
    float _229 = _97 * _117;
    float _231 = fma(_95, _109, _229);
    int _233 = _76 + 8;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    uint _237 = uint(int(uint(int(_235)) >> uint(2)));
    int _239 = int(_235) & 3;
    float _241 = (*spvDescriptorSet0.vp_c5)._m0[int(_237)][_239];
    int _243 = int(_235) + 1;
    uint _245 = uint(int(uint(_243) >> uint(2)));
    int _247 = _243 & 3;
    float _249 = (*spvDescriptorSet0.vp_c5)._m0[int(_245)][_247];
    float _251 = _97 * _135;
    float _253 = fma(_95, _127, _251);
    int _255 = _74 + 8;
    uint _257 = uint(int(uint(_255) >> uint(2)));
    uint _259 = uint(int(uint(int(_257)) >> uint(2)));
    int _261 = int(_257) & 3;
    float _263 = (*spvDescriptorSet0.vp_c5)._m0[int(_259)][_261];
    int _265 = int(_257) + 1;
    uint _267 = uint(int(uint(_265) >> uint(2)));
    int _269 = _265 & 3;
    float _271 = (*spvDescriptorSet0.vp_c5)._m0[int(_267)][_269];
    float _273 = _97 * _151;
    float _275 = fma(_95, _143, _273);
    int _277 = _76 + 40;
    uint _279 = uint(int(uint(_277) >> uint(2)));
    uint _281 = uint(int(uint(int(_279)) >> uint(2)));
    int _283 = int(_279) & 3;
    float _285 = (*spvDescriptorSet0.vp_c5)._m0[int(_281)][_283];
    int _287 = int(_279) + 1;
    uint _289 = uint(int(uint(_287) >> uint(2)));
    int _291 = _287 & 3;
    float _293 = (*spvDescriptorSet0.vp_c5)._m0[int(_289)][_291];
    float _295 = _97 * _169;
    float _297 = fma(_95, _161, _295);
    int _299 = _74 + 40;
    uint _301 = uint(int(uint(_299) >> uint(2)));
    uint _303 = uint(int(uint(int(_301)) >> uint(2)));
    int _305 = int(_301) & 3;
    float _307 = (*spvDescriptorSet0.vp_c5)._m0[int(_303)][_305];
    int _309 = int(_301) + 1;
    uint _311 = uint(int(uint(_309) >> uint(2)));
    int _313 = _309 & 3;
    float _315 = (*spvDescriptorSet0.vp_c5)._m0[int(_311)][_313];
    float _317 = _97 * _187;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _321 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _319;
    float _323 = fma(_95, _179, _317);
    float _325 = fma(_321, _321, _71);
    float _327 = fma(_99, _197, _297);
    float _329 = sqrt(_325);
    float _331 = _327 + _205;
    float _333 = fma(_99, _219, _231);
    float _335 = _331 * _59;
    float _337 = _333 + _227;
    float _339 = fma(_99, _241, _275);
    float _341 = fma(_337, _57, _335);
    float _343 = _339 + _249;
    bool _347 = _329 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _349 = isnan(_329);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _355 = _351 || _353;
    float _357 = _341 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _359 = _341 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _361 = fma(_99, _263, _209);
    float _363 = _343 * _59;
    float _365 = _341 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _367 = _361 + _271;
    float _369 = fma(_99, _285, _323);
    float _371 = fma(_367, _57, _363);
    float _373 = _369 + _293;
    float _375 = fma(_371, (*spvDescriptorSet0.vp_c6)._m0[3].x, _357);
    float _377 = fma(_99, _307, _253);
    float _379 = _373 * _59;
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c6)._m0[4].x, _359);
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c6)._m0[5].x, _365);
    float _385 = _377 + _315;
    float _387 = fma(_385, _57, _379);
    float _389 = fma(_387, (*spvDescriptorSet0.vp_c6)._m0[3].z, _375);
    float _391 = fma(_387, (*spvDescriptorSet0.vp_c6)._m0[4].z, _381);
    float _393 = fma(_387, (*spvDescriptorSet0.vp_c6)._m0[5].z, _383);
    float _395 = _375;
    if (!_355)
    {
        _395 = 1.0;
    }
    float _397 = _395;
    float _399 = _389 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _401 = _391 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _403 = _393 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _405 = !_355;
    float _407 = _397;
    if (!_405)
    {
        bool _409 = _329 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _411 = isnan(_329);
        bool _413 = _409 || _411;
        bool _415 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _417 = _413 || _415;
        if (!_417)
        {
            float _419 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _421 = _329 + _419;
            float _423 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _425 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _423;
            float _427 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _429 = _427 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _431 = 1.0 / _425;
            float _433 = _421 * _431;
            float _435 = fma(_433, _429, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _407 = _435;
            _437 = true;
        }
        else
        {
            bool _439 = _329 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _441 = isnan(_329);
            bool _443 = _439 || _441;
            bool _445 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _447 = _443 || _445;
            if (!_447)
            {
                float _449 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _451 = _329 + _449;
                float _453 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _455 = _453 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _457 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _459 = _457 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _461 = 1.0 / _455;
                float _463 = _451 * _461;
                float _465 = fma(_463, _459, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _407 = _465;
                _437 = true;
            }
            else
            {
                _407 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _437 = false;
    float _467 = _407;
    float _469 = _467 + (-1.0);
    float _471 = _469 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _473 = _469 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _475 = _469 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _477 = fma(_401, _467, _471);
    float _479 = fma(_399, _467, _473);
    float _481 = fma(_403, _467, _475);
    float _483 = _477 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _485 = _477 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _487 = fma(_479, (*spvDescriptorSet0.vp_c6)._m0[2].x, _483);
    float _489 = fma(_479, (*spvDescriptorSet0.vp_c6)._m0[0].x, _485);
    float _491 = _477 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _493 = fma(_481, (*spvDescriptorSet0.vp_c6)._m0[2].z, _487);
    float _495 = fma(_481, (*spvDescriptorSet0.vp_c6)._m0[0].z, _489);
    float _497 = fma(_479, (*spvDescriptorSet0.vp_c6)._m0[1].x, _491);
    float _499 = _493 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _501 = _495 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _503 = fma(_481, (*spvDescriptorSet0.vp_c6)._m0[1].z, _497);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _507 = _499 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _511 = _501 + _509;
    float _513 = _503 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _515 = _507 * _507;
    float _517 = _513 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _519 = fma(_511, _511, _515);
    float _521 = fma(_501, (*spvDescriptorSet0.vp_c4)._m0[2].x, _517);
    float _523 = sqrt(_519);
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c4)._m0[2].z, _521);
    float _527 = _525 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _529 = _523 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _531 = _481;
    float _533 = _525;
    float _535 = _503;
    float _537 = _527;
    if (!_529)
    {
        _531 = _501;
    }
    float _539 = _531;
    float _541 = _539;
    if (!_529)
    {
        _533 = _499;
    }
    float _543 = _533;
    float _545 = _543;
    if (!_529)
    {
        _535 = _513;
    }
    float _547 = _535;
    bool _549 = !_529;
    float _551 = _547;
    if (!_549)
    {
        float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _555 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _557 = _523 + _555;
        float _559 = _513 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _561 = rsqrt(_519);
        float _563 = _557 * _553;
        float _565 = _563 * 0.15915493667125701904296875;
        float _567 = _565 * 6.283185482025146484375;
        float _569 = cos(_567);
        float _571 = _565 * 6.283185482025146484375;
        float _573 = sin(_571);
        float _575 = _569 + (-1.0);
        float _577 = _575 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _579 = fma(_573, _559, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _581 = fma(_513, _569, _577);
        float _583 = _561 * _579;
        float _585 = _581 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _587 = fma(_511, _583, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _589 = fma(_507, _583, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _591 = fma(_587, (*spvDescriptorSet0.vp_c4)._m0[2].x, _585);
        float _593 = fma(_589, (*spvDescriptorSet0.vp_c4)._m0[2].z, _591);
        float _595 = _593 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _551 = _581;
        _541 = _587;
        _545 = _589;
        _537 = _595;
    }
    float _597 = _551;
    float _599 = _541;
    float _601 = _545;
    float _603 = _537;
    float _605 = _597 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _607 = _597 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _609 = in.m_36.x;
    float _611 = fma(_599, (*spvDescriptorSet0.vp_c4)._m0[1].x, _605);
    float _613 = fma(_599, (*spvDescriptorSet0.vp_c4)._m0[0].x, _607);
    float _615 = in.m_36.y;
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c4)._m0[1].z, _611);
    float _619 = fma(_601, (*spvDescriptorSet0.vp_c4)._m0[0].z, _613);
    float _621 = _617 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _623 = _619 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _625 = _621 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _627 = _621 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _629 = _621 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _631 = _621 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _633 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[8].x, _625);
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[7].x, _627);
    float _637 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[9].x, _629);
    float _639 = fma(_623, (*spvDescriptorSet0.vp_c4)._m0[10].x, _631);
    float _641 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[8].z, _633);
    float _643 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[7].z, _635);
    float _645 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[9].z, _637);
    float _647 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[10].z, _639);
    float _649 = _643 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _651 = _641 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _653 = _645 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _655 = _647 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_39.x = _609;
    out.m_39.y = _615;
    out.gl_Position.x = _649;
    out.gl_Position.y = _651;
    out.gl_Position.z = _653;
    out.gl_Position.w = _655;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

