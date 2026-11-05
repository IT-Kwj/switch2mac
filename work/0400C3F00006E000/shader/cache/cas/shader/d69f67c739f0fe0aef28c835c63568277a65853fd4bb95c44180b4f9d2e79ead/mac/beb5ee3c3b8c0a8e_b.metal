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
    float4 m_45 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _159 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = as_type<float>(int(gl_InstanceIndex));
    float _63 = as_type<float>(int(gl_BaseInstance));
    int _66 = as_type<int>(_61) - as_type<int>(_63);
    int _68 = _66 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _70 = _68 * 80;
    int _72 = _70 + 28;
    int _74 = _70 + 12;
    int _76 = _70 + 44;
    uint _79 = uint(int(uint(_72) >> uint(2)));
    float _81 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_79)]);
    uint _83 = uint(int(uint(_74) >> uint(2)));
    float _85 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_83)]);
    uint _87 = uint(int(uint(_76) >> uint(2)));
    float _89 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_87)]);
    float _91 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _93 = _81 + _91;
    float _95 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _97 = _85 + _95;
    float _99 = _93 * _93;
    float _101 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _103 = _89 + _101;
    float _105 = fma(_97, _97, _99);
    float _107 = fma(_103, _103, _105);
    float _109 = sqrt(_107);
    bool _113 = _109 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _115 = isnan(_109);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _121 = _117 || _119;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = 1.0;
    }
    float _125 = _123;
    bool _127 = !_121;
    float _129 = _125;
    if (!_127)
    {
        bool _131 = _109 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _133 = isnan(_109);
        bool _135 = _131 || _133;
        bool _137 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _139 = _135 || _137;
        if (!_139)
        {
            float _141 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _143 = _109 + _141;
            float _145 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _147 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _145;
            float _149 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _151 = _149 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _153 = 1.0 / _147;
            float _155 = _143 * _153;
            float _157 = fma(_155, _151, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _129 = _157;
            _159 = true;
        }
        else
        {
            bool _161 = _109 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _163 = isnan(_109);
            bool _165 = _161 || _163;
            bool _167 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _169 = _165 || _167;
            if (!_169)
            {
                float _171 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _173 = _109 + _171;
                float _175 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _177 = _175 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _179 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _181 = _179 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _183 = 1.0 / _177;
                float _185 = _173 * _183;
                float _187 = fma(_185, _181, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _129 = _187;
                _159 = true;
            }
            else
            {
                _129 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _159 = false;
    float _189 = _129;
    int _191 = _70 + 32;
    int _193 = _70 + 16;
    uint _195 = uint(int(uint(_70) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_195)];
    float _197 = as_type<float>(_dmw0.x);
    int _199 = _70 + 4;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>(_dmw0.y);
    int _205 = _70 + 8;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>(_dmw0.z);
    int _211 = _70 + 12;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    float _215 = as_type<float>(_dmw0.w);
    uint _217 = uint(int(uint(_191) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_217)];
    float _219 = as_type<float>(_dmw2.x);
    int _221 = _191 + 4;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>(_dmw2.y);
    int _227 = _191 + 8;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>(_dmw2.z);
    int _233 = _191 + 12;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    float _237 = as_type<float>(_dmw2.w);
    uint _239 = uint(int(uint(_193) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_239)];
    float _241 = as_type<float>(_dmw1.x);
    int _243 = _193 + 4;
    uint _245 = uint(int(uint(_243) >> uint(2)));
    float _247 = as_type<float>(_dmw1.y);
    int _249 = _193 + 8;
    uint _251 = uint(int(uint(_249) >> uint(2)));
    float _253 = as_type<float>(_dmw1.z);
    int _255 = _193 + 12;
    uint _257 = uint(int(uint(_255) >> uint(2)));
    float _259 = as_type<float>(_dmw1.w);
    float _261 = -_215;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _265 = -_237;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _269 = -_259;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _273 = _203 * _267;
    float _275 = _247 * _263;
    float _277 = _225 * _271;
    float _279 = -_273;
    float _281 = fma(_225, _263, _279);
    float _283 = -_277;
    float _285 = fma(_247, _267, _283);
    float _287 = _281 * _281;
    float _289 = -_275;
    float _291 = fma(_203, _271, _289);
    float _293 = _225 * _285;
    float _295 = fma(_285, _285, _287);
    float _297 = _247 * _291;
    float _299 = -_293;
    float _301 = fma(_203, _291, _299);
    float _303 = fma(_291, _291, _295);
    float _305 = _203 * _281;
    float _307 = -_297;
    float _309 = fma(_225, _281, _307);
    float _311 = _301 * _301;
    float _313 = -_305;
    float _315 = fma(_247, _285, _313);
    float _317 = fma(_309, _309, _311);
    float _319 = 1.0 / _303;
    float _321 = fma(_315, _315, _317);
    float _323 = _241 * _241;
    float _325 = _253 * _253;
    float _327 = in.m_38.x;
    float _329 = in.m_38.y;
    float _331 = in.m_38.z;
    float _333 = 1.0 / _321;
    float _335 = fma(_197, _197, _323);
    float _337 = fma(_209, _209, _325);
    float _339 = fma(_219, _219, _335);
    float _341 = fma(_231, _231, _337);
    float _343 = _339 * _319;
    float _345 = sqrt(_343);
    float _347 = _341 * _333;
    float _349 = _189 + (-1.0);
    float _351 = sqrt(_347);
    float _353 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _355 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _357 = _225 + 9.9999997473787516355514526367188e-06;
    float _359 = fma(_189, _329, _353);
    float _361 = fma(_189, _327, _355);
    float _363 = _203 + 9.9999997473787516355514526367188e-06;
    float _365 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _367 = _359 * _357;
    float _369 = fma(_291, _345, 9.9999997473787516355514526367188e-06);
    float _371 = _359 * _363;
    float _373 = fma(_285, _345, 9.9999997473787516355514526367188e-06);
    float _375 = fma(_189, _331, _365);
    float _377 = fma(_361, _369, _367);
    float _379 = fma(_315, _351, 9.9999997473787516355514526367188e-06);
    float _381 = fma(_361, _373, _371);
    float _383 = fma(_309, _351, 9.9999997473787516355514526367188e-06);
    float _385 = fma(_375, _379, _377);
    float _387 = fma(_375, _383, _381);
    float _389 = _237 + _385;
    float _391 = _215 + _387;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _395 = _389 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _399 = _391 + _397;
    float _401 = _395 * _395;
    float _403 = _247 + 9.9999997473787516355514526367188e-06;
    float _405 = fma(_399, _399, _401);
    float _407 = _359 * _403;
    float _409 = fma(_281, _345, 9.9999997473787516355514526367188e-06);
    float _411 = sqrt(_405);
    float _413 = fma(_301, _351, 9.9999997473787516355514526367188e-06);
    float _415 = fma(_361, _409, _407);
    float _417 = fma(_375, _413, _415);
    float _419 = _259 + _417;
    float _421 = _419 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _423 = _411 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _425 = fma(_391, (*spvDescriptorSet0.vp_c4)._m0[2].x, _421);
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c4)._m0[2].z, _425);
    int _429 = _70 + 64;
    int _431 = _70 + 48;
    float _433 = _427 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _435 = _359;
    float _437 = _427;
    float _439 = _401;
    float _441 = _433;
    if (!_423)
    {
        _435 = _391;
    }
    float _443 = _435;
    float _445 = _443;
    if (!_423)
    {
        _437 = _389;
    }
    float _447 = _437;
    float _449 = _447;
    if (!_423)
    {
        _439 = _419;
    }
    float _451 = _439;
    bool _453 = !_423;
    float _455 = _451;
    if (!_453)
    {
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _461 = _411 + _459;
        float _463 = _419 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _465 = rsqrt(_405);
        float _467 = _461 * _457;
        float _469 = _467 * 0.15915493667125701904296875;
        float _471 = _469 * 6.283185482025146484375;
        float _473 = cos(_471);
        float _475 = _469 * 6.283185482025146484375;
        float _477 = sin(_475);
        float _479 = _473 + (-1.0);
        float _481 = _479 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _483 = fma(_477, _463, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _485 = fma(_419, _473, _481);
        float _487 = _465 * _483;
        float _489 = _485 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _491 = fma(_399, _487, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _493 = fma(_395, _487, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _495 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[2].x, _489);
        float _497 = fma(_493, (*spvDescriptorSet0.vp_c4)._m0[2].z, _495);
        float _499 = _497 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _455 = _485;
        _445 = _491;
        _449 = _493;
        _441 = _499;
    }
    float _501 = _455;
    float _503 = _445;
    float _505 = _449;
    float _507 = _441;
    float _509 = _501 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    uint _511 = uint(int(uint(_429) >> uint(2)));
    float _513 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_511)]);
    int _515 = _431 + 8;
    uint _517 = uint(int(uint(_515) >> uint(2)));
    float _519 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_517)]);
    float _521 = _501 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _523 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[1].x, _509);
    float _525 = in.m_40.x;
    float _527 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[0].x, _521);
    float _529 = fma(_505, (*spvDescriptorSet0.vp_c4)._m0[1].z, _523);
    float _531 = in.m_40.y;
    float _533 = fma(_505, (*spvDescriptorSet0.vp_c4)._m0[0].z, _527);
    float _535 = _529 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _537 = _533 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _539 = _535 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _541 = _535 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _543 = _535 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _545 = _535 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _547 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[8].x, _539);
    float _549 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[7].x, _541);
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[9].x, _543);
    float _553 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[10].x, _545);
    float _555 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[8].z, _547);
    float _557 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[7].z, _549);
    float _559 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[9].z, _551);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[10].z, _553);
    float _563 = _557 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _565 = _555 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _567 = _559 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _569 = _561 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.x = _525;
    out.m_43.y = _531;
    out.gl_Position.x = _563;
    out.gl_Position.y = _565;
    out.gl_Position.z = _567;
    out.gl_Position.w = _569;
    out.m_45.w = _513;
    out.m_47.z = _519;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _159 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = as_type<float>(int(gl_InstanceIndex));
    float _63 = as_type<float>(int(gl_BaseInstance));
    int _66 = as_type<int>(_61) - as_type<int>(_63);
    int _68 = _66 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _70 = _68 * 80;
    int _72 = _70 + 28;
    int _74 = _70 + 12;
    int _76 = _70 + 44;
    uint _79 = uint(int(uint(_72) >> uint(2)));
    float _81 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_79)]);
    uint _83 = uint(int(uint(_74) >> uint(2)));
    float _85 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_83)]);
    uint _87 = uint(int(uint(_76) >> uint(2)));
    float _89 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_87)]);
    float _91 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _93 = _81 + _91;
    float _95 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _97 = _85 + _95;
    float _99 = _93 * _93;
    float _101 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _103 = _89 + _101;
    float _105 = fma(_97, _97, _99);
    float _107 = fma(_103, _103, _105);
    float _109 = sqrt(_107);
    bool _113 = _109 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _115 = isnan(_109);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _121 = _117 || _119;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = 1.0;
    }
    float _125 = _123;
    bool _127 = !_121;
    float _129 = _125;
    if (!_127)
    {
        bool _131 = _109 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _133 = isnan(_109);
        bool _135 = _131 || _133;
        bool _137 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _139 = _135 || _137;
        if (!_139)
        {
            float _141 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _143 = _109 + _141;
            float _145 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _147 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _145;
            float _149 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _151 = _149 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _153 = 1.0 / _147;
            float _155 = _143 * _153;
            float _157 = fma(_155, _151, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _129 = _157;
            _159 = true;
        }
        else
        {
            bool _161 = _109 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _163 = isnan(_109);
            bool _165 = _161 || _163;
            bool _167 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _169 = _165 || _167;
            if (!_169)
            {
                float _171 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _173 = _109 + _171;
                float _175 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _177 = _175 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _179 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _181 = _179 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _183 = 1.0 / _177;
                float _185 = _173 * _183;
                float _187 = fma(_185, _181, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _129 = _187;
                _159 = true;
            }
            else
            {
                _129 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _159 = false;
    float _189 = _129;
    int _191 = _70 + 32;
    int _193 = _70 + 16;
    uint _195 = uint(int(uint(_70) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_195)];
    float _197 = as_type<float>(_dmw0.x);
    int _199 = _70 + 4;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>(_dmw0.y);
    int _205 = _70 + 8;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>(_dmw0.z);
    int _211 = _70 + 12;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    float _215 = as_type<float>(_dmw0.w);
    uint _217 = uint(int(uint(_191) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_217)];
    float _219 = as_type<float>(_dmw2.x);
    int _221 = _191 + 4;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>(_dmw2.y);
    int _227 = _191 + 8;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>(_dmw2.z);
    int _233 = _191 + 12;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    float _237 = as_type<float>(_dmw2.w);
    uint _239 = uint(int(uint(_193) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_239)];
    float _241 = as_type<float>(_dmw1.x);
    int _243 = _193 + 4;
    uint _245 = uint(int(uint(_243) >> uint(2)));
    float _247 = as_type<float>(_dmw1.y);
    int _249 = _193 + 8;
    uint _251 = uint(int(uint(_249) >> uint(2)));
    float _253 = as_type<float>(_dmw1.z);
    int _255 = _193 + 12;
    uint _257 = uint(int(uint(_255) >> uint(2)));
    float _259 = as_type<float>(_dmw1.w);
    float _261 = -_215;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _265 = -_237;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _269 = -_259;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _273 = _203 * _267;
    float _275 = _247 * _263;
    float _277 = _225 * _271;
    float _279 = -_273;
    float _281 = fma(_225, _263, _279);
    float _283 = -_277;
    float _285 = fma(_247, _267, _283);
    float _287 = _281 * _281;
    float _289 = -_275;
    float _291 = fma(_203, _271, _289);
    float _293 = _225 * _285;
    float _295 = fma(_285, _285, _287);
    float _297 = _247 * _291;
    float _299 = -_293;
    float _301 = fma(_203, _291, _299);
    float _303 = fma(_291, _291, _295);
    float _305 = _203 * _281;
    float _307 = -_297;
    float _309 = fma(_225, _281, _307);
    float _311 = _301 * _301;
    float _313 = -_305;
    float _315 = fma(_247, _285, _313);
    float _317 = fma(_309, _309, _311);
    float _319 = 1.0 / _303;
    float _321 = fma(_315, _315, _317);
    float _323 = _241 * _241;
    float _325 = _253 * _253;
    float _327 = in.m_38.x;
    float _329 = in.m_38.y;
    float _331 = in.m_38.z;
    float _333 = 1.0 / _321;
    float _335 = fma(_197, _197, _323);
    float _337 = fma(_209, _209, _325);
    float _339 = fma(_219, _219, _335);
    float _341 = fma(_231, _231, _337);
    float _343 = _339 * _319;
    float _345 = sqrt(_343);
    float _347 = _341 * _333;
    float _349 = _189 + (-1.0);
    float _351 = sqrt(_347);
    float _353 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _355 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _357 = _225 + 9.9999997473787516355514526367188e-06;
    float _359 = fma(_189, _329, _353);
    float _361 = fma(_189, _327, _355);
    float _363 = _203 + 9.9999997473787516355514526367188e-06;
    float _365 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _367 = _359 * _357;
    float _369 = fma(_291, _345, 9.9999997473787516355514526367188e-06);
    float _371 = _359 * _363;
    float _373 = fma(_285, _345, 9.9999997473787516355514526367188e-06);
    float _375 = fma(_189, _331, _365);
    float _377 = fma(_361, _369, _367);
    float _379 = fma(_315, _351, 9.9999997473787516355514526367188e-06);
    float _381 = fma(_361, _373, _371);
    float _383 = fma(_309, _351, 9.9999997473787516355514526367188e-06);
    float _385 = fma(_375, _379, _377);
    float _387 = fma(_375, _383, _381);
    float _389 = _237 + _385;
    float _391 = _215 + _387;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _395 = _389 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _399 = _391 + _397;
    float _401 = _395 * _395;
    float _403 = _247 + 9.9999997473787516355514526367188e-06;
    float _405 = fma(_399, _399, _401);
    float _407 = _359 * _403;
    float _409 = fma(_281, _345, 9.9999997473787516355514526367188e-06);
    float _411 = sqrt(_405);
    float _413 = fma(_301, _351, 9.9999997473787516355514526367188e-06);
    float _415 = fma(_361, _409, _407);
    float _417 = fma(_375, _413, _415);
    float _419 = _259 + _417;
    float _421 = _419 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _423 = _411 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _425 = fma(_391, (*spvDescriptorSet0.vp_c4)._m0[2].x, _421);
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c4)._m0[2].z, _425);
    int _429 = _70 + 64;
    int _431 = _70 + 48;
    float _433 = _427 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _435 = _359;
    float _437 = _427;
    float _439 = _401;
    float _441 = _433;
    if (!_423)
    {
        _435 = _391;
    }
    float _443 = _435;
    float _445 = _443;
    if (!_423)
    {
        _437 = _389;
    }
    float _447 = _437;
    float _449 = _447;
    if (!_423)
    {
        _439 = _419;
    }
    float _451 = _439;
    bool _453 = !_423;
    float _455 = _451;
    if (!_453)
    {
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _461 = _411 + _459;
        float _463 = _419 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _465 = rsqrt(_405);
        float _467 = _461 * _457;
        float _469 = _467 * 0.15915493667125701904296875;
        float _471 = _469 * 6.283185482025146484375;
        float _473 = cos(_471);
        float _475 = _469 * 6.283185482025146484375;
        float _477 = sin(_475);
        float _479 = _473 + (-1.0);
        float _481 = _479 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _483 = fma(_477, _463, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _485 = fma(_419, _473, _481);
        float _487 = _465 * _483;
        float _489 = _485 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _491 = fma(_399, _487, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _493 = fma(_395, _487, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _495 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[2].x, _489);
        float _497 = fma(_493, (*spvDescriptorSet0.vp_c4)._m0[2].z, _495);
        float _499 = _497 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _455 = _485;
        _445 = _491;
        _449 = _493;
        _441 = _499;
    }
    float _501 = _455;
    float _503 = _445;
    float _505 = _449;
    float _507 = _441;
    float _509 = _501 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    uint _511 = uint(int(uint(_429) >> uint(2)));
    float _513 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_511)]);
    int _515 = _431 + 8;
    uint _517 = uint(int(uint(_515) >> uint(2)));
    float _519 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_517)]);
    float _521 = _501 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _523 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[1].x, _509);
    float _525 = in.m_40.x;
    float _527 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[0].x, _521);
    float _529 = fma(_505, (*spvDescriptorSet0.vp_c4)._m0[1].z, _523);
    float _531 = in.m_40.y;
    float _533 = fma(_505, (*spvDescriptorSet0.vp_c4)._m0[0].z, _527);
    float _535 = _529 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _537 = _533 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _539 = _535 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _541 = _535 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _543 = _535 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _545 = _535 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _547 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[8].x, _539);
    float _549 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[7].x, _541);
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[9].x, _543);
    float _553 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[10].x, _545);
    float _555 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[8].z, _547);
    float _557 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[7].z, _549);
    float _559 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[9].z, _551);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[10].z, _553);
    float _563 = _557 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _565 = _555 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _567 = _559 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _569 = _561 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.x = _525;
    out.m_43.y = _531;
    out.gl_Position.x = _563;
    out.gl_Position.y = _565;
    out.gl_Position.z = _567;
    out.gl_Position.w = _569;
    out.m_45.w = _513;
    out.m_47.z = _519;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _159 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = as_type<float>(int(gl_InstanceIndex));
    float _63 = as_type<float>(int(gl_BaseInstance));
    int _66 = as_type<int>(_61) - as_type<int>(_63);
    int _68 = _66 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _70 = _68 * 80;
    int _72 = _70 + 28;
    int _74 = _70 + 12;
    int _76 = _70 + 44;
    uint _79 = uint(int(uint(_72) >> uint(2)));
    float _81 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_79)]);
    uint _83 = uint(int(uint(_74) >> uint(2)));
    float _85 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_83)]);
    uint _87 = uint(int(uint(_76) >> uint(2)));
    float _89 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_87)]);
    float _91 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _93 = _81 + _91;
    float _95 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _97 = _85 + _95;
    float _99 = _93 * _93;
    float _101 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _103 = _89 + _101;
    float _105 = fma(_97, _97, _99);
    float _107 = fma(_103, _103, _105);
    float _109 = sqrt(_107);
    bool _113 = _109 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _115 = isnan(_109);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _121 = _117 || _119;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = 1.0;
    }
    float _125 = _123;
    bool _127 = !_121;
    float _129 = _125;
    if (!_127)
    {
        bool _131 = _109 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _133 = isnan(_109);
        bool _135 = _131 || _133;
        bool _137 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _139 = _135 || _137;
        if (!_139)
        {
            float _141 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _143 = _109 + _141;
            float _145 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _147 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _145;
            float _149 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _151 = _149 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _153 = 1.0 / _147;
            float _155 = _143 * _153;
            float _157 = fma(_155, _151, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _129 = _157;
            _159 = true;
        }
        else
        {
            bool _161 = _109 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _163 = isnan(_109);
            bool _165 = _161 || _163;
            bool _167 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _169 = _165 || _167;
            if (!_169)
            {
                float _171 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _173 = _109 + _171;
                float _175 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _177 = _175 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _179 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _181 = _179 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _183 = 1.0 / _177;
                float _185 = _173 * _183;
                float _187 = fma(_185, _181, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _129 = _187;
                _159 = true;
            }
            else
            {
                _129 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _159 = false;
    float _189 = _129;
    int _191 = _70 + 32;
    int _193 = _70 + 16;
    uint _195 = uint(int(uint(_70) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_195)];
    float _197 = as_type<float>(_dmw0.x);
    int _199 = _70 + 4;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>(_dmw0.y);
    int _205 = _70 + 8;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>(_dmw0.z);
    int _211 = _70 + 12;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    float _215 = as_type<float>(_dmw0.w);
    uint _217 = uint(int(uint(_191) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_217)];
    float _219 = as_type<float>(_dmw2.x);
    int _221 = _191 + 4;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>(_dmw2.y);
    int _227 = _191 + 8;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>(_dmw2.z);
    int _233 = _191 + 12;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    float _237 = as_type<float>(_dmw2.w);
    uint _239 = uint(int(uint(_193) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_239)];
    float _241 = as_type<float>(_dmw1.x);
    int _243 = _193 + 4;
    uint _245 = uint(int(uint(_243) >> uint(2)));
    float _247 = as_type<float>(_dmw1.y);
    int _249 = _193 + 8;
    uint _251 = uint(int(uint(_249) >> uint(2)));
    float _253 = as_type<float>(_dmw1.z);
    int _255 = _193 + 12;
    uint _257 = uint(int(uint(_255) >> uint(2)));
    float _259 = as_type<float>(_dmw1.w);
    float _261 = -_215;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _265 = -_237;
    float _267 = _265 + (*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _269 = -_259;
    float _271 = _269 + (*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _273 = _203 * _267;
    float _275 = _247 * _263;
    float _277 = _225 * _271;
    float _279 = -_273;
    float _281 = fma(_225, _263, _279);
    float _283 = -_277;
    float _285 = fma(_247, _267, _283);
    float _287 = _281 * _281;
    float _289 = -_275;
    float _291 = fma(_203, _271, _289);
    float _293 = _225 * _285;
    float _295 = fma(_285, _285, _287);
    float _297 = _247 * _291;
    float _299 = -_293;
    float _301 = fma(_203, _291, _299);
    float _303 = fma(_291, _291, _295);
    float _305 = _203 * _281;
    float _307 = -_297;
    float _309 = fma(_225, _281, _307);
    float _311 = _301 * _301;
    float _313 = -_305;
    float _315 = fma(_247, _285, _313);
    float _317 = fma(_309, _309, _311);
    float _319 = 1.0 / _303;
    float _321 = fma(_315, _315, _317);
    float _323 = _241 * _241;
    float _325 = _253 * _253;
    float _327 = in.m_38.x;
    float _329 = in.m_38.y;
    float _331 = in.m_38.z;
    float _333 = 1.0 / _321;
    float _335 = fma(_197, _197, _323);
    float _337 = fma(_209, _209, _325);
    float _339 = fma(_219, _219, _335);
    float _341 = fma(_231, _231, _337);
    float _343 = _339 * _319;
    float _345 = sqrt(_343);
    float _347 = _341 * _333;
    float _349 = _189 + (-1.0);
    float _351 = sqrt(_347);
    float _353 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _355 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _357 = _225 + 9.9999997473787516355514526367188e-06;
    float _359 = fma(_189, _329, _353);
    float _361 = fma(_189, _327, _355);
    float _363 = _203 + 9.9999997473787516355514526367188e-06;
    float _365 = _349 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _367 = _359 * _357;
    float _369 = fma(_291, _345, 9.9999997473787516355514526367188e-06);
    float _371 = _359 * _363;
    float _373 = fma(_285, _345, 9.9999997473787516355514526367188e-06);
    float _375 = fma(_189, _331, _365);
    float _377 = fma(_361, _369, _367);
    float _379 = fma(_315, _351, 9.9999997473787516355514526367188e-06);
    float _381 = fma(_361, _373, _371);
    float _383 = fma(_309, _351, 9.9999997473787516355514526367188e-06);
    float _385 = fma(_375, _379, _377);
    float _387 = fma(_375, _383, _381);
    float _389 = _237 + _385;
    float _391 = _215 + _387;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _395 = _389 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _399 = _391 + _397;
    float _401 = _395 * _395;
    float _403 = _247 + 9.9999997473787516355514526367188e-06;
    float _405 = fma(_399, _399, _401);
    float _407 = _359 * _403;
    float _409 = fma(_281, _345, 9.9999997473787516355514526367188e-06);
    float _411 = sqrt(_405);
    float _413 = fma(_301, _351, 9.9999997473787516355514526367188e-06);
    float _415 = fma(_361, _409, _407);
    float _417 = fma(_375, _413, _415);
    float _419 = _259 + _417;
    float _421 = _419 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _423 = _411 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _425 = fma(_391, (*spvDescriptorSet0.vp_c4)._m0[2].x, _421);
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c4)._m0[2].z, _425);
    int _429 = _70 + 64;
    int _431 = _70 + 48;
    float _433 = _427 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _435 = _359;
    float _437 = _427;
    float _439 = _401;
    float _441 = _433;
    if (!_423)
    {
        _435 = _391;
    }
    float _443 = _435;
    float _445 = _443;
    if (!_423)
    {
        _437 = _389;
    }
    float _447 = _437;
    float _449 = _447;
    if (!_423)
    {
        _439 = _419;
    }
    float _451 = _439;
    bool _453 = !_423;
    float _455 = _451;
    if (!_453)
    {
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _461 = _411 + _459;
        float _463 = _419 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _465 = rsqrt(_405);
        float _467 = _461 * _457;
        float _469 = _467 * 0.15915493667125701904296875;
        float _471 = _469 * 6.283185482025146484375;
        float _473 = cos(_471);
        float _475 = _469 * 6.283185482025146484375;
        float _477 = sin(_475);
        float _479 = _473 + (-1.0);
        float _481 = _479 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _483 = fma(_477, _463, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _485 = fma(_419, _473, _481);
        float _487 = _465 * _483;
        float _489 = _485 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _491 = fma(_399, _487, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _493 = fma(_395, _487, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _495 = fma(_491, (*spvDescriptorSet0.vp_c4)._m0[2].x, _489);
        float _497 = fma(_493, (*spvDescriptorSet0.vp_c4)._m0[2].z, _495);
        float _499 = _497 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _455 = _485;
        _445 = _491;
        _449 = _493;
        _441 = _499;
    }
    float _501 = _455;
    float _503 = _445;
    float _505 = _449;
    float _507 = _441;
    float _509 = _501 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    uint _511 = uint(int(uint(_429) >> uint(2)));
    float _513 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_511)]);
    int _515 = _431 + 8;
    uint _517 = uint(int(uint(_515) >> uint(2)));
    float _519 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_517)]);
    float _521 = _501 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _523 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[1].x, _509);
    float _525 = in.m_40.x;
    float _527 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[0].x, _521);
    float _529 = fma(_505, (*spvDescriptorSet0.vp_c4)._m0[1].z, _523);
    float _531 = in.m_40.y;
    float _533 = fma(_505, (*spvDescriptorSet0.vp_c4)._m0[0].z, _527);
    float _535 = _529 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _537 = _533 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _539 = _535 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _541 = _535 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _543 = _535 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _545 = _535 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _547 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[8].x, _539);
    float _549 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[7].x, _541);
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[9].x, _543);
    float _553 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[10].x, _545);
    float _555 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[8].z, _547);
    float _557 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[7].z, _549);
    float _559 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[9].z, _551);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c4)._m0[10].z, _553);
    float _563 = _557 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _565 = _555 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _567 = _559 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _569 = _561 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.x = _525;
    out.m_43.y = _531;
    out.gl_Position.x = _563;
    out.gl_Position.y = _565;
    out.gl_Position.z = _567;
    out.gl_Position.w = _569;
    out.m_45.w = _513;
    out.m_47.z = _519;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

