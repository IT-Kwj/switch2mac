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
    bool _329 = false;
    bool _128 = false;
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
    float _108 = _63;
    float _110 = _63;
    float _112 = _41;
    float _114 = _39;
    float _116 = _47;
    bool _122;
    float _126;
    if (!_106)
    {
        int _118 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _120 = _118 != 0;
        _122 = _120;
        if (_120)
        {
            _108 = 1.0;
        }
        float _124 = _108;
        _126 = _124;
        _128 = _120;
        if (!_128)
        {
            float _130 = trunc(_39);
            int _132 = int(_130);
            float _134 = trunc(_41);
            int _136 = int(_134);
            int _138 = _136 * 2;
            int _140 = _138 + _132;
            int _142 = _140 << 4;
            bool _144 = _142 == 0;
            bool _146 = _142 == 16;
            bool _148 = _142 == 32;
            bool _150 = _142 == 48;
            float _152 = as_type<float>(_132);
            float _154 = as_type<float>(_136);
            float _156 = as_type<float>(_142);
            if (_144)
            {
                _152 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _158 = _152;
            float _160 = _158;
            if (_144)
            {
                _154 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _162 = _154;
            float _164 = _162;
            if (_146)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _166 = _160;
            float _168 = _166;
            if (_144)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _170 = _156;
            float _172 = _170;
            if (_146)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _174 = _164;
            float _176 = _174;
            if (_146)
            {
                _172 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _178 = _172;
            float _180 = _178;
            if (_148)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _182 = _180;
            float _184 = _182;
            if (_148)
            {
                _168 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _186 = _168;
            float _188 = _186;
            if (_148)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _190 = _176;
            float _192 = _190;
            if (_150)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _194 = _188;
            _114 = _194;
            if (_150)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _196 = _192;
            _112 = _196;
            if (_150)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _198 = _184;
            _126 = _198;
            _128 = true;
        }
    }
    else
    {
        int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _202 = _200 != 0;
        _122 = _202;
        if (_202)
        {
            _110 = 1.0;
        }
        float _204 = _110;
        _126 = _204;
        if (!_202)
        {
            float _206 = trunc(_39);
            int _208 = int(_206);
            float _210 = trunc(_41);
            int _212 = int(_210);
            int _214 = _212 * 2;
            int _216 = _214 + _208;
            int _218 = _216 << 4;
            uint _221 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _223 = _218 == 0;
            bool _225 = _218 == 16;
            bool _227 = _218 == 32;
            bool _229 = _218 == 48;
            int _231 = int(_221) & 15;
            float _233 = as_type<float>(_208);
            float _235 = as_type<float>(_212);
            float _237 = as_type<float>(_218);
            float _239 = as_type<float>(_231);
            if (_223)
            {
                _233 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _241 = _233;
            float _243 = _241;
            if (_223)
            {
                _235 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _245 = _235;
            float _247 = _245;
            if (_225)
            {
                _243 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _249 = _243;
            float _251 = _249;
            if (_223)
            {
                _237 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _253 = _237;
            bool _255 = _231 != 13;
            float _257 = _253;
            if (_225)
            {
                _257 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _259 = _257;
            float _261 = _259;
            if (_227)
            {
                _261 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _263 = _261;
            float _265 = _263;
            if (_229)
            {
                _265 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _267 = _265;
            if (_225)
            {
                _247 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _269 = _247;
            float _271 = _269;
            if (_227)
            {
                _251 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _273 = _251;
            float _275 = _273;
            if (_227)
            {
                _271 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _277 = _271;
            _112 = _277;
            if (_229)
            {
                _275 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _279 = _275;
            _114 = _279;
            if (!_255)
            {
                _239 = _267;
            }
            float _281 = _239;
            float _283 = _281;
            if (_255)
            {
                _283 = _267;
            }
            float _285 = _283;
            _126 = _285;
            if (_229)
            {
                _112 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
        }
    }
    _128 = false;
    float _287 = _112;
    float _289 = _114;
    float _291 = _126;
    bool _293 = _122;
    bool _295 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _297 = !_295;
    float _299 = _289;
    float _301 = _289;
    float _303 = _287;
    float _323;
    int _325;
    float _327;
    if (!_297)
    {
        float _305 = _45 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _307 = _45 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _309 = _45 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _311 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].x, _305);
        float _313 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].x, _307);
        float _315 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[17].x, _309);
        float _317 = _311 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _319 = _313 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _321 = _315 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _323 = _319;
        _325 = as_type<int>(_321);
        _327 = _317;
        _329 = true;
    }
    else
    {
        int _331 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _333 = _331 != 0;
        if (!_333)
        {
            _116 = _289;
        }
        float _335 = _116;
        _327 = _335;
        if (!_333)
        {
            _299 = _291;
        }
        float _337 = _299;
        float _339 = _337;
        _325 = as_type<int>(_337);
        bool _341 = !_333;
        float _343 = _287;
        _323 = _287;
        if (!_341)
        {
            if (!_293)
            {
                _343 = _289;
            }
            float _345 = _343;
            float _347 = _345;
            float _349 = _345;
            if (!_293)
            {
                _339 = _287;
            }
            float _351 = _339;
            bool _353 = !_293;
            float _355 = _351;
            int _357 = as_type<int>(_351);
            if (!_353)
            {
                int _359 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _361 = _359 != 0;
                int _363 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _365 = _363 != 0;
                int _367 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _369 = _367 != 0;
                int _371 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _373 = _371 != 0;
                int _375 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _377 = _375 != 0;
                if (_361)
                {
                    _355 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _379 = _355;
                float _381 = _379;
                if (_361)
                {
                    _347 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _383 = _347;
                float _385 = _383;
                if (!_361)
                {
                    _385 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _387 = _385;
                if (!_361)
                {
                    _381 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _389 = _381;
                float _391 = _387 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _393 = _389 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_373)
                {
                    float _395 = _391 * _289;
                    _301 = _395;
                }
                float _397 = _301;
                float _399 = -_391;
                float _401 = _399 + 1.0;
                float _403 = _397;
                if (_377)
                {
                    float _405 = _393 * _287;
                    _303 = _405;
                }
                float _407 = _303;
                float _409 = -_393;
                float _411 = _409 + 1.0;
                int _413 = as_type<int>(_407);
                if (_365)
                {
                    float _415 = _397 + _401;
                    _403 = _415;
                }
                float _417 = _403;
                if (_369)
                {
                    float _419 = _407 + _411;
                    _413 = as_type<int>(_419);
                }
                int _421 = _413;
                _357 = _421;
                _349 = _417;
            }
            int _423 = _357;
            float _425 = _349;
            int _427 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _429 = _427 != 0;
            int _431 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _433 = _431 != 0;
            int _435 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _437 = _435 != 0;
            int _439 = as_type<int>(_425);
            int _441 = _423;
            _325 = as_type<int>(_291);
            if (_433)
            {
                float _443 = -_425;
                float _445 = _443 + 1.0;
                _439 = as_type<int>(_445);
            }
            int _447 = _439;
            if (_437)
            {
                float _449 = -as_type<float>(_423);
                float _451 = _449 + 1.0;
                _441 = as_type<int>(_451);
            }
            int _453 = _441;
            bool _455 = !_429;
            float _457 = _455 ? as_type<float>(_447) : as_type<float>(_453);
            bool _459 = !_429;
            float _461 = _459 ? as_type<float>(_453) : as_type<float>(_447);
            _323 = _461;
            _327 = _457;
        }
    }
    _329 = false;
    float _463 = _323;
    int _465 = _325;
    float _467 = _327;
    float _469 = _463 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _471 = _463 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.w = as_type<float>(_465);
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c3)._m0[8].x, _469);
    float _475 = fma(_467, (*spvDescriptorSet0.vp_c3)._m0[7].x, _471);
    float _477 = _473 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _479 = _475 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _481 = -_477;
    float _483 = _481 + 1.0;
    out.m_25.x = _479;
    out.m_25.y = _483;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _329 = false;
    bool _128 = false;
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
    float _108 = _63;
    float _110 = _63;
    float _112 = _41;
    float _114 = _39;
    float _116 = _47;
    bool _122;
    float _126;
    if (!_106)
    {
        int _118 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _120 = _118 != 0;
        _122 = _120;
        if (_120)
        {
            _108 = 1.0;
        }
        float _124 = _108;
        _126 = _124;
        _128 = _120;
        if (!_128)
        {
            float _130 = trunc(_39);
            int _132 = int(_130);
            float _134 = trunc(_41);
            int _136 = int(_134);
            int _138 = _136 * 2;
            int _140 = _138 + _132;
            int _142 = _140 << 4;
            bool _144 = _142 == 0;
            bool _146 = _142 == 16;
            bool _148 = _142 == 32;
            bool _150 = _142 == 48;
            float _152 = as_type<float>(_132);
            float _154 = as_type<float>(_136);
            float _156 = as_type<float>(_142);
            if (_144)
            {
                _152 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _158 = _152;
            float _160 = _158;
            if (_144)
            {
                _154 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _162 = _154;
            float _164 = _162;
            if (_146)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _166 = _160;
            float _168 = _166;
            if (_144)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _170 = _156;
            float _172 = _170;
            if (_146)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _174 = _164;
            float _176 = _174;
            if (_146)
            {
                _172 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _178 = _172;
            float _180 = _178;
            if (_148)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _182 = _180;
            float _184 = _182;
            if (_148)
            {
                _168 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _186 = _168;
            float _188 = _186;
            if (_148)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _190 = _176;
            float _192 = _190;
            if (_150)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _194 = _188;
            _114 = _194;
            if (_150)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _196 = _192;
            _112 = _196;
            if (_150)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _198 = _184;
            _126 = _198;
            _128 = true;
        }
    }
    else
    {
        int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _202 = _200 != 0;
        _122 = _202;
        if (_202)
        {
            _110 = 1.0;
        }
        float _204 = _110;
        _126 = _204;
        if (!_202)
        {
            float _206 = trunc(_39);
            int _208 = int(_206);
            float _210 = trunc(_41);
            int _212 = int(_210);
            int _214 = _212 * 2;
            int _216 = _214 + _208;
            int _218 = _216 << 4;
            uint _221 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _223 = _218 == 0;
            bool _225 = _218 == 16;
            bool _227 = _218 == 32;
            bool _229 = _218 == 48;
            int _231 = int(_221) & 15;
            float _233 = as_type<float>(_208);
            float _235 = as_type<float>(_212);
            float _237 = as_type<float>(_218);
            float _239 = as_type<float>(_231);
            if (_223)
            {
                _233 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _241 = _233;
            float _243 = _241;
            if (_223)
            {
                _235 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _245 = _235;
            float _247 = _245;
            if (_225)
            {
                _243 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _249 = _243;
            float _251 = _249;
            if (_223)
            {
                _237 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _253 = _237;
            bool _255 = _231 != 13;
            float _257 = _253;
            if (_225)
            {
                _257 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _259 = _257;
            float _261 = _259;
            if (_227)
            {
                _261 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _263 = _261;
            float _265 = _263;
            if (_229)
            {
                _265 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _267 = _265;
            if (_225)
            {
                _247 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _269 = _247;
            float _271 = _269;
            if (_227)
            {
                _251 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _273 = _251;
            float _275 = _273;
            if (_227)
            {
                _271 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _277 = _271;
            _112 = _277;
            if (_229)
            {
                _275 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _279 = _275;
            _114 = _279;
            if (!_255)
            {
                _239 = _267;
            }
            float _281 = _239;
            float _283 = _281;
            if (_255)
            {
                _283 = _267;
            }
            float _285 = _283;
            _126 = _285;
            if (_229)
            {
                _112 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
        }
    }
    _128 = false;
    float _287 = _112;
    float _289 = _114;
    float _291 = _126;
    bool _293 = _122;
    bool _295 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _297 = !_295;
    float _299 = _289;
    float _301 = _289;
    float _303 = _287;
    float _323;
    int _325;
    float _327;
    if (!_297)
    {
        float _305 = _45 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _307 = _45 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _309 = _45 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _311 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].x, _305);
        float _313 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].x, _307);
        float _315 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[17].x, _309);
        float _317 = _311 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _319 = _313 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _321 = _315 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _323 = _319;
        _325 = as_type<int>(_321);
        _327 = _317;
        _329 = true;
    }
    else
    {
        int _331 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _333 = _331 != 0;
        if (!_333)
        {
            _116 = _289;
        }
        float _335 = _116;
        _327 = _335;
        if (!_333)
        {
            _299 = _291;
        }
        float _337 = _299;
        float _339 = _337;
        _325 = as_type<int>(_337);
        bool _341 = !_333;
        float _343 = _287;
        _323 = _287;
        if (!_341)
        {
            if (!_293)
            {
                _343 = _289;
            }
            float _345 = _343;
            float _347 = _345;
            float _349 = _345;
            if (!_293)
            {
                _339 = _287;
            }
            float _351 = _339;
            bool _353 = !_293;
            float _355 = _351;
            int _357 = as_type<int>(_351);
            if (!_353)
            {
                int _359 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _361 = _359 != 0;
                int _363 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _365 = _363 != 0;
                int _367 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _369 = _367 != 0;
                int _371 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _373 = _371 != 0;
                int _375 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _377 = _375 != 0;
                if (_361)
                {
                    _355 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _379 = _355;
                float _381 = _379;
                if (_361)
                {
                    _347 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _383 = _347;
                float _385 = _383;
                if (!_361)
                {
                    _385 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _387 = _385;
                if (!_361)
                {
                    _381 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _389 = _381;
                float _391 = _387 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _393 = _389 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_373)
                {
                    float _395 = _391 * _289;
                    _301 = _395;
                }
                float _397 = _301;
                float _399 = -_391;
                float _401 = _399 + 1.0;
                float _403 = _397;
                if (_377)
                {
                    float _405 = _393 * _287;
                    _303 = _405;
                }
                float _407 = _303;
                float _409 = -_393;
                float _411 = _409 + 1.0;
                int _413 = as_type<int>(_407);
                if (_365)
                {
                    float _415 = _397 + _401;
                    _403 = _415;
                }
                float _417 = _403;
                if (_369)
                {
                    float _419 = _407 + _411;
                    _413 = as_type<int>(_419);
                }
                int _421 = _413;
                _357 = _421;
                _349 = _417;
            }
            int _423 = _357;
            float _425 = _349;
            int _427 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _429 = _427 != 0;
            int _431 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _433 = _431 != 0;
            int _435 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _437 = _435 != 0;
            int _439 = as_type<int>(_425);
            int _441 = _423;
            _325 = as_type<int>(_291);
            if (_433)
            {
                float _443 = -_425;
                float _445 = _443 + 1.0;
                _439 = as_type<int>(_445);
            }
            int _447 = _439;
            if (_437)
            {
                float _449 = -as_type<float>(_423);
                float _451 = _449 + 1.0;
                _441 = as_type<int>(_451);
            }
            int _453 = _441;
            bool _455 = !_429;
            float _457 = _455 ? as_type<float>(_447) : as_type<float>(_453);
            bool _459 = !_429;
            float _461 = _459 ? as_type<float>(_453) : as_type<float>(_447);
            _323 = _461;
            _327 = _457;
        }
    }
    _329 = false;
    float _463 = _323;
    int _465 = _325;
    float _467 = _327;
    float _469 = _463 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _471 = _463 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.w = as_type<float>(_465);
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c3)._m0[8].x, _469);
    float _475 = fma(_467, (*spvDescriptorSet0.vp_c3)._m0[7].x, _471);
    float _477 = _473 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _479 = _475 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _481 = -_477;
    float _483 = _481 + 1.0;
    out.m_25.x = _479;
    out.m_25.y = _483;
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
    bool _329 = false;
    bool _128 = false;
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
    float _108 = _63;
    float _110 = _63;
    float _112 = _41;
    float _114 = _39;
    float _116 = _47;
    bool _122;
    float _126;
    if (!_106)
    {
        int _118 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _120 = _118 != 0;
        _122 = _120;
        if (_120)
        {
            _108 = 1.0;
        }
        float _124 = _108;
        _126 = _124;
        _128 = _120;
        if (!_128)
        {
            float _130 = trunc(_39);
            int _132 = int(_130);
            float _134 = trunc(_41);
            int _136 = int(_134);
            int _138 = _136 * 2;
            int _140 = _138 + _132;
            int _142 = _140 << 4;
            bool _144 = _142 == 0;
            bool _146 = _142 == 16;
            bool _148 = _142 == 32;
            bool _150 = _142 == 48;
            float _152 = as_type<float>(_132);
            float _154 = as_type<float>(_136);
            float _156 = as_type<float>(_142);
            if (_144)
            {
                _152 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _158 = _152;
            float _160 = _158;
            if (_144)
            {
                _154 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _162 = _154;
            float _164 = _162;
            if (_146)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _166 = _160;
            float _168 = _166;
            if (_144)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _170 = _156;
            float _172 = _170;
            if (_146)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _174 = _164;
            float _176 = _174;
            if (_146)
            {
                _172 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _178 = _172;
            float _180 = _178;
            if (_148)
            {
                _180 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _182 = _180;
            float _184 = _182;
            if (_148)
            {
                _168 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _186 = _168;
            float _188 = _186;
            if (_148)
            {
                _176 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _190 = _176;
            float _192 = _190;
            if (_150)
            {
                _188 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _194 = _188;
            _114 = _194;
            if (_150)
            {
                _192 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
            float _196 = _192;
            _112 = _196;
            if (_150)
            {
                _184 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _198 = _184;
            _126 = _198;
            _128 = true;
        }
    }
    else
    {
        int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _202 = _200 != 0;
        _122 = _202;
        if (_202)
        {
            _110 = 1.0;
        }
        float _204 = _110;
        _126 = _204;
        if (!_202)
        {
            float _206 = trunc(_39);
            int _208 = int(_206);
            float _210 = trunc(_41);
            int _212 = int(_210);
            int _214 = _212 * 2;
            int _216 = _214 + _208;
            int _218 = _216 << 4;
            uint _221 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w)) >> uint(8)));
            bool _223 = _218 == 0;
            bool _225 = _218 == 16;
            bool _227 = _218 == 32;
            bool _229 = _218 == 48;
            int _231 = int(_221) & 15;
            float _233 = as_type<float>(_208);
            float _235 = as_type<float>(_212);
            float _237 = as_type<float>(_218);
            float _239 = as_type<float>(_231);
            if (_223)
            {
                _233 = (*spvDescriptorSet0.vp_c3)._m0[14].x;
            }
            float _241 = _233;
            float _243 = _241;
            if (_223)
            {
                _235 = (*spvDescriptorSet0.vp_c3)._m0[14].y;
            }
            float _245 = _235;
            float _247 = _245;
            if (_225)
            {
                _243 = (*spvDescriptorSet0.vp_c3)._m0[15].x;
            }
            float _249 = _243;
            float _251 = _249;
            if (_223)
            {
                _237 = (*spvDescriptorSet0.vp_c3)._m0[14].w;
            }
            float _253 = _237;
            bool _255 = _231 != 13;
            float _257 = _253;
            if (_225)
            {
                _257 = (*spvDescriptorSet0.vp_c3)._m0[15].w;
            }
            float _259 = _257;
            float _261 = _259;
            if (_227)
            {
                _261 = (*spvDescriptorSet0.vp_c3)._m0[16].w;
            }
            float _263 = _261;
            float _265 = _263;
            if (_229)
            {
                _265 = (*spvDescriptorSet0.vp_c3)._m0[17].w;
            }
            float _267 = _265;
            if (_225)
            {
                _247 = (*spvDescriptorSet0.vp_c3)._m0[15].y;
            }
            float _269 = _247;
            float _271 = _269;
            if (_227)
            {
                _251 = (*spvDescriptorSet0.vp_c3)._m0[16].x;
            }
            float _273 = _251;
            float _275 = _273;
            if (_227)
            {
                _271 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
            }
            float _277 = _271;
            _112 = _277;
            if (_229)
            {
                _275 = (*spvDescriptorSet0.vp_c3)._m0[17].x;
            }
            float _279 = _275;
            _114 = _279;
            if (!_255)
            {
                _239 = _267;
            }
            float _281 = _239;
            float _283 = _281;
            if (_255)
            {
                _283 = _267;
            }
            float _285 = _283;
            _126 = _285;
            if (_229)
            {
                _112 = (*spvDescriptorSet0.vp_c3)._m0[17].y;
            }
        }
    }
    _128 = false;
    float _287 = _112;
    float _289 = _114;
    float _291 = _126;
    bool _293 = _122;
    bool _295 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    bool _297 = !_295;
    float _299 = _289;
    float _301 = _289;
    float _303 = _287;
    float _323;
    int _325;
    float _327;
    if (!_297)
    {
        float _305 = _45 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _307 = _45 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _309 = _45 * (*spvDescriptorSet0.vp_c3)._m0[17].y;
        float _311 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[14].x, _305);
        float _313 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[15].x, _307);
        float _315 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[17].x, _309);
        float _317 = _311 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _319 = _313 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        float _321 = _315 + (*spvDescriptorSet0.vp_c3)._m0[17].w;
        _323 = _319;
        _325 = as_type<int>(_321);
        _327 = _317;
        _329 = true;
    }
    else
    {
        int _331 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _333 = _331 != 0;
        if (!_333)
        {
            _116 = _289;
        }
        float _335 = _116;
        _327 = _335;
        if (!_333)
        {
            _299 = _291;
        }
        float _337 = _299;
        float _339 = _337;
        _325 = as_type<int>(_337);
        bool _341 = !_333;
        float _343 = _287;
        _323 = _287;
        if (!_341)
        {
            if (!_293)
            {
                _343 = _289;
            }
            float _345 = _343;
            float _347 = _345;
            float _349 = _345;
            if (!_293)
            {
                _339 = _287;
            }
            float _351 = _339;
            bool _353 = !_293;
            float _355 = _351;
            int _357 = as_type<int>(_351);
            if (!_353)
            {
                int _359 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _361 = _359 != 0;
                int _363 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _365 = _363 != 0;
                int _367 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _369 = _367 != 0;
                int _371 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _373 = _371 != 0;
                int _375 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _377 = _375 != 0;
                if (_361)
                {
                    _355 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _379 = _355;
                float _381 = _379;
                if (_361)
                {
                    _347 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _383 = _347;
                float _385 = _383;
                if (!_361)
                {
                    _385 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _387 = _385;
                if (!_361)
                {
                    _381 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _389 = _381;
                float _391 = _387 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _393 = _389 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_373)
                {
                    float _395 = _391 * _289;
                    _301 = _395;
                }
                float _397 = _301;
                float _399 = -_391;
                float _401 = _399 + 1.0;
                float _403 = _397;
                if (_377)
                {
                    float _405 = _393 * _287;
                    _303 = _405;
                }
                float _407 = _303;
                float _409 = -_393;
                float _411 = _409 + 1.0;
                int _413 = as_type<int>(_407);
                if (_365)
                {
                    float _415 = _397 + _401;
                    _403 = _415;
                }
                float _417 = _403;
                if (_369)
                {
                    float _419 = _407 + _411;
                    _413 = as_type<int>(_419);
                }
                int _421 = _413;
                _357 = _421;
                _349 = _417;
            }
            int _423 = _357;
            float _425 = _349;
            int _427 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _429 = _427 != 0;
            int _431 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _433 = _431 != 0;
            int _435 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _437 = _435 != 0;
            int _439 = as_type<int>(_425);
            int _441 = _423;
            _325 = as_type<int>(_291);
            if (_433)
            {
                float _443 = -_425;
                float _445 = _443 + 1.0;
                _439 = as_type<int>(_445);
            }
            int _447 = _439;
            if (_437)
            {
                float _449 = -as_type<float>(_423);
                float _451 = _449 + 1.0;
                _441 = as_type<int>(_451);
            }
            int _453 = _441;
            bool _455 = !_429;
            float _457 = _455 ? as_type<float>(_447) : as_type<float>(_453);
            bool _459 = !_429;
            float _461 = _459 ? as_type<float>(_453) : as_type<float>(_447);
            _323 = _461;
            _327 = _457;
        }
    }
    _329 = false;
    float _463 = _323;
    int _465 = _325;
    float _467 = _327;
    float _469 = _463 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _471 = _463 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_25.w = as_type<float>(_465);
    float _473 = fma(_467, (*spvDescriptorSet0.vp_c3)._m0[8].x, _469);
    float _475 = fma(_467, (*spvDescriptorSet0.vp_c3)._m0[7].x, _471);
    float _477 = _473 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _479 = _475 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _481 = -_477;
    float _483 = _481 + 1.0;
    out.m_25.x = _479;
    out.m_25.y = _483;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

