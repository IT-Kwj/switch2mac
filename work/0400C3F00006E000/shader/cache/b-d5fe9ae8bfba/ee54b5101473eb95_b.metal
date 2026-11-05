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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _29* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(0)]];
    float4 m_41 [[attribute(5)]];
    uint4 m_36 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _250 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _64 = in.m_39.x;
    float _66 = in.m_39.y;
    float _68 = in.m_39.z;
    float _70 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _72 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _70;
    float _74 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _76 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _74;
    float _78 = _72 * _72;
    int _81 = as_type<int>(_62) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _83 = _81 + as_type<int>(_60);
    int _85 = _83 * 48;
    int _87 = _85 + 16;
    int _89 = _85 + 32;
    int _91 = _85 + 48;
    uint _94 = uint(int(uint(_87) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_94)];
    float _96 = as_type<float>(_dmw0.x);
    int _98 = _87 + 4;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    float _102 = as_type<float>(_dmw0.y);
    int _104 = _87 + 8;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw0.z);
    int _110 = _87 + 12;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.w);
    uint _116 = uint(int(uint(_89) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_116)];
    float _118 = as_type<float>(_dmw1.x);
    int _120 = _89 + 4;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw1.y);
    int _126 = _89 + 8;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.z);
    int _132 = _89 + 12;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.w);
    uint _138 = uint(int(uint(_91) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_138)];
    float _140 = as_type<float>(_dmw2.x);
    int _142 = _91 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw2.y);
    int _148 = _91 + 8;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    float _152 = as_type<float>(_dmw2.z);
    int _154 = _91 + 12;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    float _158 = as_type<float>(_dmw2.w);
    float _160 = fma(_76, _76, _78);
    float _162 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _164 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _162;
    float _166 = fma(_164, _164, _160);
    float _168 = in.m_41.x;
    float _170 = sqrt(_166);
    bool _174 = _170 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _176 = isnan(_170);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _182 = _178 || _180;
    float _184 = _102 * _66;
    float _186 = _124 * _66;
    float _188 = fma(_96, _64, _184);
    float _190 = _146 * _66;
    float _192 = fma(_118, _64, _186);
    float _194 = fma(_108, _68, _188);
    float _196 = fma(_140, _64, _190);
    float _198 = fma(_130, _68, _192);
    float _200 = _114 + _194;
    float _202 = _140;
    if (!_182)
    {
        _202 = 1.0;
    }
    float _204 = _202;
    float _206 = fma(_152, _68, _196);
    float _208 = _136 + _198;
    float _210 = _200 * _168;
    float _212 = _158 + _206;
    float _214 = _208 * _168;
    float _216 = _212 * _168;
    bool _218 = !_182;
    float _220 = _204;
    if (!_218)
    {
        bool _222 = _170 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _224 = isnan(_170);
        bool _226 = _222 || _224;
        bool _228 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _230 = _226 || _228;
        if (!_230)
        {
            float _232 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _234 = _170 + _232;
            float _236 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _238 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _236;
            float _240 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _242 = _240 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _244 = 1.0 / _238;
            float _246 = _234 * _244;
            float _248 = fma(_246, _242, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _220 = _248;
            _250 = true;
        }
        else
        {
            bool _252 = _170 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _254 = isnan(_170);
            bool _256 = _252 || _254;
            bool _258 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _260 = _256 || _258;
            if (!_260)
            {
                float _262 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _264 = _170 + _262;
                float _266 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _268 = _266 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _270 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _272 = _270 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _274 = 1.0 / _268;
                float _276 = _264 * _274;
                float _278 = fma(_276, _272, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _220 = _278;
                _250 = true;
            }
            else
            {
                _220 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _250 = false;
    float _280 = _220;
    float _282 = _280 + (-1.0);
    float _284 = _282 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _286 = _282 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _288 = _282 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _290 = fma(_214, _280, _284);
    float _292 = fma(_210, _280, _286);
    float _294 = fma(_216, _280, _288);
    float _296 = _290 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _298 = _290 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _300 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[2].x, _296);
    float _302 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[0].x, _298);
    float _304 = _290 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c7)._m0[2].z, _300);
    float _308 = fma(_294, (*spvDescriptorSet0.vp_c7)._m0[0].z, _302);
    float _310 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[1].x, _304);
    float _312 = _306 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _314 = _308 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _316 = fma(_294, (*spvDescriptorSet0.vp_c7)._m0[1].z, _310);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _320 = _312 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _324 = _314 + _322;
    float _326 = _316 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _328 = _320 * _320;
    float _330 = _326 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _332 = fma(_324, _324, _328);
    float _334 = fma(_314, (*spvDescriptorSet0.vp_c4)._m0[2].x, _330);
    float _336 = sqrt(_332);
    float _338 = fma(_312, (*spvDescriptorSet0.vp_c4)._m0[2].z, _334);
    float _340 = _338 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _342 = _336 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _344 = _294;
    float _346 = _338;
    float _348 = _316;
    float _350 = _340;
    if (!_342)
    {
        _344 = _314;
    }
    float _352 = _344;
    float _354 = _352;
    if (!_342)
    {
        _346 = _312;
    }
    float _356 = _346;
    float _358 = _356;
    if (!_342)
    {
        _348 = _326;
    }
    float _360 = _348;
    bool _362 = !_342;
    float _364 = _360;
    if (!_362)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _368 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _370 = _336 + _368;
        float _372 = _326 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _374 = rsqrt(_332);
        float _376 = _370 * _366;
        float _378 = _376 * 0.15915493667125701904296875;
        float _380 = _378 * 6.283185482025146484375;
        float _382 = cos(_380);
        float _384 = _378 * 6.283185482025146484375;
        float _386 = sin(_384);
        float _388 = _382 + (-1.0);
        float _390 = _388 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _392 = fma(_386, _372, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _394 = fma(_326, _382, _390);
        float _396 = _374 * _392;
        float _398 = _394 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _400 = fma(_324, _396, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _402 = fma(_320, _396, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _404 = fma(_400, (*spvDescriptorSet0.vp_c4)._m0[2].x, _398);
        float _406 = fma(_402, (*spvDescriptorSet0.vp_c4)._m0[2].z, _404);
        float _408 = _406 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _364 = _394;
        _354 = _400;
        _358 = _402;
        _350 = _408;
    }
    float _410 = _364;
    float _412 = _354;
    float _414 = _358;
    float _416 = _350;
    float _418 = _410 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _420 = _410 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _422 = in.m_43.x;
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[1].x, _418);
    float _426 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[0].x, _420);
    float _428 = in.m_43.y;
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[1].z, _424);
    float _432 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[0].z, _426);
    float _434 = _430 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _436 = _432 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _438 = _434 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _440 = _434 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _442 = _434 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _444 = _434 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _446 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[8].x, _438);
    float _448 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[7].x, _440);
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[9].x, _442);
    float _452 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[10].x, _444);
    float _454 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[8].z, _446);
    float _456 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[7].z, _448);
    float _458 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[9].z, _450);
    float _460 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[10].z, _452);
    float _462 = _456 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _464 = _454 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _466 = _458 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _468 = _460 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _422;
    out.m_46.y = _428;
    out.gl_Position.x = _462;
    out.gl_Position.y = _464;
    out.gl_Position.z = _466;
    out.gl_Position.w = _468;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _250 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _64 = in.m_39.x;
    float _66 = in.m_39.y;
    float _68 = in.m_39.z;
    float _70 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _72 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _70;
    float _74 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _76 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _74;
    float _78 = _72 * _72;
    int _81 = as_type<int>(_62) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _83 = _81 + as_type<int>(_60);
    int _85 = _83 * 48;
    int _87 = _85 + 16;
    int _89 = _85 + 32;
    int _91 = _85 + 48;
    uint _94 = uint(int(uint(_87) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_94)];
    float _96 = as_type<float>(_dmw0.x);
    int _98 = _87 + 4;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    float _102 = as_type<float>(_dmw0.y);
    int _104 = _87 + 8;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw0.z);
    int _110 = _87 + 12;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.w);
    uint _116 = uint(int(uint(_89) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_116)];
    float _118 = as_type<float>(_dmw1.x);
    int _120 = _89 + 4;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw1.y);
    int _126 = _89 + 8;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.z);
    int _132 = _89 + 12;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.w);
    uint _138 = uint(int(uint(_91) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_138)];
    float _140 = as_type<float>(_dmw2.x);
    int _142 = _91 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw2.y);
    int _148 = _91 + 8;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    float _152 = as_type<float>(_dmw2.z);
    int _154 = _91 + 12;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    float _158 = as_type<float>(_dmw2.w);
    float _160 = fma(_76, _76, _78);
    float _162 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _164 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _162;
    float _166 = fma(_164, _164, _160);
    float _168 = in.m_41.x;
    float _170 = sqrt(_166);
    bool _174 = _170 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _176 = isnan(_170);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _182 = _178 || _180;
    float _184 = _102 * _66;
    float _186 = _124 * _66;
    float _188 = fma(_96, _64, _184);
    float _190 = _146 * _66;
    float _192 = fma(_118, _64, _186);
    float _194 = fma(_108, _68, _188);
    float _196 = fma(_140, _64, _190);
    float _198 = fma(_130, _68, _192);
    float _200 = _114 + _194;
    float _202 = _140;
    if (!_182)
    {
        _202 = 1.0;
    }
    float _204 = _202;
    float _206 = fma(_152, _68, _196);
    float _208 = _136 + _198;
    float _210 = _200 * _168;
    float _212 = _158 + _206;
    float _214 = _208 * _168;
    float _216 = _212 * _168;
    bool _218 = !_182;
    float _220 = _204;
    if (!_218)
    {
        bool _222 = _170 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _224 = isnan(_170);
        bool _226 = _222 || _224;
        bool _228 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _230 = _226 || _228;
        if (!_230)
        {
            float _232 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _234 = _170 + _232;
            float _236 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _238 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _236;
            float _240 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _242 = _240 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _244 = 1.0 / _238;
            float _246 = _234 * _244;
            float _248 = fma(_246, _242, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _220 = _248;
            _250 = true;
        }
        else
        {
            bool _252 = _170 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _254 = isnan(_170);
            bool _256 = _252 || _254;
            bool _258 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _260 = _256 || _258;
            if (!_260)
            {
                float _262 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _264 = _170 + _262;
                float _266 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _268 = _266 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _270 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _272 = _270 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _274 = 1.0 / _268;
                float _276 = _264 * _274;
                float _278 = fma(_276, _272, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _220 = _278;
                _250 = true;
            }
            else
            {
                _220 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _250 = false;
    float _280 = _220;
    float _282 = _280 + (-1.0);
    float _284 = _282 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _286 = _282 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _288 = _282 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _290 = fma(_214, _280, _284);
    float _292 = fma(_210, _280, _286);
    float _294 = fma(_216, _280, _288);
    float _296 = _290 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _298 = _290 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _300 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[2].x, _296);
    float _302 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[0].x, _298);
    float _304 = _290 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c7)._m0[2].z, _300);
    float _308 = fma(_294, (*spvDescriptorSet0.vp_c7)._m0[0].z, _302);
    float _310 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[1].x, _304);
    float _312 = _306 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _314 = _308 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _316 = fma(_294, (*spvDescriptorSet0.vp_c7)._m0[1].z, _310);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _320 = _312 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _324 = _314 + _322;
    float _326 = _316 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _328 = _320 * _320;
    float _330 = _326 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _332 = fma(_324, _324, _328);
    float _334 = fma(_314, (*spvDescriptorSet0.vp_c4)._m0[2].x, _330);
    float _336 = sqrt(_332);
    float _338 = fma(_312, (*spvDescriptorSet0.vp_c4)._m0[2].z, _334);
    float _340 = _338 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _342 = _336 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _344 = _294;
    float _346 = _338;
    float _348 = _316;
    float _350 = _340;
    if (!_342)
    {
        _344 = _314;
    }
    float _352 = _344;
    float _354 = _352;
    if (!_342)
    {
        _346 = _312;
    }
    float _356 = _346;
    float _358 = _356;
    if (!_342)
    {
        _348 = _326;
    }
    float _360 = _348;
    bool _362 = !_342;
    float _364 = _360;
    if (!_362)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _368 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _370 = _336 + _368;
        float _372 = _326 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _374 = rsqrt(_332);
        float _376 = _370 * _366;
        float _378 = _376 * 0.15915493667125701904296875;
        float _380 = _378 * 6.283185482025146484375;
        float _382 = cos(_380);
        float _384 = _378 * 6.283185482025146484375;
        float _386 = sin(_384);
        float _388 = _382 + (-1.0);
        float _390 = _388 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _392 = fma(_386, _372, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _394 = fma(_326, _382, _390);
        float _396 = _374 * _392;
        float _398 = _394 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _400 = fma(_324, _396, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _402 = fma(_320, _396, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _404 = fma(_400, (*spvDescriptorSet0.vp_c4)._m0[2].x, _398);
        float _406 = fma(_402, (*spvDescriptorSet0.vp_c4)._m0[2].z, _404);
        float _408 = _406 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _364 = _394;
        _354 = _400;
        _358 = _402;
        _350 = _408;
    }
    float _410 = _364;
    float _412 = _354;
    float _414 = _358;
    float _416 = _350;
    float _418 = _410 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _420 = _410 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _422 = in.m_43.x;
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[1].x, _418);
    float _426 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[0].x, _420);
    float _428 = in.m_43.y;
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[1].z, _424);
    float _432 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[0].z, _426);
    float _434 = _430 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _436 = _432 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _438 = _434 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _440 = _434 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _442 = _434 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _444 = _434 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _446 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[8].x, _438);
    float _448 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[7].x, _440);
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[9].x, _442);
    float _452 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[10].x, _444);
    float _454 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[8].z, _446);
    float _456 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[7].z, _448);
    float _458 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[9].z, _450);
    float _460 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[10].z, _452);
    float _462 = _456 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _464 = _454 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _466 = _458 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _468 = _460 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _422;
    out.m_46.y = _428;
    out.gl_Position.x = _462;
    out.gl_Position.y = _464;
    out.gl_Position.z = _466;
    out.gl_Position.w = _468;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _250 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _64 = in.m_39.x;
    float _66 = in.m_39.y;
    float _68 = in.m_39.z;
    float _70 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _72 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _70;
    float _74 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _76 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _74;
    float _78 = _72 * _72;
    int _81 = as_type<int>(_62) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _83 = _81 + as_type<int>(_60);
    int _85 = _83 * 48;
    int _87 = _85 + 16;
    int _89 = _85 + 32;
    int _91 = _85 + 48;
    uint _94 = uint(int(uint(_87) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_94)];
    float _96 = as_type<float>(_dmw0.x);
    int _98 = _87 + 4;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    float _102 = as_type<float>(_dmw0.y);
    int _104 = _87 + 8;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>(_dmw0.z);
    int _110 = _87 + 12;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.w);
    uint _116 = uint(int(uint(_89) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_116)];
    float _118 = as_type<float>(_dmw1.x);
    int _120 = _89 + 4;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw1.y);
    int _126 = _89 + 8;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.z);
    int _132 = _89 + 12;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.w);
    uint _138 = uint(int(uint(_91) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_138)];
    float _140 = as_type<float>(_dmw2.x);
    int _142 = _91 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw2.y);
    int _148 = _91 + 8;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    float _152 = as_type<float>(_dmw2.z);
    int _154 = _91 + 12;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    float _158 = as_type<float>(_dmw2.w);
    float _160 = fma(_76, _76, _78);
    float _162 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _164 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _162;
    float _166 = fma(_164, _164, _160);
    float _168 = in.m_41.x;
    float _170 = sqrt(_166);
    bool _174 = _170 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _176 = isnan(_170);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _182 = _178 || _180;
    float _184 = _102 * _66;
    float _186 = _124 * _66;
    float _188 = fma(_96, _64, _184);
    float _190 = _146 * _66;
    float _192 = fma(_118, _64, _186);
    float _194 = fma(_108, _68, _188);
    float _196 = fma(_140, _64, _190);
    float _198 = fma(_130, _68, _192);
    float _200 = _114 + _194;
    float _202 = _140;
    if (!_182)
    {
        _202 = 1.0;
    }
    float _204 = _202;
    float _206 = fma(_152, _68, _196);
    float _208 = _136 + _198;
    float _210 = _200 * _168;
    float _212 = _158 + _206;
    float _214 = _208 * _168;
    float _216 = _212 * _168;
    bool _218 = !_182;
    float _220 = _204;
    if (!_218)
    {
        bool _222 = _170 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _224 = isnan(_170);
        bool _226 = _222 || _224;
        bool _228 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _230 = _226 || _228;
        if (!_230)
        {
            float _232 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _234 = _170 + _232;
            float _236 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _238 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _236;
            float _240 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _242 = _240 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _244 = 1.0 / _238;
            float _246 = _234 * _244;
            float _248 = fma(_246, _242, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _220 = _248;
            _250 = true;
        }
        else
        {
            bool _252 = _170 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _254 = isnan(_170);
            bool _256 = _252 || _254;
            bool _258 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _260 = _256 || _258;
            if (!_260)
            {
                float _262 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _264 = _170 + _262;
                float _266 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _268 = _266 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _270 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _272 = _270 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _274 = 1.0 / _268;
                float _276 = _264 * _274;
                float _278 = fma(_276, _272, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _220 = _278;
                _250 = true;
            }
            else
            {
                _220 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _250 = false;
    float _280 = _220;
    float _282 = _280 + (-1.0);
    float _284 = _282 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _286 = _282 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _288 = _282 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _290 = fma(_214, _280, _284);
    float _292 = fma(_210, _280, _286);
    float _294 = fma(_216, _280, _288);
    float _296 = _290 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _298 = _290 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _300 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[2].x, _296);
    float _302 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[0].x, _298);
    float _304 = _290 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c7)._m0[2].z, _300);
    float _308 = fma(_294, (*spvDescriptorSet0.vp_c7)._m0[0].z, _302);
    float _310 = fma(_292, (*spvDescriptorSet0.vp_c7)._m0[1].x, _304);
    float _312 = _306 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _314 = _308 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _316 = fma(_294, (*spvDescriptorSet0.vp_c7)._m0[1].z, _310);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _320 = _312 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _324 = _314 + _322;
    float _326 = _316 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _328 = _320 * _320;
    float _330 = _326 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _332 = fma(_324, _324, _328);
    float _334 = fma(_314, (*spvDescriptorSet0.vp_c4)._m0[2].x, _330);
    float _336 = sqrt(_332);
    float _338 = fma(_312, (*spvDescriptorSet0.vp_c4)._m0[2].z, _334);
    float _340 = _338 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _342 = _336 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _344 = _294;
    float _346 = _338;
    float _348 = _316;
    float _350 = _340;
    if (!_342)
    {
        _344 = _314;
    }
    float _352 = _344;
    float _354 = _352;
    if (!_342)
    {
        _346 = _312;
    }
    float _356 = _346;
    float _358 = _356;
    if (!_342)
    {
        _348 = _326;
    }
    float _360 = _348;
    bool _362 = !_342;
    float _364 = _360;
    if (!_362)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _368 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _370 = _336 + _368;
        float _372 = _326 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _374 = rsqrt(_332);
        float _376 = _370 * _366;
        float _378 = _376 * 0.15915493667125701904296875;
        float _380 = _378 * 6.283185482025146484375;
        float _382 = cos(_380);
        float _384 = _378 * 6.283185482025146484375;
        float _386 = sin(_384);
        float _388 = _382 + (-1.0);
        float _390 = _388 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _392 = fma(_386, _372, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _394 = fma(_326, _382, _390);
        float _396 = _374 * _392;
        float _398 = _394 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _400 = fma(_324, _396, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _402 = fma(_320, _396, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _404 = fma(_400, (*spvDescriptorSet0.vp_c4)._m0[2].x, _398);
        float _406 = fma(_402, (*spvDescriptorSet0.vp_c4)._m0[2].z, _404);
        float _408 = _406 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _364 = _394;
        _354 = _400;
        _358 = _402;
        _350 = _408;
    }
    float _410 = _364;
    float _412 = _354;
    float _414 = _358;
    float _416 = _350;
    float _418 = _410 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _420 = _410 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _422 = in.m_43.x;
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[1].x, _418);
    float _426 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[0].x, _420);
    float _428 = in.m_43.y;
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[1].z, _424);
    float _432 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[0].z, _426);
    float _434 = _430 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _436 = _432 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _438 = _434 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _440 = _434 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _442 = _434 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _444 = _434 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _446 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[8].x, _438);
    float _448 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[7].x, _440);
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[9].x, _442);
    float _452 = fma(_436, (*spvDescriptorSet0.vp_c4)._m0[10].x, _444);
    float _454 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[8].z, _446);
    float _456 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[7].z, _448);
    float _458 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[9].z, _450);
    float _460 = fma(_416, (*spvDescriptorSet0.vp_c4)._m0[10].z, _452);
    float _462 = _456 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _464 = _454 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _466 = _458 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _468 = _460 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _422;
    out.m_46.y = _428;
    out.gl_Position.x = _462;
    out.gl_Position.y = _464;
    out.gl_Position.z = _466;
    out.gl_Position.w = _468;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

