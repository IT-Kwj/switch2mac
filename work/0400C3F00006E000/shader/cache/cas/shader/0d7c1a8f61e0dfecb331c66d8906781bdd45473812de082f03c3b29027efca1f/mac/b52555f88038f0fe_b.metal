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
    float4 m_25 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _289 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = in.m_22.x;
    float _41 = in.m_22.y;
    float _43 = -_41;
    float _45 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _47 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _49 = _45 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _51 = _45 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _53 = _45 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _55 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[5].x, _49);
    float _57 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[4].x, _51);
    float _59 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _53);
    float _61 = _55 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _67 = _61 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _69 = _61 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _71 = _61 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _73 = _61 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _75 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[0].x, _67);
    float _77 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[1].x, _69);
    float _79 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[2].x, _71);
    float _81 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[3].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].z, _75);
    float _85 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].z, _77);
    float _87 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].z, _79);
    float _89 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].z, _81);
    float _91 = _83 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _91;
    out.gl_Position.y = _93;
    out.gl_Position.z = _95;
    out.gl_Position.w = _97;
    int _100 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _104 = _100 != 0;
    bool _106 = !_104;
    int _108 = as_type<int>(_83);
    int _110 = as_type<int>(_85);
    float _112 = _83;
    float _114 = _63;
    float _116 = _41;
    float _118 = _39;
    bool _124;
    float _187;
    float _189;
    if (!_106)
    {
        int _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _122 = _120 != 0;
        _124 = _122;
        if (!_122)
        {
            float _126 = trunc(_39);
            int _128 = int(_126);
            _108 = _128;
        }
        int _130 = _108;
        float _132 = _63;
        float _134 = as_type<float>(_130);
        if (!_122)
        {
            float _136 = trunc(_41);
            int _138 = int(_136);
            _132 = as_type<float>(_138);
        }
        float _140 = _132;
        float _142 = _140;
        if (!_122)
        {
            int _144 = as_type<int>(_140) << 1;
            int _146 = _144 + _130;
            _110 = _146;
        }
        int _148 = _110;
        uint _151 = uint(_148);
        if (_122)
        {
            _134 = _39;
        }
        float _153 = _134;
        if (_122)
        {
            _142 = _41;
        }
        float _155 = _142;
        if (!_122)
        {
            int _157 = _148 << 4;
            int _159 = _157 + 224;
            _151 = uint(_159);
        }
        uint _161 = _151;
        float _163 = _153;
        float _165 = _155;
        if (!_122)
        {
            uint _167 = uint(int(uint(int(_161)) >> uint(2)));
            uint _169 = uint(int(uint(int(_167)) >> uint(2)));
            int _171 = int(_167) & 3;
            float _173 = (*spvDescriptorSet0.vp_c3)._m0[int(_169)][_171];
            int _175 = int(_167) + 1;
            uint _177 = uint(int(uint(_175) >> uint(2)));
            int _179 = _175 & 3;
            float _181 = (*spvDescriptorSet0.vp_c3)._m0[int(_177)][_179];
            _163 = _173;
            _165 = _181;
        }
        float _183 = _163;
        float _185 = _165;
        _187 = _183;
        _189 = _185;
        _191 = true;
    }
    else
    {
        int _193 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _195 = _193 != 0;
        _124 = _195;
        if (_195)
        {
            _112 = _39;
        }
        float _197 = _112;
        _187 = _197;
        if (_195)
        {
            _114 = _41;
        }
        float _199 = _114;
        float _201 = _199;
        _189 = _199;
        if (!_195)
        {
            float _203 = trunc(_39);
            int _205 = int(_203);
            float _207 = trunc(_41);
            int _209 = int(_207);
            int _211 = _209 << 1;
            int _213 = _211 + _205;
            int _215 = _213 << 4;
            int _217 = _215 + 224;
            uint _219 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            uint _221 = uint(int(uint(_217) >> uint(2)));
            uint _223 = uint(int(uint(int(_221)) >> uint(2)));
            int _225 = int(_221) & 3;
            float _227 = (*spvDescriptorSet0.vp_c3)._m0[int(_223)][_225];
            int _229 = int(_221) + 1;
            uint _231 = uint(int(uint(_229) >> uint(2)));
            int _233 = _229 & 3;
            float _235 = (*spvDescriptorSet0.vp_c3)._m0[int(_231)][_233];
            int _237 = int(_219) & 15;
            bool _239 = _237 != 13;
            float _241 = as_type<float>(_237);
            _116 = as_type<float>(_209);
            _118 = as_type<float>(_205);
            if (!_239)
            {
                _241 = _227;
            }
            float _243 = _241;
            float _245 = _243;
            if (!_239)
            {
                _201 = _235;
            }
            float _247 = _201;
            _189 = _247;
            if (_239)
            {
                _245 = _227;
            }
            float _249 = _245;
            _187 = _249;
            if (_239)
            {
                _189 = _235;
            }
        }
    }
    _191 = false;
    float _251 = _187;
    float _253 = _189;
    bool _255 = _124;
    float _257 = _116;
    float _259 = _118;
    bool _261 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _263 = !_261;
    float _265 = _257;
    float _267 = _259;
    float _269 = _251;
    float _271 = _253;
    float _285;
    float _287;
    if (!_263)
    {
        float _273 = _45 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _275 = _45 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _277 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].x, _273);
        float _279 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].x, _275);
        float _281 = _277 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _283 = _279 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _285 = _283;
        _287 = _281;
        _289 = true;
    }
    else
    {
        int _291 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _293 = _291 != 0;
        if (!_293)
        {
            _265 = _251;
        }
        float _295 = _265;
        float _297 = _295;
        _287 = _295;
        if (!_293)
        {
            _267 = _253;
        }
        float _299 = _267;
        bool _301 = !_293;
        float _303 = _299;
        _285 = _299;
        if (!_301)
        {
            if (!_255)
            {
                _297 = _251;
            }
            float _305 = _297;
            float _307 = _305;
            int _309 = as_type<int>(_305);
            if (!_255)
            {
                _303 = _253;
            }
            float _311 = _303;
            bool _313 = !_255;
            float _315 = _311;
            float _317 = _311;
            if (!_313)
            {
                int _319 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _321 = _319 != 0;
                int _323 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _325 = _323 != 0;
                int _327 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _329 = _327 != 0;
                int _331 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _333 = _331 != 0;
                int _335 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _337 = _335 != 0;
                if (_321)
                {
                    _307 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _339 = _307;
                float _341 = _339;
                if (_321)
                {
                    _315 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _343 = _315;
                float _345 = _343;
                if (!_321)
                {
                    _341 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _347 = _341;
                if (!_321)
                {
                    _345 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _349 = _345;
                float _351 = _347 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _353 = _349 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_333)
                {
                    float _355 = _351 * _251;
                    _269 = _355;
                }
                float _357 = _269;
                float _359 = -_351;
                float _361 = _359 + 1.0;
                int _363 = as_type<int>(_357);
                if (_337)
                {
                    float _365 = _353 * _253;
                    _271 = _365;
                }
                float _367 = _271;
                float _369 = -_353;
                float _371 = _369 + 1.0;
                float _373 = _367;
                if (_325)
                {
                    float _375 = _357 + _361;
                    _363 = as_type<int>(_375);
                }
                int _377 = _363;
                if (_329)
                {
                    float _379 = _367 + _371;
                    _373 = _379;
                }
                float _381 = _373;
                _309 = _377;
                _317 = _381;
            }
            int _383 = _309;
            float _385 = _317;
            int _387 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _389 = _387 != 0;
            int _391 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _393 = _391 != 0;
            int _395 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _397 = _395 != 0;
            int _399 = _383;
            int _401 = as_type<int>(_385);
            if (_393)
            {
                float _403 = -as_type<float>(_383);
                float _405 = _403 + 1.0;
                _399 = as_type<int>(_405);
            }
            int _407 = _399;
            if (_397)
            {
                float _409 = -_385;
                float _411 = _409 + 1.0;
                _401 = as_type<int>(_411);
            }
            int _413 = _401;
            bool _415 = !_389;
            float _417 = _415 ? as_type<float>(_407) : as_type<float>(_413);
            bool _419 = !_389;
            float _421 = _419 ? as_type<float>(_413) : as_type<float>(_407);
            _285 = _421;
            _287 = _417;
        }
    }
    _289 = false;
    float _423 = _285;
    float _425 = _287;
    float _427 = _423 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _429 = _423 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _431 = fma(_425, (*spvDescriptorSet0.vp_c3)._m0[8].x, _427);
    float _433 = fma(_425, (*spvDescriptorSet0.vp_c3)._m0[7].x, _429);
    float _435 = _431 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _437 = _433 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _439 = -_435;
    float _441 = _439 + 1.0;
    out.m_25.x = _437;
    out.m_25.y = _441;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _289 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = in.m_22.x;
    float _41 = in.m_22.y;
    float _43 = -_41;
    float _45 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _47 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _49 = _45 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _51 = _45 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _53 = _45 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _55 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[5].x, _49);
    float _57 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[4].x, _51);
    float _59 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _53);
    float _61 = _55 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _67 = _61 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _69 = _61 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _71 = _61 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _73 = _61 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _75 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[0].x, _67);
    float _77 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[1].x, _69);
    float _79 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[2].x, _71);
    float _81 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[3].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].z, _75);
    float _85 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].z, _77);
    float _87 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].z, _79);
    float _89 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].z, _81);
    float _91 = _83 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _91;
    out.gl_Position.y = _93;
    out.gl_Position.z = _95;
    out.gl_Position.w = _97;
    int _100 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _104 = _100 != 0;
    bool _106 = !_104;
    int _108 = as_type<int>(_83);
    int _110 = as_type<int>(_85);
    float _112 = _83;
    float _114 = _63;
    float _116 = _41;
    float _118 = _39;
    bool _124;
    float _187;
    float _189;
    if (!_106)
    {
        int _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _122 = _120 != 0;
        _124 = _122;
        if (!_122)
        {
            float _126 = trunc(_39);
            int _128 = int(_126);
            _108 = _128;
        }
        int _130 = _108;
        float _132 = _63;
        float _134 = as_type<float>(_130);
        if (!_122)
        {
            float _136 = trunc(_41);
            int _138 = int(_136);
            _132 = as_type<float>(_138);
        }
        float _140 = _132;
        float _142 = _140;
        if (!_122)
        {
            int _144 = as_type<int>(_140) << 1;
            int _146 = _144 + _130;
            _110 = _146;
        }
        int _148 = _110;
        uint _151 = uint(_148);
        if (_122)
        {
            _134 = _39;
        }
        float _153 = _134;
        if (_122)
        {
            _142 = _41;
        }
        float _155 = _142;
        if (!_122)
        {
            int _157 = _148 << 4;
            int _159 = _157 + 224;
            _151 = uint(_159);
        }
        uint _161 = _151;
        float _163 = _153;
        float _165 = _155;
        if (!_122)
        {
            uint _167 = uint(int(uint(int(_161)) >> uint(2)));
            uint _169 = uint(int(uint(int(_167)) >> uint(2)));
            int _171 = int(_167) & 3;
            float _173 = (*spvDescriptorSet0.vp_c3)._m0[int(_169)][_171];
            int _175 = int(_167) + 1;
            uint _177 = uint(int(uint(_175) >> uint(2)));
            int _179 = _175 & 3;
            float _181 = (*spvDescriptorSet0.vp_c3)._m0[int(_177)][_179];
            _163 = _173;
            _165 = _181;
        }
        float _183 = _163;
        float _185 = _165;
        _187 = _183;
        _189 = _185;
        _191 = true;
    }
    else
    {
        int _193 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _195 = _193 != 0;
        _124 = _195;
        if (_195)
        {
            _112 = _39;
        }
        float _197 = _112;
        _187 = _197;
        if (_195)
        {
            _114 = _41;
        }
        float _199 = _114;
        float _201 = _199;
        _189 = _199;
        if (!_195)
        {
            float _203 = trunc(_39);
            int _205 = int(_203);
            float _207 = trunc(_41);
            int _209 = int(_207);
            int _211 = _209 << 1;
            int _213 = _211 + _205;
            int _215 = _213 << 4;
            int _217 = _215 + 224;
            uint _219 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            uint _221 = uint(int(uint(_217) >> uint(2)));
            uint _223 = uint(int(uint(int(_221)) >> uint(2)));
            int _225 = int(_221) & 3;
            float _227 = (*spvDescriptorSet0.vp_c3)._m0[int(_223)][_225];
            int _229 = int(_221) + 1;
            uint _231 = uint(int(uint(_229) >> uint(2)));
            int _233 = _229 & 3;
            float _235 = (*spvDescriptorSet0.vp_c3)._m0[int(_231)][_233];
            int _237 = int(_219) & 15;
            bool _239 = _237 != 13;
            float _241 = as_type<float>(_237);
            _116 = as_type<float>(_209);
            _118 = as_type<float>(_205);
            if (!_239)
            {
                _241 = _227;
            }
            float _243 = _241;
            float _245 = _243;
            if (!_239)
            {
                _201 = _235;
            }
            float _247 = _201;
            _189 = _247;
            if (_239)
            {
                _245 = _227;
            }
            float _249 = _245;
            _187 = _249;
            if (_239)
            {
                _189 = _235;
            }
        }
    }
    _191 = false;
    float _251 = _187;
    float _253 = _189;
    bool _255 = _124;
    float _257 = _116;
    float _259 = _118;
    bool _261 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _263 = !_261;
    float _265 = _257;
    float _267 = _259;
    float _269 = _251;
    float _271 = _253;
    float _285;
    float _287;
    if (!_263)
    {
        float _273 = _45 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _275 = _45 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _277 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].x, _273);
        float _279 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].x, _275);
        float _281 = _277 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _283 = _279 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _285 = _283;
        _287 = _281;
        _289 = true;
    }
    else
    {
        int _291 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _293 = _291 != 0;
        if (!_293)
        {
            _265 = _251;
        }
        float _295 = _265;
        float _297 = _295;
        _287 = _295;
        if (!_293)
        {
            _267 = _253;
        }
        float _299 = _267;
        bool _301 = !_293;
        float _303 = _299;
        _285 = _299;
        if (!_301)
        {
            if (!_255)
            {
                _297 = _251;
            }
            float _305 = _297;
            float _307 = _305;
            int _309 = as_type<int>(_305);
            if (!_255)
            {
                _303 = _253;
            }
            float _311 = _303;
            bool _313 = !_255;
            float _315 = _311;
            float _317 = _311;
            if (!_313)
            {
                int _319 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _321 = _319 != 0;
                int _323 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _325 = _323 != 0;
                int _327 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _329 = _327 != 0;
                int _331 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _333 = _331 != 0;
                int _335 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _337 = _335 != 0;
                if (_321)
                {
                    _307 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _339 = _307;
                float _341 = _339;
                if (_321)
                {
                    _315 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _343 = _315;
                float _345 = _343;
                if (!_321)
                {
                    _341 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _347 = _341;
                if (!_321)
                {
                    _345 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _349 = _345;
                float _351 = _347 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _353 = _349 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_333)
                {
                    float _355 = _351 * _251;
                    _269 = _355;
                }
                float _357 = _269;
                float _359 = -_351;
                float _361 = _359 + 1.0;
                int _363 = as_type<int>(_357);
                if (_337)
                {
                    float _365 = _353 * _253;
                    _271 = _365;
                }
                float _367 = _271;
                float _369 = -_353;
                float _371 = _369 + 1.0;
                float _373 = _367;
                if (_325)
                {
                    float _375 = _357 + _361;
                    _363 = as_type<int>(_375);
                }
                int _377 = _363;
                if (_329)
                {
                    float _379 = _367 + _371;
                    _373 = _379;
                }
                float _381 = _373;
                _309 = _377;
                _317 = _381;
            }
            int _383 = _309;
            float _385 = _317;
            int _387 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _389 = _387 != 0;
            int _391 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _393 = _391 != 0;
            int _395 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _397 = _395 != 0;
            int _399 = _383;
            int _401 = as_type<int>(_385);
            if (_393)
            {
                float _403 = -as_type<float>(_383);
                float _405 = _403 + 1.0;
                _399 = as_type<int>(_405);
            }
            int _407 = _399;
            if (_397)
            {
                float _409 = -_385;
                float _411 = _409 + 1.0;
                _401 = as_type<int>(_411);
            }
            int _413 = _401;
            bool _415 = !_389;
            float _417 = _415 ? as_type<float>(_407) : as_type<float>(_413);
            bool _419 = !_389;
            float _421 = _419 ? as_type<float>(_413) : as_type<float>(_407);
            _285 = _421;
            _287 = _417;
        }
    }
    _289 = false;
    float _423 = _285;
    float _425 = _287;
    float _427 = _423 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _429 = _423 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _431 = fma(_425, (*spvDescriptorSet0.vp_c3)._m0[8].x, _427);
    float _433 = fma(_425, (*spvDescriptorSet0.vp_c3)._m0[7].x, _429);
    float _435 = _431 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _437 = _433 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _439 = -_435;
    float _441 = _439 + 1.0;
    out.m_25.x = _437;
    out.m_25.y = _441;
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
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _289 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = in.m_22.x;
    float _41 = in.m_22.y;
    float _43 = -_41;
    float _45 = fma(_43, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _47 = fma(_39, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _49 = _45 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _51 = _45 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _53 = _45 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _55 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[5].x, _49);
    float _57 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[4].x, _51);
    float _59 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _53);
    float _61 = _55 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _67 = _61 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _69 = _61 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _71 = _61 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _73 = _61 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _75 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[0].x, _67);
    float _77 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[1].x, _69);
    float _79 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[2].x, _71);
    float _81 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[3].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].z, _75);
    float _85 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].z, _77);
    float _87 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].z, _79);
    float _89 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].z, _81);
    float _91 = _83 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _91;
    out.gl_Position.y = _93;
    out.gl_Position.z = _95;
    out.gl_Position.w = _97;
    int _100 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _104 = _100 != 0;
    bool _106 = !_104;
    int _108 = as_type<int>(_83);
    int _110 = as_type<int>(_85);
    float _112 = _83;
    float _114 = _63;
    float _116 = _41;
    float _118 = _39;
    bool _124;
    float _187;
    float _189;
    if (!_106)
    {
        int _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _122 = _120 != 0;
        _124 = _122;
        if (!_122)
        {
            float _126 = trunc(_39);
            int _128 = int(_126);
            _108 = _128;
        }
        int _130 = _108;
        float _132 = _63;
        float _134 = as_type<float>(_130);
        if (!_122)
        {
            float _136 = trunc(_41);
            int _138 = int(_136);
            _132 = as_type<float>(_138);
        }
        float _140 = _132;
        float _142 = _140;
        if (!_122)
        {
            int _144 = as_type<int>(_140) << 1;
            int _146 = _144 + _130;
            _110 = _146;
        }
        int _148 = _110;
        uint _151 = uint(_148);
        if (_122)
        {
            _134 = _39;
        }
        float _153 = _134;
        if (_122)
        {
            _142 = _41;
        }
        float _155 = _142;
        if (!_122)
        {
            int _157 = _148 << 4;
            int _159 = _157 + 224;
            _151 = uint(_159);
        }
        uint _161 = _151;
        float _163 = _153;
        float _165 = _155;
        if (!_122)
        {
            uint _167 = uint(int(uint(int(_161)) >> uint(2)));
            uint _169 = uint(int(uint(int(_167)) >> uint(2)));
            int _171 = int(_167) & 3;
            float _173 = (*spvDescriptorSet0.vp_c3)._m0[int(_169)][_171];
            int _175 = int(_167) + 1;
            uint _177 = uint(int(uint(_175) >> uint(2)));
            int _179 = _175 & 3;
            float _181 = (*spvDescriptorSet0.vp_c3)._m0[int(_177)][_179];
            _163 = _173;
            _165 = _181;
        }
        float _183 = _163;
        float _185 = _165;
        _187 = _183;
        _189 = _185;
        _191 = true;
    }
    else
    {
        int _193 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _195 = _193 != 0;
        _124 = _195;
        if (_195)
        {
            _112 = _39;
        }
        float _197 = _112;
        _187 = _197;
        if (_195)
        {
            _114 = _41;
        }
        float _199 = _114;
        float _201 = _199;
        _189 = _199;
        if (!_195)
        {
            float _203 = trunc(_39);
            int _205 = int(_203);
            float _207 = trunc(_41);
            int _209 = int(_207);
            int _211 = _209 << 1;
            int _213 = _211 + _205;
            int _215 = _213 << 4;
            int _217 = _215 + 224;
            uint _219 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            uint _221 = uint(int(uint(_217) >> uint(2)));
            uint _223 = uint(int(uint(int(_221)) >> uint(2)));
            int _225 = int(_221) & 3;
            float _227 = (*spvDescriptorSet0.vp_c3)._m0[int(_223)][_225];
            int _229 = int(_221) + 1;
            uint _231 = uint(int(uint(_229) >> uint(2)));
            int _233 = _229 & 3;
            float _235 = (*spvDescriptorSet0.vp_c3)._m0[int(_231)][_233];
            int _237 = int(_219) & 15;
            bool _239 = _237 != 13;
            float _241 = as_type<float>(_237);
            _116 = as_type<float>(_209);
            _118 = as_type<float>(_205);
            if (!_239)
            {
                _241 = _227;
            }
            float _243 = _241;
            float _245 = _243;
            if (!_239)
            {
                _201 = _235;
            }
            float _247 = _201;
            _189 = _247;
            if (_239)
            {
                _245 = _227;
            }
            float _249 = _245;
            _187 = _249;
            if (_239)
            {
                _189 = _235;
            }
        }
    }
    _191 = false;
    float _251 = _187;
    float _253 = _189;
    bool _255 = _124;
    float _257 = _116;
    float _259 = _118;
    bool _261 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _263 = !_261;
    float _265 = _257;
    float _267 = _259;
    float _269 = _251;
    float _271 = _253;
    float _285;
    float _287;
    if (!_263)
    {
        float _273 = _45 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _275 = _45 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _277 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].x, _273);
        float _279 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].x, _275);
        float _281 = _277 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _283 = _279 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _285 = _283;
        _287 = _281;
        _289 = true;
    }
    else
    {
        int _291 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _293 = _291 != 0;
        if (!_293)
        {
            _265 = _251;
        }
        float _295 = _265;
        float _297 = _295;
        _287 = _295;
        if (!_293)
        {
            _267 = _253;
        }
        float _299 = _267;
        bool _301 = !_293;
        float _303 = _299;
        _285 = _299;
        if (!_301)
        {
            if (!_255)
            {
                _297 = _251;
            }
            float _305 = _297;
            float _307 = _305;
            int _309 = as_type<int>(_305);
            if (!_255)
            {
                _303 = _253;
            }
            float _311 = _303;
            bool _313 = !_255;
            float _315 = _311;
            float _317 = _311;
            if (!_313)
            {
                int _319 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _321 = _319 != 0;
                int _323 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _325 = _323 != 0;
                int _327 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _329 = _327 != 0;
                int _331 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _333 = _331 != 0;
                int _335 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _337 = _335 != 0;
                if (_321)
                {
                    _307 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _339 = _307;
                float _341 = _339;
                if (_321)
                {
                    _315 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _343 = _315;
                float _345 = _343;
                if (!_321)
                {
                    _341 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _347 = _341;
                if (!_321)
                {
                    _345 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _349 = _345;
                float _351 = _347 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _353 = _349 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_333)
                {
                    float _355 = _351 * _251;
                    _269 = _355;
                }
                float _357 = _269;
                float _359 = -_351;
                float _361 = _359 + 1.0;
                int _363 = as_type<int>(_357);
                if (_337)
                {
                    float _365 = _353 * _253;
                    _271 = _365;
                }
                float _367 = _271;
                float _369 = -_353;
                float _371 = _369 + 1.0;
                float _373 = _367;
                if (_325)
                {
                    float _375 = _357 + _361;
                    _363 = as_type<int>(_375);
                }
                int _377 = _363;
                if (_329)
                {
                    float _379 = _367 + _371;
                    _373 = _379;
                }
                float _381 = _373;
                _309 = _377;
                _317 = _381;
            }
            int _383 = _309;
            float _385 = _317;
            int _387 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _389 = _387 != 0;
            int _391 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _393 = _391 != 0;
            int _395 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _397 = _395 != 0;
            int _399 = _383;
            int _401 = as_type<int>(_385);
            if (_393)
            {
                float _403 = -as_type<float>(_383);
                float _405 = _403 + 1.0;
                _399 = as_type<int>(_405);
            }
            int _407 = _399;
            if (_397)
            {
                float _409 = -_385;
                float _411 = _409 + 1.0;
                _401 = as_type<int>(_411);
            }
            int _413 = _401;
            bool _415 = !_389;
            float _417 = _415 ? as_type<float>(_407) : as_type<float>(_413);
            bool _419 = !_389;
            float _421 = _419 ? as_type<float>(_413) : as_type<float>(_407);
            _285 = _421;
            _287 = _417;
        }
    }
    _289 = false;
    float _423 = _285;
    float _425 = _287;
    float _427 = _423 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _429 = _423 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _431 = fma(_425, (*spvDescriptorSet0.vp_c3)._m0[8].x, _427);
    float _433 = fma(_425, (*spvDescriptorSet0.vp_c3)._m0[7].x, _429);
    float _435 = _431 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _437 = _433 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _439 = -_435;
    float _441 = _439 + 1.0;
    out.m_25.x = _437;
    out.m_25.y = _441;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

