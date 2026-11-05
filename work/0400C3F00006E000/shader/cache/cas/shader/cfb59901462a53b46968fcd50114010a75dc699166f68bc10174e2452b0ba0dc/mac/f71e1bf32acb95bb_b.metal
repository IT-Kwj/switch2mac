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

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c0 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _27* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_38 [[attribute(0)]];
    float4 m_40 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _157 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _59 = as_type<float>(int(gl_InstanceIndex));
    float _61 = as_type<float>(int(gl_BaseInstance));
    int _64 = as_type<int>(_59) - as_type<int>(_61);
    int _66 = _64 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _68 = _66 * 80;
    int _70 = _68 + 28;
    int _72 = _68 + 12;
    int _74 = _68 + 44;
    uint _77 = uint(int(uint(_70) >> uint(2)));
    float _79 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_77)]);
    uint _81 = uint(int(uint(_72) >> uint(2)));
    float _83 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_81)]);
    uint _85 = uint(int(uint(_74) >> uint(2)));
    float _87 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_85)]);
    float _89 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _91 = _79 + _89;
    float _93 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _95 = _83 + _93;
    float _97 = _91 * _91;
    float _99 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _101 = _87 + _99;
    float _103 = fma(_95, _95, _97);
    float _105 = fma(_101, _101, _103);
    float _107 = sqrt(_105);
    bool _111 = _107 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _113 = isnan(_107);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _119 = _115 || _117;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = 1.0;
    }
    float _123 = _121;
    bool _125 = !_119;
    float _127 = _123;
    if (!_125)
    {
        bool _129 = _107 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _131 = isnan(_107);
        bool _133 = _129 || _131;
        bool _135 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _137 = _133 || _135;
        if (!_137)
        {
            float _139 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _141 = _107 + _139;
            float _143 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _145 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _143;
            float _147 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _149 = _147 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _151 = 1.0 / _145;
            float _153 = _141 * _151;
            float _155 = fma(_153, _149, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _127 = _155;
            _157 = true;
        }
        else
        {
            bool _159 = _107 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _161 = isnan(_107);
            bool _163 = _159 || _161;
            bool _165 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _167 = _163 || _165;
            if (!_167)
            {
                float _169 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _171 = _107 + _169;
                float _173 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _175 = _173 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _177 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _179 = _177 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _181 = 1.0 / _175;
                float _183 = _171 * _181;
                float _185 = fma(_183, _179, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _127 = _185;
                _157 = true;
            }
            else
            {
                _127 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _157 = false;
    float _187 = _127;
    int _189 = _68 + 32;
    int _191 = _68 + 16;
    uint _193 = uint(int(uint(_68) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_193)];
    float _195 = as_type<float>(_dmw0.x);
    int _197 = _68 + 4;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    float _201 = as_type<float>(_dmw0.y);
    int _203 = _68 + 8;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    float _207 = as_type<float>(_dmw0.z);
    int _209 = _68 + 12;
    uint _211 = uint(int(uint(_209) >> uint(2)));
    float _213 = as_type<float>(_dmw0.w);
    uint _215 = uint(int(uint(_189) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_215)];
    float _217 = as_type<float>(_dmw2.x);
    int _219 = _189 + 4;
    uint _221 = uint(int(uint(_219) >> uint(2)));
    float _223 = as_type<float>(_dmw2.y);
    int _225 = _189 + 8;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    float _229 = as_type<float>(_dmw2.z);
    int _231 = _189 + 12;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    float _235 = as_type<float>(_dmw2.w);
    uint _237 = uint(int(uint(_191) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_237)];
    float _239 = as_type<float>(_dmw1.x);
    int _241 = _191 + 4;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    float _245 = as_type<float>(_dmw1.y);
    int _247 = _191 + 8;
    uint _249 = uint(int(uint(_247) >> uint(2)));
    float _251 = as_type<float>(_dmw1.z);
    int _253 = _191 + 12;
    uint _255 = uint(int(uint(_253) >> uint(2)));
    float _257 = as_type<float>(_dmw1.w);
    int _259 = _68 + 48;
    float _261 = -_213;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _265 = -_235;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _269 = -_257;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _273 = _201 * _267;
    float _275 = _245 * _263;
    float _277 = _223 * _271;
    float _279 = -_273;
    float _281 = fma(_223, _263, _279);
    float _283 = -_277;
    float _285 = fma(_245, _267, _283);
    float _287 = _281 * _281;
    float _289 = -_275;
    float _291 = fma(_201, _271, _289);
    float _293 = _223 * _285;
    float _295 = fma(_285, _285, _287);
    float _297 = _245 * _291;
    float _299 = -_293;
    float _301 = fma(_201, _291, _299);
    float _303 = fma(_291, _291, _295);
    float _305 = _201 * _281;
    float _307 = -_297;
    float _309 = fma(_223, _281, _307);
    float _311 = _301 * _301;
    float _313 = -_305;
    float _315 = fma(_245, _285, _313);
    float _317 = fma(_309, _309, _311);
    float _319 = 1.0 / _303;
    float _321 = fma(_315, _315, _317);
    float _323 = _239 * _239;
    float _325 = _251 * _251;
    float _327 = in.m_38.x;
    float _329 = in.m_38.y;
    float _331 = in.m_38.z;
    float _333 = 1.0 / _321;
    float _335 = fma(_195, _195, _323);
    float _337 = fma(_207, _207, _325);
    float _339 = fma(_217, _217, _335);
    float _341 = fma(_229, _229, _337);
    float _343 = _339 * _319;
    float _345 = sqrt(_343);
    float _347 = _341 * _333;
    float _349 = _187 + (-1.0);
    float _351 = sqrt(_347);
    float _353 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _355 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _357 = _223 + 9.9999997473787516355514526367188e-06;
    float _359 = fma(_187, _329, _353);
    float _361 = fma(_187, _327, _355);
    float _363 = _201 + 9.9999997473787516355514526367188e-06;
    float _365 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _367 = _359 * _357;
    float _369 = fma(_291, _345, 9.9999997473787516355514526367188e-06);
    float _371 = _359 * _363;
    float _373 = fma(_285, _345, 9.9999997473787516355514526367188e-06);
    float _375 = fma(_187, _331, _365);
    float _377 = fma(_361, _369, _367);
    float _379 = fma(_315, _351, 9.9999997473787516355514526367188e-06);
    float _381 = fma(_361, _373, _371);
    float _383 = fma(_309, _351, 9.9999997473787516355514526367188e-06);
    float _385 = fma(_375, _379, _377);
    float _387 = fma(_375, _383, _381);
    float _389 = _235 + _385;
    float _391 = _213 + _387;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _395 = _389 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _399 = _391 + _397;
    float _401 = _395 * _395;
    float _403 = _245 + 9.9999997473787516355514526367188e-06;
    float _405 = fma(_399, _399, _401);
    float _407 = _359 * _403;
    float _409 = fma(_281, _345, 9.9999997473787516355514526367188e-06);
    float _411 = sqrt(_405);
    float _413 = fma(_301, _351, 9.9999997473787516355514526367188e-06);
    float _415 = fma(_361, _409, _407);
    float _417 = fma(_375, _413, _415);
    float _419 = _257 + _417;
    float _421 = _419 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _423 = _411 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _425 = fma(_391, (*spvDescriptorSet0.vp_c4)._m0[2].x, _421);
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c4)._m0[2].z, _425);
    float _429 = _427 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _431 = _359;
    float _433 = _427;
    float _435 = _401;
    float _437 = _429;
    if (!_423)
    {
        _431 = _391;
    }
    float _439 = _431;
    float _441 = _439;
    if (!_423)
    {
        _433 = _389;
    }
    float _443 = _433;
    float _445 = _443;
    if (!_423)
    {
        _435 = _419;
    }
    float _447 = _435;
    bool _449 = !_423;
    float _451 = _447;
    if (!_449)
    {
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _455 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _457 = _411 + _455;
        float _459 = _419 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _461 = rsqrt(_405);
        float _463 = _457 * _453;
        float _465 = _463 * 0.15915493667125701904296875;
        float _467 = _465 * 6.283185482025146484375;
        float _469 = cos(_467);
        float _471 = _465 * 6.283185482025146484375;
        float _473 = sin(_471);
        float _475 = _469 + (-1.0);
        float _477 = _475 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _479 = fma(_473, _459, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _481 = fma(_419, _469, _477);
        float _483 = _461 * _479;
        float _485 = _481 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _487 = fma(_399, _483, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _489 = fma(_395, _483, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _491 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[2].x, _485);
        float _493 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[2].z, _491);
        float _495 = _493 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _451 = _481;
        _441 = _487;
        _445 = _489;
        _437 = _495;
    }
    float _497 = _451;
    float _499 = _441;
    float _501 = _445;
    float _503 = _437;
    float _505 = _497 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    int _507 = _259 + 8;
    uint _509 = uint(int(uint(_507) >> uint(2)));
    float _511 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_509)]);
    float _513 = _497 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _515 = fma(_499, (*spvDescriptorSet0.vp_c4)._m0[1].x, _505);
    float _517 = in.m_40.x;
    float _519 = fma(_499, (*spvDescriptorSet0.vp_c4)._m0[0].x, _513);
    float _521 = fma(_501, (*spvDescriptorSet0.vp_c4)._m0[1].z, _515);
    float _523 = in.m_40.y;
    float _525 = fma(_501, (*spvDescriptorSet0.vp_c4)._m0[0].z, _519);
    float _527 = _521 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _529 = _525 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _531 = _527 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _533 = _527 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _535 = _527 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _537 = _527 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _539 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[8].x, _531);
    float _541 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[7].x, _533);
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[9].x, _535);
    float _545 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[10].x, _537);
    float _547 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[8].z, _539);
    float _549 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[7].z, _541);
    float _551 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[9].z, _543);
    float _553 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[10].z, _545);
    float _555 = _549 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _557 = _547 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _559 = _551 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _561 = _553 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.x = _517;
    out.m_43.y = _523;
    out.gl_Position.x = _555;
    out.gl_Position.y = _557;
    out.gl_Position.z = _559;
    out.gl_Position.w = _561;
    out.m_45.z = _511;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _157 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _59 = as_type<float>(int(gl_InstanceIndex));
    float _61 = as_type<float>(int(gl_BaseInstance));
    int _64 = as_type<int>(_59) - as_type<int>(_61);
    int _66 = _64 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _68 = _66 * 80;
    int _70 = _68 + 28;
    int _72 = _68 + 12;
    int _74 = _68 + 44;
    uint _77 = uint(int(uint(_70) >> uint(2)));
    float _79 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_77)]);
    uint _81 = uint(int(uint(_72) >> uint(2)));
    float _83 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_81)]);
    uint _85 = uint(int(uint(_74) >> uint(2)));
    float _87 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_85)]);
    float _89 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _91 = _79 + _89;
    float _93 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _95 = _83 + _93;
    float _97 = _91 * _91;
    float _99 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _101 = _87 + _99;
    float _103 = fma(_95, _95, _97);
    float _105 = fma(_101, _101, _103);
    float _107 = sqrt(_105);
    bool _111 = _107 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _113 = isnan(_107);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _119 = _115 || _117;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = 1.0;
    }
    float _123 = _121;
    bool _125 = !_119;
    float _127 = _123;
    if (!_125)
    {
        bool _129 = _107 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _131 = isnan(_107);
        bool _133 = _129 || _131;
        bool _135 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _137 = _133 || _135;
        if (!_137)
        {
            float _139 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _141 = _107 + _139;
            float _143 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _145 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _143;
            float _147 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _149 = _147 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _151 = 1.0 / _145;
            float _153 = _141 * _151;
            float _155 = fma(_153, _149, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _127 = _155;
            _157 = true;
        }
        else
        {
            bool _159 = _107 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _161 = isnan(_107);
            bool _163 = _159 || _161;
            bool _165 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _167 = _163 || _165;
            if (!_167)
            {
                float _169 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _171 = _107 + _169;
                float _173 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _175 = _173 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _177 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _179 = _177 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _181 = 1.0 / _175;
                float _183 = _171 * _181;
                float _185 = fma(_183, _179, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _127 = _185;
                _157 = true;
            }
            else
            {
                _127 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _157 = false;
    float _187 = _127;
    int _189 = _68 + 32;
    int _191 = _68 + 16;
    uint _193 = uint(int(uint(_68) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_193)];
    float _195 = as_type<float>(_dmw0.x);
    int _197 = _68 + 4;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    float _201 = as_type<float>(_dmw0.y);
    int _203 = _68 + 8;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    float _207 = as_type<float>(_dmw0.z);
    int _209 = _68 + 12;
    uint _211 = uint(int(uint(_209) >> uint(2)));
    float _213 = as_type<float>(_dmw0.w);
    uint _215 = uint(int(uint(_189) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_215)];
    float _217 = as_type<float>(_dmw2.x);
    int _219 = _189 + 4;
    uint _221 = uint(int(uint(_219) >> uint(2)));
    float _223 = as_type<float>(_dmw2.y);
    int _225 = _189 + 8;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    float _229 = as_type<float>(_dmw2.z);
    int _231 = _189 + 12;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    float _235 = as_type<float>(_dmw2.w);
    uint _237 = uint(int(uint(_191) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_237)];
    float _239 = as_type<float>(_dmw1.x);
    int _241 = _191 + 4;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    float _245 = as_type<float>(_dmw1.y);
    int _247 = _191 + 8;
    uint _249 = uint(int(uint(_247) >> uint(2)));
    float _251 = as_type<float>(_dmw1.z);
    int _253 = _191 + 12;
    uint _255 = uint(int(uint(_253) >> uint(2)));
    float _257 = as_type<float>(_dmw1.w);
    int _259 = _68 + 48;
    float _261 = -_213;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _265 = -_235;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _269 = -_257;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _273 = _201 * _267;
    float _275 = _245 * _263;
    float _277 = _223 * _271;
    float _279 = -_273;
    float _281 = fma(_223, _263, _279);
    float _283 = -_277;
    float _285 = fma(_245, _267, _283);
    float _287 = _281 * _281;
    float _289 = -_275;
    float _291 = fma(_201, _271, _289);
    float _293 = _223 * _285;
    float _295 = fma(_285, _285, _287);
    float _297 = _245 * _291;
    float _299 = -_293;
    float _301 = fma(_201, _291, _299);
    float _303 = fma(_291, _291, _295);
    float _305 = _201 * _281;
    float _307 = -_297;
    float _309 = fma(_223, _281, _307);
    float _311 = _301 * _301;
    float _313 = -_305;
    float _315 = fma(_245, _285, _313);
    float _317 = fma(_309, _309, _311);
    float _319 = 1.0 / _303;
    float _321 = fma(_315, _315, _317);
    float _323 = _239 * _239;
    float _325 = _251 * _251;
    float _327 = in.m_38.x;
    float _329 = in.m_38.y;
    float _331 = in.m_38.z;
    float _333 = 1.0 / _321;
    float _335 = fma(_195, _195, _323);
    float _337 = fma(_207, _207, _325);
    float _339 = fma(_217, _217, _335);
    float _341 = fma(_229, _229, _337);
    float _343 = _339 * _319;
    float _345 = sqrt(_343);
    float _347 = _341 * _333;
    float _349 = _187 + (-1.0);
    float _351 = sqrt(_347);
    float _353 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _355 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _357 = _223 + 9.9999997473787516355514526367188e-06;
    float _359 = fma(_187, _329, _353);
    float _361 = fma(_187, _327, _355);
    float _363 = _201 + 9.9999997473787516355514526367188e-06;
    float _365 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _367 = _359 * _357;
    float _369 = fma(_291, _345, 9.9999997473787516355514526367188e-06);
    float _371 = _359 * _363;
    float _373 = fma(_285, _345, 9.9999997473787516355514526367188e-06);
    float _375 = fma(_187, _331, _365);
    float _377 = fma(_361, _369, _367);
    float _379 = fma(_315, _351, 9.9999997473787516355514526367188e-06);
    float _381 = fma(_361, _373, _371);
    float _383 = fma(_309, _351, 9.9999997473787516355514526367188e-06);
    float _385 = fma(_375, _379, _377);
    float _387 = fma(_375, _383, _381);
    float _389 = _235 + _385;
    float _391 = _213 + _387;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _395 = _389 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _399 = _391 + _397;
    float _401 = _395 * _395;
    float _403 = _245 + 9.9999997473787516355514526367188e-06;
    float _405 = fma(_399, _399, _401);
    float _407 = _359 * _403;
    float _409 = fma(_281, _345, 9.9999997473787516355514526367188e-06);
    float _411 = sqrt(_405);
    float _413 = fma(_301, _351, 9.9999997473787516355514526367188e-06);
    float _415 = fma(_361, _409, _407);
    float _417 = fma(_375, _413, _415);
    float _419 = _257 + _417;
    float _421 = _419 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _423 = _411 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _425 = fma(_391, (*spvDescriptorSet0.vp_c4)._m0[2].x, _421);
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c4)._m0[2].z, _425);
    float _429 = _427 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _431 = _359;
    float _433 = _427;
    float _435 = _401;
    float _437 = _429;
    if (!_423)
    {
        _431 = _391;
    }
    float _439 = _431;
    float _441 = _439;
    if (!_423)
    {
        _433 = _389;
    }
    float _443 = _433;
    float _445 = _443;
    if (!_423)
    {
        _435 = _419;
    }
    float _447 = _435;
    bool _449 = !_423;
    float _451 = _447;
    if (!_449)
    {
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _455 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _457 = _411 + _455;
        float _459 = _419 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _461 = rsqrt(_405);
        float _463 = _457 * _453;
        float _465 = _463 * 0.15915493667125701904296875;
        float _467 = _465 * 6.283185482025146484375;
        float _469 = cos(_467);
        float _471 = _465 * 6.283185482025146484375;
        float _473 = sin(_471);
        float _475 = _469 + (-1.0);
        float _477 = _475 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _479 = fma(_473, _459, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _481 = fma(_419, _469, _477);
        float _483 = _461 * _479;
        float _485 = _481 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _487 = fma(_399, _483, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _489 = fma(_395, _483, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _491 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[2].x, _485);
        float _493 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[2].z, _491);
        float _495 = _493 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _451 = _481;
        _441 = _487;
        _445 = _489;
        _437 = _495;
    }
    float _497 = _451;
    float _499 = _441;
    float _501 = _445;
    float _503 = _437;
    float _505 = _497 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    int _507 = _259 + 8;
    uint _509 = uint(int(uint(_507) >> uint(2)));
    float _511 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_509)]);
    float _513 = _497 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _515 = fma(_499, (*spvDescriptorSet0.vp_c4)._m0[1].x, _505);
    float _517 = in.m_40.x;
    float _519 = fma(_499, (*spvDescriptorSet0.vp_c4)._m0[0].x, _513);
    float _521 = fma(_501, (*spvDescriptorSet0.vp_c4)._m0[1].z, _515);
    float _523 = in.m_40.y;
    float _525 = fma(_501, (*spvDescriptorSet0.vp_c4)._m0[0].z, _519);
    float _527 = _521 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _529 = _525 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _531 = _527 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _533 = _527 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _535 = _527 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _537 = _527 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _539 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[8].x, _531);
    float _541 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[7].x, _533);
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[9].x, _535);
    float _545 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[10].x, _537);
    float _547 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[8].z, _539);
    float _549 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[7].z, _541);
    float _551 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[9].z, _543);
    float _553 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[10].z, _545);
    float _555 = _549 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _557 = _547 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _559 = _551 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _561 = _553 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.x = _517;
    out.m_43.y = _523;
    out.gl_Position.x = _555;
    out.gl_Position.y = _557;
    out.gl_Position.z = _559;
    out.gl_Position.w = _561;
    out.m_45.z = _511;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint dm_vid [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _157 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _59 = as_type<float>(int(gl_InstanceIndex));
    float _61 = as_type<float>(int(gl_BaseInstance));
    int _64 = as_type<int>(_59) - as_type<int>(_61);
    int _66 = _64 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _68 = _66 * 80;
    int _70 = _68 + 28;
    int _72 = _68 + 12;
    int _74 = _68 + 44;
    uint _77 = uint(int(uint(_70) >> uint(2)));
    float _79 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_77)]);
    uint _81 = uint(int(uint(_72) >> uint(2)));
    float _83 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_81)]);
    uint _85 = uint(int(uint(_74) >> uint(2)));
    float _87 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_85)]);
    float _89 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _91 = _79 + _89;
    float _93 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _95 = _83 + _93;
    float _97 = _91 * _91;
    float _99 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _101 = _87 + _99;
    float _103 = fma(_95, _95, _97);
    float _105 = fma(_101, _101, _103);
    float _107 = sqrt(_105);
    bool _111 = _107 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _113 = isnan(_107);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _119 = _115 || _117;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = 1.0;
    }
    float _123 = _121;
    bool _125 = !_119;
    float _127 = _123;
    if (!_125)
    {
        bool _129 = _107 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _131 = isnan(_107);
        bool _133 = _129 || _131;
        bool _135 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _137 = _133 || _135;
        if (!_137)
        {
            float _139 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _141 = _107 + _139;
            float _143 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _145 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _143;
            float _147 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _149 = _147 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _151 = 1.0 / _145;
            float _153 = _141 * _151;
            float _155 = fma(_153, _149, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _127 = _155;
            _157 = true;
        }
        else
        {
            bool _159 = _107 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _161 = isnan(_107);
            bool _163 = _159 || _161;
            bool _165 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _167 = _163 || _165;
            if (!_167)
            {
                float _169 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _171 = _107 + _169;
                float _173 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _175 = _173 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _177 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _179 = _177 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _181 = 1.0 / _175;
                float _183 = _171 * _181;
                float _185 = fma(_183, _179, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _127 = _185;
                _157 = true;
            }
            else
            {
                _127 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _157 = false;
    float _187 = _127;
    int _189 = _68 + 32;
    int _191 = _68 + 16;
    uint _193 = uint(int(uint(_68) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_193)];
    float _195 = as_type<float>(_dmw0.x);
    int _197 = _68 + 4;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    float _201 = as_type<float>(_dmw0.y);
    int _203 = _68 + 8;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    float _207 = as_type<float>(_dmw0.z);
    int _209 = _68 + 12;
    uint _211 = uint(int(uint(_209) >> uint(2)));
    float _213 = as_type<float>(_dmw0.w);
    uint _215 = uint(int(uint(_189) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_215)];
    float _217 = as_type<float>(_dmw2.x);
    int _219 = _189 + 4;
    uint _221 = uint(int(uint(_219) >> uint(2)));
    float _223 = as_type<float>(_dmw2.y);
    int _225 = _189 + 8;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    float _229 = as_type<float>(_dmw2.z);
    int _231 = _189 + 12;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    float _235 = as_type<float>(_dmw2.w);
    uint _237 = uint(int(uint(_191) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_237)];
    float _239 = as_type<float>(_dmw1.x);
    int _241 = _191 + 4;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    float _245 = as_type<float>(_dmw1.y);
    int _247 = _191 + 8;
    uint _249 = uint(int(uint(_247) >> uint(2)));
    float _251 = as_type<float>(_dmw1.z);
    int _253 = _191 + 12;
    uint _255 = uint(int(uint(_253) >> uint(2)));
    float _257 = as_type<float>(_dmw1.w);
    int _259 = _68 + 48;
    float _261 = -_213;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _265 = -_235;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _269 = -_257;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _273 = _201 * _267;
    float _275 = _245 * _263;
    float _277 = _223 * _271;
    float _279 = -_273;
    float _281 = fma(_223, _263, _279);
    float _283 = -_277;
    float _285 = fma(_245, _267, _283);
    float _287 = _281 * _281;
    float _289 = -_275;
    float _291 = fma(_201, _271, _289);
    float _293 = _223 * _285;
    float _295 = fma(_285, _285, _287);
    float _297 = _245 * _291;
    float _299 = -_293;
    float _301 = fma(_201, _291, _299);
    float _303 = fma(_291, _291, _295);
    float _305 = _201 * _281;
    float _307 = -_297;
    float _309 = fma(_223, _281, _307);
    float _311 = _301 * _301;
    float _313 = -_305;
    float _315 = fma(_245, _285, _313);
    float _317 = fma(_309, _309, _311);
    float _319 = 1.0 / _303;
    float _321 = fma(_315, _315, _317);
    float _323 = _239 * _239;
    float _325 = _251 * _251;
    float _327 = in.m_38.x;
    float _329 = in.m_38.y;
    float _331 = in.m_38.z;
    float _333 = 1.0 / _321;
    float _335 = fma(_195, _195, _323);
    float _337 = fma(_207, _207, _325);
    float _339 = fma(_217, _217, _335);
    float _341 = fma(_229, _229, _337);
    float _343 = _339 * _319;
    float _345 = sqrt(_343);
    float _347 = _341 * _333;
    float _349 = _187 + (-1.0);
    float _351 = sqrt(_347);
    float _353 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _355 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _357 = _223 + 9.9999997473787516355514526367188e-06;
    float _359 = fma(_187, _329, _353);
    float _361 = fma(_187, _327, _355);
    float _363 = _201 + 9.9999997473787516355514526367188e-06;
    float _365 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _367 = _359 * _357;
    float _369 = fma(_291, _345, 9.9999997473787516355514526367188e-06);
    float _371 = _359 * _363;
    float _373 = fma(_285, _345, 9.9999997473787516355514526367188e-06);
    float _375 = fma(_187, _331, _365);
    float _377 = fma(_361, _369, _367);
    float _379 = fma(_315, _351, 9.9999997473787516355514526367188e-06);
    float _381 = fma(_361, _373, _371);
    float _383 = fma(_309, _351, 9.9999997473787516355514526367188e-06);
    float _385 = fma(_375, _379, _377);
    float _387 = fma(_375, _383, _381);
    float _389 = _235 + _385;
    float _391 = _213 + _387;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _395 = _389 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _399 = _391 + _397;
    float _401 = _395 * _395;
    float _403 = _245 + 9.9999997473787516355514526367188e-06;
    float _405 = fma(_399, _399, _401);
    float _407 = _359 * _403;
    float _409 = fma(_281, _345, 9.9999997473787516355514526367188e-06);
    float _411 = sqrt(_405);
    float _413 = fma(_301, _351, 9.9999997473787516355514526367188e-06);
    float _415 = fma(_361, _409, _407);
    float _417 = fma(_375, _413, _415);
    float _419 = _257 + _417;
    float _421 = _419 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _423 = _411 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _425 = fma(_391, (*spvDescriptorSet0.vp_c4)._m0[2].x, _421);
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c4)._m0[2].z, _425);
    float _429 = _427 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _431 = _359;
    float _433 = _427;
    float _435 = _401;
    float _437 = _429;
    if (!_423)
    {
        _431 = _391;
    }
    float _439 = _431;
    float _441 = _439;
    if (!_423)
    {
        _433 = _389;
    }
    float _443 = _433;
    float _445 = _443;
    if (!_423)
    {
        _435 = _419;
    }
    float _447 = _435;
    bool _449 = !_423;
    float _451 = _447;
    if (!_449)
    {
        float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _455 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _457 = _411 + _455;
        float _459 = _419 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _461 = rsqrt(_405);
        float _463 = _457 * _453;
        float _465 = _463 * 0.15915493667125701904296875;
        float _467 = _465 * 6.283185482025146484375;
        float _469 = cos(_467);
        float _471 = _465 * 6.283185482025146484375;
        float _473 = sin(_471);
        float _475 = _469 + (-1.0);
        float _477 = _475 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _479 = fma(_473, _459, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _481 = fma(_419, _469, _477);
        float _483 = _461 * _479;
        float _485 = _481 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _487 = fma(_399, _483, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _489 = fma(_395, _483, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _491 = fma(_487, (*spvDescriptorSet0.vp_c4)._m0[2].x, _485);
        float _493 = fma(_489, (*spvDescriptorSet0.vp_c4)._m0[2].z, _491);
        float _495 = _493 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _451 = _481;
        _441 = _487;
        _445 = _489;
        _437 = _495;
    }
    float _497 = _451;
    float _499 = _441;
    float _501 = _445;
    float _503 = _437;
    float _505 = _497 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    int _507 = _259 + 8;
    uint _509 = uint(int(uint(_507) >> uint(2)));
    float _511 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_509)]);
    float _513 = _497 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _515 = fma(_499, (*spvDescriptorSet0.vp_c4)._m0[1].x, _505);
    float _517 = in.m_40.x;
    float _519 = fma(_499, (*spvDescriptorSet0.vp_c4)._m0[0].x, _513);
    float _521 = fma(_501, (*spvDescriptorSet0.vp_c4)._m0[1].z, _515);
    float _523 = in.m_40.y;
    float _525 = fma(_501, (*spvDescriptorSet0.vp_c4)._m0[0].z, _519);
    float _527 = _521 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _529 = _525 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _531 = _527 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _533 = _527 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _535 = _527 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _537 = _527 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _539 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[8].x, _531);
    float _541 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[7].x, _533);
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[9].x, _535);
    float _545 = fma(_529, (*spvDescriptorSet0.vp_c4)._m0[10].x, _537);
    float _547 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[8].z, _539);
    float _549 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[7].z, _541);
    float _551 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[9].z, _543);
    float _553 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[10].z, _545);
    float _555 = _549 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _557 = _547 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _559 = _551 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _561 = _553 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.x = _517;
    out.m_43.y = _523;
    out.gl_Position.x = _555;
    out.gl_Position.y = _557;
    out.gl_Position.z = _559;
    out.gl_Position.w = _561;
    out.m_45.z = _511;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

