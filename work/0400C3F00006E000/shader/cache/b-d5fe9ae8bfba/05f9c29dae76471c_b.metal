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
    float4 m_25 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad0 [[user(locn0)]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad0 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _262 = false;
    bool _120 = false;
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
    float _67 = _61 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _69 = _61 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _61 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _73 = _61 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _75 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[1].x, _67);
    float _77 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[2].x, _71);
    float _81 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[3].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].z, _75);
    float _85 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].z, _79);
    float _89 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].z, _81);
    float _91 = _83 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _91;
    out.gl_Position.z = _95;
    out.gl_Position.w = _97;
    int _100 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _104 = _100 != 0;
    bool _106 = !_104;
    float _108 = _91;
    float _110 = _41;
    float _112 = _39;
    bool _118;
    if (!_106)
    {
        int _114 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _116 = _114 != 0;
        _118 = _116;
        _120 = _116;
        if (!_120)
        {
            float _122 = trunc(_39);
            int _124 = int(_122);
            float _126 = trunc(_41);
            int _128 = int(_126);
            int _130 = _128 << 1;
            int _132 = _130 + _124;
            int _134 = _132 << 4;
            bool _136 = _134 == 0;
            bool _138 = _134 == 16;
            bool _140 = _134 == 32;
            bool _142 = _134 == 48;
            float _144 = as_type<float>(_134);
            if (_136)
            {
                _144 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _146 = _144;
            float _148 = _146;
            if (_136)
            {
                _108 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _150 = _108;
            float _152 = _150;
            if (_138)
            {
                _152 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _154 = _152;
            float _156 = _154;
            if (_138)
            {
                _148 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _158 = _148;
            float _160 = _158;
            if (_140)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _162 = _160;
            float _164 = _162;
            if (_140)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _166 = _156;
            float _168 = _166;
            if (_142)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _170 = _164;
            if (_142)
            {
                _168 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _172 = _168;
            _110 = _172;
            _112 = _170;
            _120 = true;
        }
    }
    else
    {
        int _174 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _176 = _174 != 0;
        _118 = _176;
        if (!_176)
        {
            float _178 = trunc(_39);
            int _180 = int(_178);
            float _182 = trunc(_41);
            int _184 = int(_182);
            int _186 = _184 * 2;
            int _188 = _186 + _180;
            int _190 = _188 << 4;
            bool _192 = _190 == 0;
            bool _194 = _190 == 16;
            bool _196 = _190 == 32;
            bool _198 = _190 == 48;
            float _200 = as_type<float>(_180);
            float _202 = as_type<float>(_184);
            if (_192)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _204 = _200;
            float _206 = _204;
            if (_192)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _208 = _202;
            float _210 = _208;
            if (_194)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _212 = _206;
            float _214 = _212;
            if (_194)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _216 = _210;
            float _218 = _216;
            if (_196)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _220 = _218;
            _110 = _220;
            if (_196)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _222 = _214;
            float _224 = _222;
            if (_198)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _226 = _224;
            _112 = _226;
            if (_198)
            {
                _110 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _120 = false;
    float _228 = _110;
    float _230 = _112;
    bool _232 = _118;
    bool _234 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    bool _236 = !_234;
    float _238 = _228;
    float _240 = _230;
    float _242 = _230;
    float _244 = _228;
    float _258;
    float _260;
    if (!_236)
    {
        float _246 = _45 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _248 = _45 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _250 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].x, _246);
        float _252 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].x, _248);
        float _254 = _250 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _256 = _252 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _258 = _256;
        _260 = _254;
        _262 = true;
    }
    else
    {
        int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _266 = _264 != 0;
        if (!_266)
        {
            _238 = _230;
        }
        float _268 = _238;
        float _270 = _268;
        _260 = _268;
        if (!_266)
        {
            _240 = _228;
        }
        float _272 = _240;
        bool _274 = !_266;
        float _276 = _272;
        _258 = _272;
        if (!_274)
        {
            if (!_232)
            {
                _270 = _230;
            }
            float _278 = _270;
            float _280 = _278;
            int _282 = as_type<int>(_278);
            if (!_232)
            {
                _276 = _228;
            }
            float _284 = _276;
            bool _286 = !_232;
            float _288 = _284;
            float _290 = _284;
            if (!_286)
            {
                int _292 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _294 = _292 != 0;
                int _296 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _298 = _296 != 0;
                int _300 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _302 = _300 != 0;
                int _304 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _306 = _304 != 0;
                int _308 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _310 = _308 != 0;
                if (_294)
                {
                    _280 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _312 = _280;
                float _314 = _312;
                if (_294)
                {
                    _288 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _316 = _288;
                float _318 = _316;
                if (!_294)
                {
                    _314 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _320 = _314;
                if (!_294)
                {
                    _318 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _322 = _318;
                float _324 = _320 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _326 = _322 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_306)
                {
                    float _328 = _324 * _230;
                    _242 = _328;
                }
                float _330 = _242;
                float _332 = -_324;
                float _334 = _332 + 1.0;
                int _336 = as_type<int>(_330);
                if (_310)
                {
                    float _338 = _326 * _228;
                    _244 = _338;
                }
                float _340 = _244;
                float _342 = -_326;
                float _344 = _342 + 1.0;
                float _346 = _340;
                if (_298)
                {
                    float _348 = _330 + _334;
                    _336 = as_type<int>(_348);
                }
                int _350 = _336;
                if (_302)
                {
                    float _352 = _340 + _344;
                    _346 = _352;
                }
                float _354 = _346;
                _282 = _350;
                _290 = _354;
            }
            int _356 = _282;
            float _358 = _290;
            int _360 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _362 = _360 != 0;
            int _364 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _366 = _364 != 0;
            int _368 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _370 = _368 != 0;
            int _372 = _356;
            int _374 = as_type<int>(_358);
            if (_366)
            {
                float _376 = -as_type<float>(_356);
                float _378 = _376 + 1.0;
                _372 = as_type<int>(_378);
            }
            int _380 = _372;
            if (_370)
            {
                float _382 = -_358;
                float _384 = _382 + 1.0;
                _374 = as_type<int>(_384);
            }
            int _386 = _374;
            bool _388 = !_362;
            float _390 = _388 ? as_type<float>(_380) : as_type<float>(_386);
            bool _392 = !_362;
            float _394 = _392 ? as_type<float>(_386) : as_type<float>(_380);
            _258 = _394;
            _260 = _390;
        }
    }
    _262 = false;
    float _396 = _258;
    float _398 = _260;
    float _400 = _396 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _402 = _396 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _404 = fma(_398, (*spvDescriptorSet0.vp_c3)._m0[10].x, _400);
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c3)._m0[9].x, _402);
    float _408 = _404 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _410 = _406 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _412 = -_408;
    float _414 = _412 + 1.0;
    out.m_25.x = _410;
    out.m_25.y = _414;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad0 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _262 = false;
    bool _120 = false;
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
    float _67 = _61 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _69 = _61 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _61 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _73 = _61 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _75 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[1].x, _67);
    float _77 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[2].x, _71);
    float _81 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[3].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].z, _75);
    float _85 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].z, _79);
    float _89 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].z, _81);
    float _91 = _83 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _91;
    out.gl_Position.z = _95;
    out.gl_Position.w = _97;
    int _100 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _104 = _100 != 0;
    bool _106 = !_104;
    float _108 = _91;
    float _110 = _41;
    float _112 = _39;
    bool _118;
    if (!_106)
    {
        int _114 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _116 = _114 != 0;
        _118 = _116;
        _120 = _116;
        if (!_120)
        {
            float _122 = trunc(_39);
            int _124 = int(_122);
            float _126 = trunc(_41);
            int _128 = int(_126);
            int _130 = _128 << 1;
            int _132 = _130 + _124;
            int _134 = _132 << 4;
            bool _136 = _134 == 0;
            bool _138 = _134 == 16;
            bool _140 = _134 == 32;
            bool _142 = _134 == 48;
            float _144 = as_type<float>(_134);
            if (_136)
            {
                _144 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _146 = _144;
            float _148 = _146;
            if (_136)
            {
                _108 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _150 = _108;
            float _152 = _150;
            if (_138)
            {
                _152 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _154 = _152;
            float _156 = _154;
            if (_138)
            {
                _148 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _158 = _148;
            float _160 = _158;
            if (_140)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _162 = _160;
            float _164 = _162;
            if (_140)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _166 = _156;
            float _168 = _166;
            if (_142)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _170 = _164;
            if (_142)
            {
                _168 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _172 = _168;
            _110 = _172;
            _112 = _170;
            _120 = true;
        }
    }
    else
    {
        int _174 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _176 = _174 != 0;
        _118 = _176;
        if (!_176)
        {
            float _178 = trunc(_39);
            int _180 = int(_178);
            float _182 = trunc(_41);
            int _184 = int(_182);
            int _186 = _184 * 2;
            int _188 = _186 + _180;
            int _190 = _188 << 4;
            bool _192 = _190 == 0;
            bool _194 = _190 == 16;
            bool _196 = _190 == 32;
            bool _198 = _190 == 48;
            float _200 = as_type<float>(_180);
            float _202 = as_type<float>(_184);
            if (_192)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _204 = _200;
            float _206 = _204;
            if (_192)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _208 = _202;
            float _210 = _208;
            if (_194)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _212 = _206;
            float _214 = _212;
            if (_194)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _216 = _210;
            float _218 = _216;
            if (_196)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _220 = _218;
            _110 = _220;
            if (_196)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _222 = _214;
            float _224 = _222;
            if (_198)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _226 = _224;
            _112 = _226;
            if (_198)
            {
                _110 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _120 = false;
    float _228 = _110;
    float _230 = _112;
    bool _232 = _118;
    bool _234 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    bool _236 = !_234;
    float _238 = _228;
    float _240 = _230;
    float _242 = _230;
    float _244 = _228;
    float _258;
    float _260;
    if (!_236)
    {
        float _246 = _45 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _248 = _45 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _250 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].x, _246);
        float _252 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].x, _248);
        float _254 = _250 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _256 = _252 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _258 = _256;
        _260 = _254;
        _262 = true;
    }
    else
    {
        int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _266 = _264 != 0;
        if (!_266)
        {
            _238 = _230;
        }
        float _268 = _238;
        float _270 = _268;
        _260 = _268;
        if (!_266)
        {
            _240 = _228;
        }
        float _272 = _240;
        bool _274 = !_266;
        float _276 = _272;
        _258 = _272;
        if (!_274)
        {
            if (!_232)
            {
                _270 = _230;
            }
            float _278 = _270;
            float _280 = _278;
            int _282 = as_type<int>(_278);
            if (!_232)
            {
                _276 = _228;
            }
            float _284 = _276;
            bool _286 = !_232;
            float _288 = _284;
            float _290 = _284;
            if (!_286)
            {
                int _292 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _294 = _292 != 0;
                int _296 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _298 = _296 != 0;
                int _300 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _302 = _300 != 0;
                int _304 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _306 = _304 != 0;
                int _308 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _310 = _308 != 0;
                if (_294)
                {
                    _280 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _312 = _280;
                float _314 = _312;
                if (_294)
                {
                    _288 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _316 = _288;
                float _318 = _316;
                if (!_294)
                {
                    _314 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _320 = _314;
                if (!_294)
                {
                    _318 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _322 = _318;
                float _324 = _320 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _326 = _322 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_306)
                {
                    float _328 = _324 * _230;
                    _242 = _328;
                }
                float _330 = _242;
                float _332 = -_324;
                float _334 = _332 + 1.0;
                int _336 = as_type<int>(_330);
                if (_310)
                {
                    float _338 = _326 * _228;
                    _244 = _338;
                }
                float _340 = _244;
                float _342 = -_326;
                float _344 = _342 + 1.0;
                float _346 = _340;
                if (_298)
                {
                    float _348 = _330 + _334;
                    _336 = as_type<int>(_348);
                }
                int _350 = _336;
                if (_302)
                {
                    float _352 = _340 + _344;
                    _346 = _352;
                }
                float _354 = _346;
                _282 = _350;
                _290 = _354;
            }
            int _356 = _282;
            float _358 = _290;
            int _360 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _362 = _360 != 0;
            int _364 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _366 = _364 != 0;
            int _368 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _370 = _368 != 0;
            int _372 = _356;
            int _374 = as_type<int>(_358);
            if (_366)
            {
                float _376 = -as_type<float>(_356);
                float _378 = _376 + 1.0;
                _372 = as_type<int>(_378);
            }
            int _380 = _372;
            if (_370)
            {
                float _382 = -_358;
                float _384 = _382 + 1.0;
                _374 = as_type<int>(_384);
            }
            int _386 = _374;
            bool _388 = !_362;
            float _390 = _388 ? as_type<float>(_380) : as_type<float>(_386);
            bool _392 = !_362;
            float _394 = _392 ? as_type<float>(_386) : as_type<float>(_380);
            _258 = _394;
            _260 = _390;
        }
    }
    _262 = false;
    float _396 = _258;
    float _398 = _260;
    float _400 = _396 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _402 = _396 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _404 = fma(_398, (*spvDescriptorSet0.vp_c3)._m0[10].x, _400);
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c3)._m0[9].x, _402);
    float _408 = _404 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _410 = _406 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _412 = -_408;
    float _414 = _412 + 1.0;
    out.m_25.x = _410;
    out.m_25.y = _414;
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
    out.dm_pad0 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    bool _262 = false;
    bool _120 = false;
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
    float _67 = _61 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _69 = _61 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _71 = _61 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _73 = _61 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _75 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[1].x, _67);
    float _77 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[0].x, _69);
    float _79 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[2].x, _71);
    float _81 = fma(_63, (*spvDescriptorSet0.vp_c3)._m0[3].x, _73);
    float _83 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[1].z, _75);
    float _85 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[0].z, _77);
    float _87 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[2].z, _79);
    float _89 = fma(_65, (*spvDescriptorSet0.vp_c3)._m0[3].z, _81);
    float _91 = _83 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _93 = _85 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _95 = _87 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _97 = _89 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _93;
    out.gl_Position.y = _91;
    out.gl_Position.z = _95;
    out.gl_Position.w = _97;
    int _100 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1073741824;
    bool _104 = _100 != 0;
    bool _106 = !_104;
    float _108 = _91;
    float _110 = _41;
    float _112 = _39;
    bool _118;
    if (!_106)
    {
        int _114 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _116 = _114 != 0;
        _118 = _116;
        _120 = _116;
        if (!_120)
        {
            float _122 = trunc(_39);
            int _124 = int(_122);
            float _126 = trunc(_41);
            int _128 = int(_126);
            int _130 = _128 << 1;
            int _132 = _130 + _124;
            int _134 = _132 << 4;
            bool _136 = _134 == 0;
            bool _138 = _134 == 16;
            bool _140 = _134 == 32;
            bool _142 = _134 == 48;
            float _144 = as_type<float>(_134);
            if (_136)
            {
                _144 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _146 = _144;
            float _148 = _146;
            if (_136)
            {
                _108 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _150 = _108;
            float _152 = _150;
            if (_138)
            {
                _152 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _154 = _152;
            float _156 = _154;
            if (_138)
            {
                _148 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _158 = _148;
            float _160 = _158;
            if (_140)
            {
                _160 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _162 = _160;
            float _164 = _162;
            if (_140)
            {
                _156 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _166 = _156;
            float _168 = _166;
            if (_142)
            {
                _164 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _170 = _164;
            if (_142)
            {
                _168 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
            float _172 = _168;
            _110 = _172;
            _112 = _170;
            _120 = true;
        }
    }
    else
    {
        int _174 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
        bool _176 = _174 != 0;
        _118 = _176;
        if (!_176)
        {
            float _178 = trunc(_39);
            int _180 = int(_178);
            float _182 = trunc(_41);
            int _184 = int(_182);
            int _186 = _184 * 2;
            int _188 = _186 + _180;
            int _190 = _188 << 4;
            bool _192 = _190 == 0;
            bool _194 = _190 == 16;
            bool _196 = _190 == 32;
            bool _198 = _190 == 48;
            float _200 = as_type<float>(_180);
            float _202 = as_type<float>(_184);
            if (_192)
            {
                _200 = (*spvDescriptorSet0.vp_c3)._m0[18].x;
            }
            float _204 = _200;
            float _206 = _204;
            if (_192)
            {
                _202 = (*spvDescriptorSet0.vp_c3)._m0[18].y;
            }
            float _208 = _202;
            float _210 = _208;
            if (_194)
            {
                _206 = (*spvDescriptorSet0.vp_c3)._m0[19].x;
            }
            float _212 = _206;
            float _214 = _212;
            if (_194)
            {
                _210 = (*spvDescriptorSet0.vp_c3)._m0[19].y;
            }
            float _216 = _210;
            float _218 = _216;
            if (_196)
            {
                _218 = (*spvDescriptorSet0.vp_c3)._m0[20].y;
            }
            float _220 = _218;
            _110 = _220;
            if (_196)
            {
                _214 = (*spvDescriptorSet0.vp_c3)._m0[20].x;
            }
            float _222 = _214;
            float _224 = _222;
            if (_198)
            {
                _224 = (*spvDescriptorSet0.vp_c3)._m0[21].x;
            }
            float _226 = _224;
            _112 = _226;
            if (_198)
            {
                _110 = (*spvDescriptorSet0.vp_c3)._m0[21].y;
            }
        }
    }
    _120 = false;
    float _228 = _110;
    float _230 = _112;
    bool _232 = _118;
    bool _234 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].y);
    bool _236 = !_234;
    float _238 = _228;
    float _240 = _230;
    float _242 = _230;
    float _244 = _228;
    float _258;
    float _260;
    if (!_236)
    {
        float _246 = _45 * (*spvDescriptorSet0.vp_c3)._m0[18].y;
        float _248 = _45 * (*spvDescriptorSet0.vp_c3)._m0[19].y;
        float _250 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[18].x, _246);
        float _252 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[19].x, _248);
        float _254 = _250 + (*spvDescriptorSet0.vp_c3)._m0[18].w;
        float _256 = _252 + (*spvDescriptorSet0.vp_c3)._m0[19].w;
        _258 = _256;
        _260 = _254;
        _262 = true;
    }
    else
    {
        int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _266 = _264 != 0;
        if (!_266)
        {
            _238 = _230;
        }
        float _268 = _238;
        float _270 = _268;
        _260 = _268;
        if (!_266)
        {
            _240 = _228;
        }
        float _272 = _240;
        bool _274 = !_266;
        float _276 = _272;
        _258 = _272;
        if (!_274)
        {
            if (!_232)
            {
                _270 = _230;
            }
            float _278 = _270;
            float _280 = _278;
            int _282 = as_type<int>(_278);
            if (!_232)
            {
                _276 = _228;
            }
            float _284 = _276;
            bool _286 = !_232;
            float _288 = _284;
            float _290 = _284;
            if (!_286)
            {
                int _292 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _294 = _292 != 0;
                int _296 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _298 = _296 != 0;
                int _300 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _302 = _300 != 0;
                int _304 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _306 = _304 != 0;
                int _308 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _310 = _308 != 0;
                if (_294)
                {
                    _280 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _312 = _280;
                float _314 = _312;
                if (_294)
                {
                    _288 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _316 = _288;
                float _318 = _316;
                if (!_294)
                {
                    _314 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _320 = _314;
                if (!_294)
                {
                    _318 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _322 = _318;
                float _324 = _320 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _326 = _322 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                if (_306)
                {
                    float _328 = _324 * _230;
                    _242 = _328;
                }
                float _330 = _242;
                float _332 = -_324;
                float _334 = _332 + 1.0;
                int _336 = as_type<int>(_330);
                if (_310)
                {
                    float _338 = _326 * _228;
                    _244 = _338;
                }
                float _340 = _244;
                float _342 = -_326;
                float _344 = _342 + 1.0;
                float _346 = _340;
                if (_298)
                {
                    float _348 = _330 + _334;
                    _336 = as_type<int>(_348);
                }
                int _350 = _336;
                if (_302)
                {
                    float _352 = _340 + _344;
                    _346 = _352;
                }
                float _354 = _346;
                _282 = _350;
                _290 = _354;
            }
            int _356 = _282;
            float _358 = _290;
            int _360 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _362 = _360 != 0;
            int _364 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _366 = _364 != 0;
            int _368 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _370 = _368 != 0;
            int _372 = _356;
            int _374 = as_type<int>(_358);
            if (_366)
            {
                float _376 = -as_type<float>(_356);
                float _378 = _376 + 1.0;
                _372 = as_type<int>(_378);
            }
            int _380 = _372;
            if (_370)
            {
                float _382 = -_358;
                float _384 = _382 + 1.0;
                _374 = as_type<int>(_384);
            }
            int _386 = _374;
            bool _388 = !_362;
            float _390 = _388 ? as_type<float>(_380) : as_type<float>(_386);
            bool _392 = !_362;
            float _394 = _392 ? as_type<float>(_386) : as_type<float>(_380);
            _258 = _394;
            _260 = _390;
        }
    }
    _262 = false;
    float _396 = _258;
    float _398 = _260;
    float _400 = _396 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _402 = _396 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _404 = fma(_398, (*spvDescriptorSet0.vp_c3)._m0[10].x, _400);
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c3)._m0[9].x, _402);
    float _408 = _404 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _410 = _406 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _412 = -_408;
    float _414 = _412 + 1.0;
    out.m_25.x = _410;
    out.m_25.y = _414;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.dm_pad0.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.dm_pad0.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.dm_pad0.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.dm_pad0.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

