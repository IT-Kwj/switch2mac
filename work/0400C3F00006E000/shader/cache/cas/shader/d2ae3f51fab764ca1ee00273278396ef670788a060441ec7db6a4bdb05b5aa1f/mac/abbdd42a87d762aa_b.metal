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
    float4 m_27 [[user(locn1)]];
    float4 m_25 [[user(locn4)]];
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _291 = false;
    bool _134 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    bool _108 = !_106;
    float _110 = _65;
    float _112 = _85;
    float _114 = _65;
    float _116 = _85;
    float _118 = _87;
    bool _124;
    float _128;
    float _132;
    if (!_108)
    {
        int _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _122 = _120 != 0;
        _124 = _122;
        if (_122)
        {
            _110 = _41;
        }
        float _126 = _110;
        _128 = _126;
        if (_122)
        {
            _112 = _43;
        }
        float _130 = _112;
        _132 = _130;
        _134 = _122;
        if (!_134)
        {
            float _136 = trunc(_41);
            int _138 = int(_136);
            float _140 = trunc(_43);
            int _142 = int(_140);
            int _144 = _142 << 1;
            int _146 = _144 + _138;
            int _148 = _146 * 16;
            bool _150 = _148 == 0;
            bool _152 = _148 == 16;
            bool _154 = _148 == 32;
            bool _156 = _148 == 48;
            float _158 = as_type<float>(_142);
            float _160 = as_type<float>(_148);
            if (_150)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _162 = _158;
            float _164 = _162;
            if (_150)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _166 = _160;
            float _168 = _166;
            if (_152)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _170 = _164;
            float _172 = _170;
            if (_152)
            {
                _168 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _174 = _168;
            float _176 = _174;
            if (_154)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _178 = _176;
            float _180 = _178;
            if (_154)
            {
                _172 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _182 = _172;
            float _184 = _182;
            if (_156)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _186 = _184;
            _128 = _186;
            if (_156)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _188 = _180;
            _132 = _188;
            _134 = true;
        }
    }
    else
    {
        int _190 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _192 = _190 != 0;
        _124 = _192;
        if (_192)
        {
            _114 = _41;
        }
        float _194 = _114;
        _128 = _194;
        if (_192)
        {
            _116 = _43;
        }
        float _196 = _116;
        _132 = _196;
        if (!_192)
        {
            float _198 = trunc(_41);
            int _200 = int(_198);
            float _202 = trunc(_43);
            int _204 = int(_202);
            int _206 = _204 << 1;
            int _208 = _206 + _200;
            int _210 = _208 * 16;
            uint _213 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _215 = _210 == 0;
            bool _217 = _210 == 16;
            bool _219 = _210 == 32;
            bool _221 = _210 == 48;
            int _223 = int(_213) & 15;
            float _225 = as_type<float>(_210);
            float _227 = as_type<float>(_223);
            if (_215)
            {
                _225 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _229 = _225;
            float _231 = _229;
            if (_215)
            {
                _118 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _233 = _118;
            bool _235 = _223 != 13;
            float _237 = _233;
            if (_217)
            {
                _237 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _239 = _237;
            float _241 = _239;
            if (_219)
            {
                _241 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _243 = _241;
            float _245 = _243;
            if (_221)
            {
                _245 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _247 = _245;
            if (_217)
            {
                _231 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _249 = _231;
            float _251 = _249;
            if (_219)
            {
                _251 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _253 = _251;
            float _255 = _253;
            if (_221)
            {
                _255 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _257 = _255;
            _128 = _257;
            if (!_235)
            {
                _227 = _247;
            }
            float _259 = _227;
            _132 = _259;
            if (_235)
            {
                _132 = _247;
            }
        }
    }
    _134 = false;
    float _261 = _128;
    float _263 = _132;
    bool _265 = _124;
    bool _267 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _269 = !_267;
    float _271 = _261;
    float _273 = _263;
    float _287;
    float _289;
    if (!_269)
    {
        float _275 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _277 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _279 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _275);
        float _281 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _277);
        float _283 = _279 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _285 = _281 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _287 = _285;
        _289 = _283;
        _291 = true;
    }
    else
    {
        int _293 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _295 = _293 != 0;
        _289 = _261;
        bool _297 = !_295;
        _287 = _263;
        if (!_297)
        {
            float _299 = _261;
            int _301 = as_type<int>(_261);
            bool _303 = !_265;
            float _305 = _263;
            float _307 = _263;
            if (!_303)
            {
                int _309 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _311 = _309 != 0;
                int _313 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _315 = _313 != 0;
                int _317 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _319 = _317 != 0;
                int _321 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _323 = _321 != 0;
                int _325 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _327 = _325 != 0;
                if (_311)
                {
                    _299 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _329 = _299;
                float _331 = _329;
                if (_311)
                {
                    _305 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _333 = _305;
                float _335 = _333;
                if (!_311)
                {
                    _331 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _337 = _331;
                if (!_311)
                {
                    _335 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _339 = _335;
                float _341 = _337 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _343 = _339 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_323)
                {
                    float _345 = _341 * _261;
                    _271 = _345;
                }
                float _347 = _271;
                float _349 = -_341;
                float _351 = _349 + 1.0;
                int _353 = as_type<int>(_347);
                if (_327)
                {
                    float _355 = _343 * _263;
                    _273 = _355;
                }
                float _357 = _273;
                float _359 = -_343;
                float _361 = _359 + 1.0;
                float _363 = _357;
                if (_315)
                {
                    float _365 = _347 + _351;
                    _353 = as_type<int>(_365);
                }
                int _367 = _353;
                if (_319)
                {
                    float _369 = _357 + _361;
                    _363 = _369;
                }
                float _371 = _363;
                _301 = _367;
                _307 = _371;
            }
            int _373 = _301;
            float _375 = _307;
            int _377 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _379 = _377 != 0;
            int _381 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _383 = _381 != 0;
            int _385 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _387 = _385 != 0;
            int _389 = _373;
            int _391 = as_type<int>(_375);
            if (_383)
            {
                float _393 = -as_type<float>(_373);
                float _395 = _393 + 1.0;
                _389 = as_type<int>(_395);
            }
            int _397 = _389;
            if (_387)
            {
                float _399 = -_375;
                float _401 = _399 + 1.0;
                _391 = as_type<int>(_401);
            }
            int _403 = _391;
            bool _405 = !_379;
            float _407 = _405 ? as_type<float>(_397) : as_type<float>(_403);
            bool _409 = !_379;
            float _411 = _409 ? as_type<float>(_403) : as_type<float>(_397);
            _287 = _411;
            _289 = _407;
        }
    }
    _291 = false;
    float _413 = _287;
    float _415 = _289;
    float _417 = _413 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _419 = _413 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.x = _41;
    out.m_25.y = _43;
    float _421 = fma(_415, (*spvDescriptorSet0.vp_c3)._m0[8].x, _417);
    float _423 = fma(_415, (*spvDescriptorSet0.vp_c3)._m0[7].x, _419);
    float _425 = _421 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _427 = _423 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _429 = -_425;
    float _431 = _429 + 1.0;
    out.m_27.x = _427;
    out.m_27.y = _431;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _291 = false;
    bool _134 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    bool _108 = !_106;
    float _110 = _65;
    float _112 = _85;
    float _114 = _65;
    float _116 = _85;
    float _118 = _87;
    bool _124;
    float _128;
    float _132;
    if (!_108)
    {
        int _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _122 = _120 != 0;
        _124 = _122;
        if (_122)
        {
            _110 = _41;
        }
        float _126 = _110;
        _128 = _126;
        if (_122)
        {
            _112 = _43;
        }
        float _130 = _112;
        _132 = _130;
        _134 = _122;
        if (!_134)
        {
            float _136 = trunc(_41);
            int _138 = int(_136);
            float _140 = trunc(_43);
            int _142 = int(_140);
            int _144 = _142 << 1;
            int _146 = _144 + _138;
            int _148 = _146 * 16;
            bool _150 = _148 == 0;
            bool _152 = _148 == 16;
            bool _154 = _148 == 32;
            bool _156 = _148 == 48;
            float _158 = as_type<float>(_142);
            float _160 = as_type<float>(_148);
            if (_150)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _162 = _158;
            float _164 = _162;
            if (_150)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _166 = _160;
            float _168 = _166;
            if (_152)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _170 = _164;
            float _172 = _170;
            if (_152)
            {
                _168 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _174 = _168;
            float _176 = _174;
            if (_154)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _178 = _176;
            float _180 = _178;
            if (_154)
            {
                _172 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _182 = _172;
            float _184 = _182;
            if (_156)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _186 = _184;
            _128 = _186;
            if (_156)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _188 = _180;
            _132 = _188;
            _134 = true;
        }
    }
    else
    {
        int _190 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _192 = _190 != 0;
        _124 = _192;
        if (_192)
        {
            _114 = _41;
        }
        float _194 = _114;
        _128 = _194;
        if (_192)
        {
            _116 = _43;
        }
        float _196 = _116;
        _132 = _196;
        if (!_192)
        {
            float _198 = trunc(_41);
            int _200 = int(_198);
            float _202 = trunc(_43);
            int _204 = int(_202);
            int _206 = _204 << 1;
            int _208 = _206 + _200;
            int _210 = _208 * 16;
            uint _213 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _215 = _210 == 0;
            bool _217 = _210 == 16;
            bool _219 = _210 == 32;
            bool _221 = _210 == 48;
            int _223 = int(_213) & 15;
            float _225 = as_type<float>(_210);
            float _227 = as_type<float>(_223);
            if (_215)
            {
                _225 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _229 = _225;
            float _231 = _229;
            if (_215)
            {
                _118 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _233 = _118;
            bool _235 = _223 != 13;
            float _237 = _233;
            if (_217)
            {
                _237 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _239 = _237;
            float _241 = _239;
            if (_219)
            {
                _241 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _243 = _241;
            float _245 = _243;
            if (_221)
            {
                _245 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _247 = _245;
            if (_217)
            {
                _231 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _249 = _231;
            float _251 = _249;
            if (_219)
            {
                _251 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _253 = _251;
            float _255 = _253;
            if (_221)
            {
                _255 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _257 = _255;
            _128 = _257;
            if (!_235)
            {
                _227 = _247;
            }
            float _259 = _227;
            _132 = _259;
            if (_235)
            {
                _132 = _247;
            }
        }
    }
    _134 = false;
    float _261 = _128;
    float _263 = _132;
    bool _265 = _124;
    bool _267 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _269 = !_267;
    float _271 = _261;
    float _273 = _263;
    float _287;
    float _289;
    if (!_269)
    {
        float _275 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _277 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _279 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _275);
        float _281 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _277);
        float _283 = _279 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _285 = _281 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _287 = _285;
        _289 = _283;
        _291 = true;
    }
    else
    {
        int _293 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _295 = _293 != 0;
        _289 = _261;
        bool _297 = !_295;
        _287 = _263;
        if (!_297)
        {
            float _299 = _261;
            int _301 = as_type<int>(_261);
            bool _303 = !_265;
            float _305 = _263;
            float _307 = _263;
            if (!_303)
            {
                int _309 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _311 = _309 != 0;
                int _313 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _315 = _313 != 0;
                int _317 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _319 = _317 != 0;
                int _321 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _323 = _321 != 0;
                int _325 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _327 = _325 != 0;
                if (_311)
                {
                    _299 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _329 = _299;
                float _331 = _329;
                if (_311)
                {
                    _305 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _333 = _305;
                float _335 = _333;
                if (!_311)
                {
                    _331 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _337 = _331;
                if (!_311)
                {
                    _335 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _339 = _335;
                float _341 = _337 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _343 = _339 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_323)
                {
                    float _345 = _341 * _261;
                    _271 = _345;
                }
                float _347 = _271;
                float _349 = -_341;
                float _351 = _349 + 1.0;
                int _353 = as_type<int>(_347);
                if (_327)
                {
                    float _355 = _343 * _263;
                    _273 = _355;
                }
                float _357 = _273;
                float _359 = -_343;
                float _361 = _359 + 1.0;
                float _363 = _357;
                if (_315)
                {
                    float _365 = _347 + _351;
                    _353 = as_type<int>(_365);
                }
                int _367 = _353;
                if (_319)
                {
                    float _369 = _357 + _361;
                    _363 = _369;
                }
                float _371 = _363;
                _301 = _367;
                _307 = _371;
            }
            int _373 = _301;
            float _375 = _307;
            int _377 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _379 = _377 != 0;
            int _381 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _383 = _381 != 0;
            int _385 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _387 = _385 != 0;
            int _389 = _373;
            int _391 = as_type<int>(_375);
            if (_383)
            {
                float _393 = -as_type<float>(_373);
                float _395 = _393 + 1.0;
                _389 = as_type<int>(_395);
            }
            int _397 = _389;
            if (_387)
            {
                float _399 = -_375;
                float _401 = _399 + 1.0;
                _391 = as_type<int>(_401);
            }
            int _403 = _391;
            bool _405 = !_379;
            float _407 = _405 ? as_type<float>(_397) : as_type<float>(_403);
            bool _409 = !_379;
            float _411 = _409 ? as_type<float>(_403) : as_type<float>(_397);
            _287 = _411;
            _289 = _407;
        }
    }
    _291 = false;
    float _413 = _287;
    float _415 = _289;
    float _417 = _413 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _419 = _413 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.x = _41;
    out.m_25.y = _43;
    float _421 = fma(_415, (*spvDescriptorSet0.vp_c3)._m0[8].x, _417);
    float _423 = fma(_415, (*spvDescriptorSet0.vp_c3)._m0[7].x, _419);
    float _425 = _421 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _427 = _423 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _429 = -_425;
    float _431 = _429 + 1.0;
    out.m_27.x = _427;
    out.m_27.y = _431;
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _291 = false;
    bool _134 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[33].y, (*spvDescriptorSet0.vp_c3)._m0[33].w);
    float _49 = fma(_41, (*spvDescriptorSet0.vp_c3)._m0[33].x, (*spvDescriptorSet0.vp_c3)._m0[33].z);
    float _51 = _47 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _55 = _47 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _57 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _51);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[4].x, _53);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _55);
    float _63 = _57 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _65 = _59 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _69 = _63 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _75 = _63 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].x, _75);
    float _85 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[1].z, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[2].z, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c3)._m0[3].z, _83);
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _99 = _91 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _95;
    out.gl_Position.z = _97;
    out.gl_Position.w = _99;
    int _102 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _106 = _102 != 0;
    bool _108 = !_106;
    float _110 = _65;
    float _112 = _85;
    float _114 = _65;
    float _116 = _85;
    float _118 = _87;
    bool _124;
    float _128;
    float _132;
    if (!_108)
    {
        int _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _122 = _120 != 0;
        _124 = _122;
        if (_122)
        {
            _110 = _41;
        }
        float _126 = _110;
        _128 = _126;
        if (_122)
        {
            _112 = _43;
        }
        float _130 = _112;
        _132 = _130;
        _134 = _122;
        if (!_134)
        {
            float _136 = trunc(_41);
            int _138 = int(_136);
            float _140 = trunc(_43);
            int _142 = int(_140);
            int _144 = _142 << 1;
            int _146 = _144 + _138;
            int _148 = _146 * 16;
            bool _150 = _148 == 0;
            bool _152 = _148 == 16;
            bool _154 = _148 == 32;
            bool _156 = _148 == 48;
            float _158 = as_type<float>(_142);
            float _160 = as_type<float>(_148);
            if (_150)
            {
                _158 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _162 = _158;
            float _164 = _162;
            if (_150)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _166 = _160;
            float _168 = _166;
            if (_152)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _170 = _164;
            float _172 = _170;
            if (_152)
            {
                _168 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _174 = _168;
            float _176 = _174;
            if (_154)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _178 = _176;
            float _180 = _178;
            if (_154)
            {
                _172 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _182 = _172;
            float _184 = _182;
            if (_156)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _186 = _184;
            _128 = _186;
            if (_156)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _188 = _180;
            _132 = _188;
            _134 = true;
        }
    }
    else
    {
        int _190 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _192 = _190 != 0;
        _124 = _192;
        if (_192)
        {
            _114 = _41;
        }
        float _194 = _114;
        _128 = _194;
        if (_192)
        {
            _116 = _43;
        }
        float _196 = _116;
        _132 = _196;
        if (!_192)
        {
            float _198 = trunc(_41);
            int _200 = int(_198);
            float _202 = trunc(_43);
            int _204 = int(_202);
            int _206 = _204 << 1;
            int _208 = _206 + _200;
            int _210 = _208 * 16;
            uint _213 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _215 = _210 == 0;
            bool _217 = _210 == 16;
            bool _219 = _210 == 32;
            bool _221 = _210 == 48;
            int _223 = int(_213) & 15;
            float _225 = as_type<float>(_210);
            float _227 = as_type<float>(_223);
            if (_215)
            {
                _225 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _229 = _225;
            float _231 = _229;
            if (_215)
            {
                _118 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _233 = _118;
            bool _235 = _223 != 13;
            float _237 = _233;
            if (_217)
            {
                _237 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _239 = _237;
            float _241 = _239;
            if (_219)
            {
                _241 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _243 = _241;
            float _245 = _243;
            if (_221)
            {
                _245 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _247 = _245;
            if (_217)
            {
                _231 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _249 = _231;
            float _251 = _249;
            if (_219)
            {
                _251 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _253 = _251;
            float _255 = _253;
            if (_221)
            {
                _255 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _257 = _255;
            _128 = _257;
            if (!_235)
            {
                _227 = _247;
            }
            float _259 = _227;
            _132 = _259;
            if (_235)
            {
                _132 = _247;
            }
        }
    }
    _134 = false;
    float _261 = _128;
    float _263 = _132;
    bool _265 = _124;
    bool _267 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _269 = !_267;
    float _271 = _261;
    float _273 = _263;
    float _287;
    float _289;
    if (!_269)
    {
        float _275 = _47 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _277 = _47 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _279 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[14].x, _275);
        float _281 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[15].x, _277);
        float _283 = _279 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _285 = _281 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _287 = _285;
        _289 = _283;
        _291 = true;
    }
    else
    {
        int _293 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _295 = _293 != 0;
        _289 = _261;
        bool _297 = !_295;
        _287 = _263;
        if (!_297)
        {
            float _299 = _261;
            int _301 = as_type<int>(_261);
            bool _303 = !_265;
            float _305 = _263;
            float _307 = _263;
            if (!_303)
            {
                int _309 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _311 = _309 != 0;
                int _313 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _315 = _313 != 0;
                int _317 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _319 = _317 != 0;
                int _321 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _323 = _321 != 0;
                int _325 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _327 = _325 != 0;
                if (_311)
                {
                    _299 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _329 = _299;
                float _331 = _329;
                if (_311)
                {
                    _305 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _333 = _305;
                float _335 = _333;
                if (!_311)
                {
                    _331 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _337 = _331;
                if (!_311)
                {
                    _335 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _339 = _335;
                float _341 = _337 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _343 = _339 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_323)
                {
                    float _345 = _341 * _261;
                    _271 = _345;
                }
                float _347 = _271;
                float _349 = -_341;
                float _351 = _349 + 1.0;
                int _353 = as_type<int>(_347);
                if (_327)
                {
                    float _355 = _343 * _263;
                    _273 = _355;
                }
                float _357 = _273;
                float _359 = -_343;
                float _361 = _359 + 1.0;
                float _363 = _357;
                if (_315)
                {
                    float _365 = _347 + _351;
                    _353 = as_type<int>(_365);
                }
                int _367 = _353;
                if (_319)
                {
                    float _369 = _357 + _361;
                    _363 = _369;
                }
                float _371 = _363;
                _301 = _367;
                _307 = _371;
            }
            int _373 = _301;
            float _375 = _307;
            int _377 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _379 = _377 != 0;
            int _381 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _383 = _381 != 0;
            int _385 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _387 = _385 != 0;
            int _389 = _373;
            int _391 = as_type<int>(_375);
            if (_383)
            {
                float _393 = -as_type<float>(_373);
                float _395 = _393 + 1.0;
                _389 = as_type<int>(_395);
            }
            int _397 = _389;
            if (_387)
            {
                float _399 = -_375;
                float _401 = _399 + 1.0;
                _391 = as_type<int>(_401);
            }
            int _403 = _391;
            bool _405 = !_379;
            float _407 = _405 ? as_type<float>(_397) : as_type<float>(_403);
            bool _409 = !_379;
            float _411 = _409 ? as_type<float>(_403) : as_type<float>(_397);
            _287 = _411;
            _289 = _407;
        }
    }
    _291 = false;
    float _413 = _287;
    float _415 = _289;
    float _417 = _413 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _419 = _413 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.x = _41;
    out.m_25.y = _43;
    float _421 = fma(_415, (*spvDescriptorSet0.vp_c3)._m0[8].x, _417);
    float _423 = fma(_415, (*spvDescriptorSet0.vp_c3)._m0[7].x, _419);
    float _425 = _421 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _427 = _423 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _429 = -_425;
    float _431 = _429 + 1.0;
    out.m_27.x = _427;
    out.m_27.y = _431;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

