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
    constant _16* vp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_31 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
    float4 m_24 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _117 = false;
    bool _93 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_24.x;
    float _51 = in.m_24.y;
    bool _55 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 3;
    float _57 = _45 * 2.0;
    float _59 = _47 * 2.0;
    float _61 = fma(_49, 2.0, -1.0);
    float _63 = fma(_51, 2.0, -1.0);
    out.gl_Position.x = _57;
    out.gl_Position.y = _59;
    bool _65 = !_55;
    float _67 = _63;
    float _69 = (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _71 = _61;
    float _73 = _63;
    float _75 = _61;
    float _77 = _49;
    float _79 = (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _81 = _61;
    float _103;
    float _105;
    float _107;
    float _109;
    float _111;
    float _113;
    float _115;
    if (!_65)
    {
        bool _83 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 4;
        bool _85 = !_83;
        if (!_85)
        {
            bool _87 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 5;
            bool _89 = !_87;
            if (!_89)
            {
                bool _91 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) != 5;
                _93 = _91;
                if (!_93)
                {
                    float _95 = -_63;
                    float _97 = (-0.0) + _95;
                    float _99 = -_61;
                    float _101 = (-0.0) + _99;
                    _103 = 0.0;
                    _105 = -2.0;
                    _107 = 0.0;
                    _109 = -2.0;
                    _111 = 0.0;
                    _81 = _101;
                    _113 = _97;
                    _115 = -1.0;
                    _117 = true;
                }
            }
            else
            {
                float _119 = -_63;
                float _121 = (-0.0) + _119;
                _103 = 0.0;
                _105 = -2.0;
                _107 = 0.0;
                _109 = 2.0;
                _111 = 0.0;
                _113 = _121;
                _115 = 1.0;
                _117 = true;
            }
        }
        else
        {
            float _123 = -_63;
            float _125 = (-0.0) + _123;
            _103 = 0.0;
            _105 = 0.0;
            _107 = 0.0;
            _109 = 2.0;
            _111 = -2.0;
            _113 = -1.0;
            _115 = _125;
            _117 = true;
        }
    }
    if ((!_117) || _93)
    {
        bool _129;
        if (!_93)
        {
            bool _127 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 1;
            _129 = !_127;
        }
        if ((!_129) && (!_93))
        {
            bool _131 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 2;
            float _133 = 0.0;
            _103 = 0.0;
            if (_131)
            {
                _133 = 1.0;
            }
            float _135 = _133;
            float _137 = _135;
            if (!_131)
            {
                float _139 = -_63;
                float _141 = (-0.0) + _139;
                _137 = _141;
            }
            float _143 = _137;
            _113 = _143;
            if (!_131)
            {
                _67 = _61;
            }
            float _145 = _67;
            float _147 = 0.0;
            _115 = _145;
            if (_131)
            {
                _147 = 0.0;
            }
            float _149 = _147;
            float _151 = 0.0;
            float _153 = _149;
            if (_131)
            {
                _151 = 2.0;
            }
            float _155 = _151;
            float _157 = 0.0;
            float _159 = _155;
            if (_131)
            {
                _157 = 0.0;
            }
            float _161 = _157;
            float _163 = _161;
            if (_131)
            {
                _69 = 2.0;
            }
            float _165 = _69;
            float _167 = _165;
            if (!_131)
            {
                _71 = -1.0;
            }
            float _169 = _71;
            _81 = _169;
            if (!_131)
            {
                _159 = 0.0;
            }
            float _171 = _159;
            _109 = _171;
            if (!_131)
            {
                _163 = 2.0;
            }
            float _173 = _163;
            _107 = _173;
            if (!_131)
            {
                _153 = -2.0;
            }
            float _175 = _153;
            _105 = _175;
            if (!_131)
            {
                _167 = 0.0;
            }
            float _177 = _167;
            _111 = _177;
            _117 = true;
        }
        else
        {
            bool _213;
            if (!_93)
            {
                bool _179 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z);
                float _181 = 0.0;
                if (!_179)
                {
                    float _183 = -_63;
                    float _185 = (-0.0) + _183;
                    _181 = _185;
                }
                float _187 = _181;
                _113 = _187;
                if (!_179)
                {
                    float _189 = -_61;
                    float _191 = (-0.0) + _189;
                    _73 = _191;
                }
                float _193 = _73;
                _115 = _193;
                if (!_179)
                {
                    _75 = 1.0;
                }
                float _195 = _75;
                _81 = _195;
                if (!_179)
                {
                    _77 = 0.0;
                }
                float _197 = _77;
                float _199 = 0.0;
                _103 = _197;
                if (!_179)
                {
                    _199 = 0.0;
                }
                float _201 = _199;
                float _203 = 0.0;
                _109 = _201;
                if (!_179)
                {
                    _203 = -2.0;
                }
                float _205 = _203;
                float _207 = 0.0;
                _107 = _205;
                if (!_179)
                {
                    _207 = -2.0;
                }
                float _209 = _207;
                _105 = _209;
                if (!_179)
                {
                    _79 = 0.0;
                }
                float _211 = _79;
                _213 = !_179;
                _111 = _211;
            }
            if ((!_213) || _93)
            {
                _93 = false;
                _103 = as_type<float>(0x7fc00000u /* nan */);
                _105 = as_type<float>(0x7fc00000u /* nan */);
                _107 = as_type<float>(0x7fc00000u /* nan */);
                _109 = as_type<float>(0x7fc00000u /* nan */);
                _111 = as_type<float>(0x7fc00000u /* nan */);
                _81 = 0.0;
                _113 = 0.0;
                _115 = 0.0;
            }
        }
    }
    _117 = false;
    float _215 = _103;
    float _217 = _105;
    float _219 = _107;
    float _221 = _109;
    float _223 = _111;
    float _225 = _81;
    float _227 = _113;
    float _229 = _115;
    float _231 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _233 = _215 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _235 = _217 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _237 = _219 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _239 = _221 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _241 = _215 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _243 = _233 + _235;
    float _245 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _247 = _239 + _241;
    float _249 = -_215;
    bool _251 = _221 != _249;
    bool _253 = isnan(_221);
    bool _255 = _251 || _253;
    bool _257 = isnan(_249);
    bool _259 = _255 || _257;
    out.m_27.x = _239;
    out.m_27.y = _233;
    out.m_27.z = _237;
    float _261 = _231 + (-0.001000000047497451305389404296875);
    float _263 = abs(_243);
    float _265 = 1.0 / _263;
    float _267 = _245 + (-0.001000000047497451305389404296875);
    float _269 = ceil(_261);
    float _271 = ceil(_267);
    float _273 = fma(_265, 0.5, -0.001000000047497451305389404296875);
    float _275 = abs(_247);
    float _277 = 1.0 / _275;
    float _279 = _223 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _281 = _237 + _279;
    out.m_29.x = _241;
    out.m_29.y = _235;
    out.m_29.z = _279;
    float _283 = fma(_271, 0.25, 0.75);
    float _285 = fma(_269, 0.25, 0.75);
    float _287 = abs(_281);
    float _289 = 1.0 / _287;
    float _291 = _269 + 3.0;
    float _293 = _271 + 3.0;
    float _295 = fma(_277, 0.5, -0.001000000047497451305389404296875);
    float _297 = floor(_285);
    float _299 = floor(_283);
    float _301 = fma(_289, 0.5, -0.001000000047497451305389404296875);
    float _303 = fma(_297, -4.0, _291);
    float _305 = ceil(_273);
    float _307 = _303 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _309 = _307 * 0.5;
    float _311 = fma(_299, -4.0, _293);
    float _313 = ceil(_301);
    float _315 = _309 * _215;
    float _317 = _309 * _217;
    float _319 = _311 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _321 = _319 * 0.5;
    float _323 = _309 * _223;
    float _325 = fma(_321, _221, _315);
    float _327 = ceil(_295);
    float _329 = fma(_321, _215, _317);
    float _331 = fma(_321, _219, _323);
    float _333 = -_325;
    float _335 = _333 + _225;
    float _337 = abs(_243);
    float _339 = _337 * _305;
    float _341 = _339 * 2.0;
    float _343 = -_329;
    float _345 = _343 + _227;
    float _347 = -_331;
    float _349 = _347 + _229;
    float _351 = abs(_281);
    float _353 = _351 * _313;
    float _355 = _353 * 2.0;
    int _358 = as_type<int>(_235);
    int _360 = as_type<int>(_241);
    int _362 = as_type<int>(_279);
    if (!_259)
    {
        float _364 = _345 * _341;
        _358 = as_type<int>(_364);
    }
    int _366 = _358;
    int _368 = _366;
    int _370 = _366;
    if (!_259)
    {
        _360 = as_type<int>(_335);
    }
    int _372 = _360;
    int _374 = _372;
    int _376 = _372;
    if (!_259)
    {
        float _378 = _349 * _355;
        _362 = as_type<int>(_378);
    }
    int _380 = _362;
    float _382 = abs(_247);
    float _384 = _382 * _327;
    float _386 = _384 * 2.0;
    bool _388 = !_259;
    int _390 = _380;
    int _392 = _380;
    if (!_388)
    {
        float _394 = -_217;
        bool _396 = _215 != _394;
        bool _398 = isnan(_215);
        bool _400 = _396 || _398;
        bool _402 = isnan(_394);
        bool _404 = _400 || _402;
        if (!_404)
        {
            float _406 = _349 * _355;
            _390 = as_type<int>(_406);
        }
        int _408 = _390;
        int _410 = _408;
        _392 = _408;
        if (!_404)
        {
            float _412 = _335 * _386;
            _374 = as_type<int>(_412);
        }
        int _414 = _374;
        int _416 = _414;
        _376 = _414;
        if (!_404)
        {
            _368 = as_type<int>(_345);
        }
        int _418 = _368;
        bool _420 = !_404;
        int _422 = _418;
        _370 = _418;
        if (!_420)
        {
            float _424 = -_223;
            bool _426 = _219 != _424;
            bool _428 = isnan(_219);
            bool _430 = _426 || _428;
            bool _432 = isnan(_424);
            bool _434 = _430 || _432;
            if (_434)
            {
                _416 = as_type<int>(_335);
            }
            int _436 = _416;
            int _438 = _436;
            if (!_434)
            {
                float _440 = _335 * _386;
                _438 = as_type<int>(_440);
            }
            int _442 = _438;
            _376 = _442;
            if (_434)
            {
                _422 = as_type<int>(_345);
            }
            int _444 = _422;
            int _446 = _444;
            if (!_434)
            {
                float _448 = _345 * _341;
                _446 = as_type<int>(_448);
            }
            int _450 = _446;
            _370 = _450;
            if (_434)
            {
                _410 = as_type<int>(_349);
            }
            int _452 = _410;
            _392 = _452;
            if (!_434)
            {
                _392 = as_type<int>(_349);
            }
        }
    }
    int _454 = _376;
    int _456 = _370;
    int _458 = _392;
    out.m_31.x = as_type<float>(_454);
    out.m_31.y = as_type<float>(_456);
    out.m_31.z = as_type<float>(_458);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _117 = false;
    bool _93 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_24.x;
    float _51 = in.m_24.y;
    bool _55 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 3;
    float _57 = _45 * 2.0;
    float _59 = _47 * 2.0;
    float _61 = fma(_49, 2.0, -1.0);
    float _63 = fma(_51, 2.0, -1.0);
    out.gl_Position.x = _57;
    out.gl_Position.y = _59;
    bool _65 = !_55;
    float _67 = _63;
    float _69 = (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _71 = _61;
    float _73 = _63;
    float _75 = _61;
    float _77 = _49;
    float _79 = (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _81 = _61;
    float _103;
    float _105;
    float _107;
    float _109;
    float _111;
    float _113;
    float _115;
    if (!_65)
    {
        bool _83 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 4;
        bool _85 = !_83;
        if (!_85)
        {
            bool _87 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 5;
            bool _89 = !_87;
            if (!_89)
            {
                bool _91 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) != 5;
                _93 = _91;
                if (!_93)
                {
                    float _95 = -_63;
                    float _97 = (-0.0) + _95;
                    float _99 = -_61;
                    float _101 = (-0.0) + _99;
                    _103 = 0.0;
                    _105 = -2.0;
                    _107 = 0.0;
                    _109 = -2.0;
                    _111 = 0.0;
                    _81 = _101;
                    _113 = _97;
                    _115 = -1.0;
                    _117 = true;
                }
            }
            else
            {
                float _119 = -_63;
                float _121 = (-0.0) + _119;
                _103 = 0.0;
                _105 = -2.0;
                _107 = 0.0;
                _109 = 2.0;
                _111 = 0.0;
                _113 = _121;
                _115 = 1.0;
                _117 = true;
            }
        }
        else
        {
            float _123 = -_63;
            float _125 = (-0.0) + _123;
            _103 = 0.0;
            _105 = 0.0;
            _107 = 0.0;
            _109 = 2.0;
            _111 = -2.0;
            _113 = -1.0;
            _115 = _125;
            _117 = true;
        }
    }
    if ((!_117) || _93)
    {
        bool _129;
        if (!_93)
        {
            bool _127 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 1;
            _129 = !_127;
        }
        if ((!_129) && (!_93))
        {
            bool _131 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 2;
            float _133 = 0.0;
            _103 = 0.0;
            if (_131)
            {
                _133 = 1.0;
            }
            float _135 = _133;
            float _137 = _135;
            if (!_131)
            {
                float _139 = -_63;
                float _141 = (-0.0) + _139;
                _137 = _141;
            }
            float _143 = _137;
            _113 = _143;
            if (!_131)
            {
                _67 = _61;
            }
            float _145 = _67;
            float _147 = 0.0;
            _115 = _145;
            if (_131)
            {
                _147 = 0.0;
            }
            float _149 = _147;
            float _151 = 0.0;
            float _153 = _149;
            if (_131)
            {
                _151 = 2.0;
            }
            float _155 = _151;
            float _157 = 0.0;
            float _159 = _155;
            if (_131)
            {
                _157 = 0.0;
            }
            float _161 = _157;
            float _163 = _161;
            if (_131)
            {
                _69 = 2.0;
            }
            float _165 = _69;
            float _167 = _165;
            if (!_131)
            {
                _71 = -1.0;
            }
            float _169 = _71;
            _81 = _169;
            if (!_131)
            {
                _159 = 0.0;
            }
            float _171 = _159;
            _109 = _171;
            if (!_131)
            {
                _163 = 2.0;
            }
            float _173 = _163;
            _107 = _173;
            if (!_131)
            {
                _153 = -2.0;
            }
            float _175 = _153;
            _105 = _175;
            if (!_131)
            {
                _167 = 0.0;
            }
            float _177 = _167;
            _111 = _177;
            _117 = true;
        }
        else
        {
            bool _213;
            if (!_93)
            {
                bool _179 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z);
                float _181 = 0.0;
                if (!_179)
                {
                    float _183 = -_63;
                    float _185 = (-0.0) + _183;
                    _181 = _185;
                }
                float _187 = _181;
                _113 = _187;
                if (!_179)
                {
                    float _189 = -_61;
                    float _191 = (-0.0) + _189;
                    _73 = _191;
                }
                float _193 = _73;
                _115 = _193;
                if (!_179)
                {
                    _75 = 1.0;
                }
                float _195 = _75;
                _81 = _195;
                if (!_179)
                {
                    _77 = 0.0;
                }
                float _197 = _77;
                float _199 = 0.0;
                _103 = _197;
                if (!_179)
                {
                    _199 = 0.0;
                }
                float _201 = _199;
                float _203 = 0.0;
                _109 = _201;
                if (!_179)
                {
                    _203 = -2.0;
                }
                float _205 = _203;
                float _207 = 0.0;
                _107 = _205;
                if (!_179)
                {
                    _207 = -2.0;
                }
                float _209 = _207;
                _105 = _209;
                if (!_179)
                {
                    _79 = 0.0;
                }
                float _211 = _79;
                _213 = !_179;
                _111 = _211;
            }
            if ((!_213) || _93)
            {
                _93 = false;
                _103 = as_type<float>(0x7fc00000u /* nan */);
                _105 = as_type<float>(0x7fc00000u /* nan */);
                _107 = as_type<float>(0x7fc00000u /* nan */);
                _109 = as_type<float>(0x7fc00000u /* nan */);
                _111 = as_type<float>(0x7fc00000u /* nan */);
                _81 = 0.0;
                _113 = 0.0;
                _115 = 0.0;
            }
        }
    }
    _117 = false;
    float _215 = _103;
    float _217 = _105;
    float _219 = _107;
    float _221 = _109;
    float _223 = _111;
    float _225 = _81;
    float _227 = _113;
    float _229 = _115;
    float _231 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _233 = _215 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _235 = _217 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _237 = _219 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _239 = _221 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _241 = _215 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _243 = _233 + _235;
    float _245 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _247 = _239 + _241;
    float _249 = -_215;
    bool _251 = _221 != _249;
    bool _253 = isnan(_221);
    bool _255 = _251 || _253;
    bool _257 = isnan(_249);
    bool _259 = _255 || _257;
    out.m_27.x = _239;
    out.m_27.y = _233;
    out.m_27.z = _237;
    float _261 = _231 + (-0.001000000047497451305389404296875);
    float _263 = abs(_243);
    float _265 = 1.0 / _263;
    float _267 = _245 + (-0.001000000047497451305389404296875);
    float _269 = ceil(_261);
    float _271 = ceil(_267);
    float _273 = fma(_265, 0.5, -0.001000000047497451305389404296875);
    float _275 = abs(_247);
    float _277 = 1.0 / _275;
    float _279 = _223 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _281 = _237 + _279;
    out.m_29.x = _241;
    out.m_29.y = _235;
    out.m_29.z = _279;
    float _283 = fma(_271, 0.25, 0.75);
    float _285 = fma(_269, 0.25, 0.75);
    float _287 = abs(_281);
    float _289 = 1.0 / _287;
    float _291 = _269 + 3.0;
    float _293 = _271 + 3.0;
    float _295 = fma(_277, 0.5, -0.001000000047497451305389404296875);
    float _297 = floor(_285);
    float _299 = floor(_283);
    float _301 = fma(_289, 0.5, -0.001000000047497451305389404296875);
    float _303 = fma(_297, -4.0, _291);
    float _305 = ceil(_273);
    float _307 = _303 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _309 = _307 * 0.5;
    float _311 = fma(_299, -4.0, _293);
    float _313 = ceil(_301);
    float _315 = _309 * _215;
    float _317 = _309 * _217;
    float _319 = _311 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _321 = _319 * 0.5;
    float _323 = _309 * _223;
    float _325 = fma(_321, _221, _315);
    float _327 = ceil(_295);
    float _329 = fma(_321, _215, _317);
    float _331 = fma(_321, _219, _323);
    float _333 = -_325;
    float _335 = _333 + _225;
    float _337 = abs(_243);
    float _339 = _337 * _305;
    float _341 = _339 * 2.0;
    float _343 = -_329;
    float _345 = _343 + _227;
    float _347 = -_331;
    float _349 = _347 + _229;
    float _351 = abs(_281);
    float _353 = _351 * _313;
    float _355 = _353 * 2.0;
    int _358 = as_type<int>(_235);
    int _360 = as_type<int>(_241);
    int _362 = as_type<int>(_279);
    if (!_259)
    {
        float _364 = _345 * _341;
        _358 = as_type<int>(_364);
    }
    int _366 = _358;
    int _368 = _366;
    int _370 = _366;
    if (!_259)
    {
        _360 = as_type<int>(_335);
    }
    int _372 = _360;
    int _374 = _372;
    int _376 = _372;
    if (!_259)
    {
        float _378 = _349 * _355;
        _362 = as_type<int>(_378);
    }
    int _380 = _362;
    float _382 = abs(_247);
    float _384 = _382 * _327;
    float _386 = _384 * 2.0;
    bool _388 = !_259;
    int _390 = _380;
    int _392 = _380;
    if (!_388)
    {
        float _394 = -_217;
        bool _396 = _215 != _394;
        bool _398 = isnan(_215);
        bool _400 = _396 || _398;
        bool _402 = isnan(_394);
        bool _404 = _400 || _402;
        if (!_404)
        {
            float _406 = _349 * _355;
            _390 = as_type<int>(_406);
        }
        int _408 = _390;
        int _410 = _408;
        _392 = _408;
        if (!_404)
        {
            float _412 = _335 * _386;
            _374 = as_type<int>(_412);
        }
        int _414 = _374;
        int _416 = _414;
        _376 = _414;
        if (!_404)
        {
            _368 = as_type<int>(_345);
        }
        int _418 = _368;
        bool _420 = !_404;
        int _422 = _418;
        _370 = _418;
        if (!_420)
        {
            float _424 = -_223;
            bool _426 = _219 != _424;
            bool _428 = isnan(_219);
            bool _430 = _426 || _428;
            bool _432 = isnan(_424);
            bool _434 = _430 || _432;
            if (_434)
            {
                _416 = as_type<int>(_335);
            }
            int _436 = _416;
            int _438 = _436;
            if (!_434)
            {
                float _440 = _335 * _386;
                _438 = as_type<int>(_440);
            }
            int _442 = _438;
            _376 = _442;
            if (_434)
            {
                _422 = as_type<int>(_345);
            }
            int _444 = _422;
            int _446 = _444;
            if (!_434)
            {
                float _448 = _345 * _341;
                _446 = as_type<int>(_448);
            }
            int _450 = _446;
            _370 = _450;
            if (_434)
            {
                _410 = as_type<int>(_349);
            }
            int _452 = _410;
            _392 = _452;
            if (!_434)
            {
                _392 = as_type<int>(_349);
            }
        }
    }
    int _454 = _376;
    int _456 = _370;
    int _458 = _392;
    out.m_31.x = as_type<float>(_454);
    out.m_31.y = as_type<float>(_456);
    out.m_31.z = as_type<float>(_458);
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    bool _117 = false;
    bool _93 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = in.m_24.x;
    float _51 = in.m_24.y;
    bool _55 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 3;
    float _57 = _45 * 2.0;
    float _59 = _47 * 2.0;
    float _61 = fma(_49, 2.0, -1.0);
    float _63 = fma(_51, 2.0, -1.0);
    out.gl_Position.x = _57;
    out.gl_Position.y = _59;
    bool _65 = !_55;
    float _67 = _63;
    float _69 = (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _71 = _61;
    float _73 = _63;
    float _75 = _61;
    float _77 = _49;
    float _79 = (*spvDescriptorSet0.vp_c3)._m0[1].z;
    float _81 = _61;
    float _103;
    float _105;
    float _107;
    float _109;
    float _111;
    float _113;
    float _115;
    if (!_65)
    {
        bool _83 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 4;
        bool _85 = !_83;
        if (!_85)
        {
            bool _87 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 5;
            bool _89 = !_87;
            if (!_89)
            {
                bool _91 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) != 5;
                _93 = _91;
                if (!_93)
                {
                    float _95 = -_63;
                    float _97 = (-0.0) + _95;
                    float _99 = -_61;
                    float _101 = (-0.0) + _99;
                    _103 = 0.0;
                    _105 = -2.0;
                    _107 = 0.0;
                    _109 = -2.0;
                    _111 = 0.0;
                    _81 = _101;
                    _113 = _97;
                    _115 = -1.0;
                    _117 = true;
                }
            }
            else
            {
                float _119 = -_63;
                float _121 = (-0.0) + _119;
                _103 = 0.0;
                _105 = -2.0;
                _107 = 0.0;
                _109 = 2.0;
                _111 = 0.0;
                _113 = _121;
                _115 = 1.0;
                _117 = true;
            }
        }
        else
        {
            float _123 = -_63;
            float _125 = (-0.0) + _123;
            _103 = 0.0;
            _105 = 0.0;
            _107 = 0.0;
            _109 = 2.0;
            _111 = -2.0;
            _113 = -1.0;
            _115 = _125;
            _117 = true;
        }
    }
    if ((!_117) || _93)
    {
        bool _129;
        if (!_93)
        {
            bool _127 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 1;
            _129 = !_127;
        }
        if ((!_129) && (!_93))
        {
            bool _131 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z) >= 2;
            float _133 = 0.0;
            _103 = 0.0;
            if (_131)
            {
                _133 = 1.0;
            }
            float _135 = _133;
            float _137 = _135;
            if (!_131)
            {
                float _139 = -_63;
                float _141 = (-0.0) + _139;
                _137 = _141;
            }
            float _143 = _137;
            _113 = _143;
            if (!_131)
            {
                _67 = _61;
            }
            float _145 = _67;
            float _147 = 0.0;
            _115 = _145;
            if (_131)
            {
                _147 = 0.0;
            }
            float _149 = _147;
            float _151 = 0.0;
            float _153 = _149;
            if (_131)
            {
                _151 = 2.0;
            }
            float _155 = _151;
            float _157 = 0.0;
            float _159 = _155;
            if (_131)
            {
                _157 = 0.0;
            }
            float _161 = _157;
            float _163 = _161;
            if (_131)
            {
                _69 = 2.0;
            }
            float _165 = _69;
            float _167 = _165;
            if (!_131)
            {
                _71 = -1.0;
            }
            float _169 = _71;
            _81 = _169;
            if (!_131)
            {
                _159 = 0.0;
            }
            float _171 = _159;
            _109 = _171;
            if (!_131)
            {
                _163 = 2.0;
            }
            float _173 = _163;
            _107 = _173;
            if (!_131)
            {
                _153 = -2.0;
            }
            float _175 = _153;
            _105 = _175;
            if (!_131)
            {
                _167 = 0.0;
            }
            float _177 = _167;
            _111 = _177;
            _117 = true;
        }
        else
        {
            bool _213;
            if (!_93)
            {
                bool _179 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[1].z);
                float _181 = 0.0;
                if (!_179)
                {
                    float _183 = -_63;
                    float _185 = (-0.0) + _183;
                    _181 = _185;
                }
                float _187 = _181;
                _113 = _187;
                if (!_179)
                {
                    float _189 = -_61;
                    float _191 = (-0.0) + _189;
                    _73 = _191;
                }
                float _193 = _73;
                _115 = _193;
                if (!_179)
                {
                    _75 = 1.0;
                }
                float _195 = _75;
                _81 = _195;
                if (!_179)
                {
                    _77 = 0.0;
                }
                float _197 = _77;
                float _199 = 0.0;
                _103 = _197;
                if (!_179)
                {
                    _199 = 0.0;
                }
                float _201 = _199;
                float _203 = 0.0;
                _109 = _201;
                if (!_179)
                {
                    _203 = -2.0;
                }
                float _205 = _203;
                float _207 = 0.0;
                _107 = _205;
                if (!_179)
                {
                    _207 = -2.0;
                }
                float _209 = _207;
                _105 = _209;
                if (!_179)
                {
                    _79 = 0.0;
                }
                float _211 = _79;
                _213 = !_179;
                _111 = _211;
            }
            if ((!_213) || _93)
            {
                _93 = false;
                _103 = as_type<float>(0x7fc00000u /* nan */);
                _105 = as_type<float>(0x7fc00000u /* nan */);
                _107 = as_type<float>(0x7fc00000u /* nan */);
                _109 = as_type<float>(0x7fc00000u /* nan */);
                _111 = as_type<float>(0x7fc00000u /* nan */);
                _81 = 0.0;
                _113 = 0.0;
                _115 = 0.0;
            }
        }
    }
    _117 = false;
    float _215 = _103;
    float _217 = _105;
    float _219 = _107;
    float _221 = _109;
    float _223 = _111;
    float _225 = _81;
    float _227 = _113;
    float _229 = _115;
    float _231 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _233 = _215 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _235 = _217 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _237 = _219 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _239 = _221 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _241 = _215 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _243 = _233 + _235;
    float _245 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _247 = _239 + _241;
    float _249 = -_215;
    bool _251 = _221 != _249;
    bool _253 = isnan(_221);
    bool _255 = _251 || _253;
    bool _257 = isnan(_249);
    bool _259 = _255 || _257;
    out.m_27.x = _239;
    out.m_27.y = _233;
    out.m_27.z = _237;
    float _261 = _231 + (-0.001000000047497451305389404296875);
    float _263 = abs(_243);
    float _265 = 1.0 / _263;
    float _267 = _245 + (-0.001000000047497451305389404296875);
    float _269 = ceil(_261);
    float _271 = ceil(_267);
    float _273 = fma(_265, 0.5, -0.001000000047497451305389404296875);
    float _275 = abs(_247);
    float _277 = 1.0 / _275;
    float _279 = _223 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _281 = _237 + _279;
    out.m_29.x = _241;
    out.m_29.y = _235;
    out.m_29.z = _279;
    float _283 = fma(_271, 0.25, 0.75);
    float _285 = fma(_269, 0.25, 0.75);
    float _287 = abs(_281);
    float _289 = 1.0 / _287;
    float _291 = _269 + 3.0;
    float _293 = _271 + 3.0;
    float _295 = fma(_277, 0.5, -0.001000000047497451305389404296875);
    float _297 = floor(_285);
    float _299 = floor(_283);
    float _301 = fma(_289, 0.5, -0.001000000047497451305389404296875);
    float _303 = fma(_297, -4.0, _291);
    float _305 = ceil(_273);
    float _307 = _303 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _309 = _307 * 0.5;
    float _311 = fma(_299, -4.0, _293);
    float _313 = ceil(_301);
    float _315 = _309 * _215;
    float _317 = _309 * _217;
    float _319 = _311 * (*spvDescriptorSet0.vp_c3)._m0[0].x;
    float _321 = _319 * 0.5;
    float _323 = _309 * _223;
    float _325 = fma(_321, _221, _315);
    float _327 = ceil(_295);
    float _329 = fma(_321, _215, _317);
    float _331 = fma(_321, _219, _323);
    float _333 = -_325;
    float _335 = _333 + _225;
    float _337 = abs(_243);
    float _339 = _337 * _305;
    float _341 = _339 * 2.0;
    float _343 = -_329;
    float _345 = _343 + _227;
    float _347 = -_331;
    float _349 = _347 + _229;
    float _351 = abs(_281);
    float _353 = _351 * _313;
    float _355 = _353 * 2.0;
    int _358 = as_type<int>(_235);
    int _360 = as_type<int>(_241);
    int _362 = as_type<int>(_279);
    if (!_259)
    {
        float _364 = _345 * _341;
        _358 = as_type<int>(_364);
    }
    int _366 = _358;
    int _368 = _366;
    int _370 = _366;
    if (!_259)
    {
        _360 = as_type<int>(_335);
    }
    int _372 = _360;
    int _374 = _372;
    int _376 = _372;
    if (!_259)
    {
        float _378 = _349 * _355;
        _362 = as_type<int>(_378);
    }
    int _380 = _362;
    float _382 = abs(_247);
    float _384 = _382 * _327;
    float _386 = _384 * 2.0;
    bool _388 = !_259;
    int _390 = _380;
    int _392 = _380;
    if (!_388)
    {
        float _394 = -_217;
        bool _396 = _215 != _394;
        bool _398 = isnan(_215);
        bool _400 = _396 || _398;
        bool _402 = isnan(_394);
        bool _404 = _400 || _402;
        if (!_404)
        {
            float _406 = _349 * _355;
            _390 = as_type<int>(_406);
        }
        int _408 = _390;
        int _410 = _408;
        _392 = _408;
        if (!_404)
        {
            float _412 = _335 * _386;
            _374 = as_type<int>(_412);
        }
        int _414 = _374;
        int _416 = _414;
        _376 = _414;
        if (!_404)
        {
            _368 = as_type<int>(_345);
        }
        int _418 = _368;
        bool _420 = !_404;
        int _422 = _418;
        _370 = _418;
        if (!_420)
        {
            float _424 = -_223;
            bool _426 = _219 != _424;
            bool _428 = isnan(_219);
            bool _430 = _426 || _428;
            bool _432 = isnan(_424);
            bool _434 = _430 || _432;
            if (_434)
            {
                _416 = as_type<int>(_335);
            }
            int _436 = _416;
            int _438 = _436;
            if (!_434)
            {
                float _440 = _335 * _386;
                _438 = as_type<int>(_440);
            }
            int _442 = _438;
            _376 = _442;
            if (_434)
            {
                _422 = as_type<int>(_345);
            }
            int _444 = _422;
            int _446 = _444;
            if (!_434)
            {
                float _448 = _345 * _341;
                _446 = as_type<int>(_448);
            }
            int _450 = _446;
            _370 = _450;
            if (_434)
            {
                _410 = as_type<int>(_349);
            }
            int _452 = _410;
            _392 = _452;
            if (!_434)
            {
                _392 = as_type<int>(_349);
            }
        }
    }
    int _454 = _376;
    int _456 = _370;
    int _458 = _392;
    out.m_31.x = as_type<float>(_454);
    out.m_31.y = as_type<float>(_456);
    out.m_31.z = as_type<float>(_458);
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

