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
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(0)]];
    uint4 m_29 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _280 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = as_type<float>(in.m_29.x);
    float _48 = in.m_32.x;
    float _50 = in.m_32.y;
    float _52 = in.m_32.z;
    float _54 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _56 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _54;
    float _58 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _60 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _58;
    float _62 = _56 * _56;
    float _64 = fma(_60, _60, _62);
    float _66 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _68 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _66;
    float _70 = fma(_68, _68, _64);
    int _73 = as_type<int>(_46) * 48;
    float _75 = sqrt(_70);
    int _77 = _73 + 16;
    uint _80 = uint(int(uint(_77) >> uint(2)));
    uint _82 = uint(int(uint(int(_80)) >> uint(2)));
    int _84 = int(_80) & 3;
    float _86 = (*spvDescriptorSet0.vp_c5)._m0[int(_82)][_84];
    int _88 = int(_80) + 1;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    int _92 = _88 & 3;
    float _94 = (*spvDescriptorSet0.vp_c5)._m0[int(_90)][_92];
    uint _96 = uint(int(uint(_73) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.vp_c5)._m0[int(_98)][_100];
    int _104 = int(_96) + 1;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    int _108 = _104 & 3;
    float _110 = (*spvDescriptorSet0.vp_c5)._m0[int(_106)][_108];
    bool _114 = _75 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _116 = isnan(_75);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _122 = _118 || _120;
    int _124 = _73 + 32;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    uint _128 = uint(int(uint(int(_126)) >> uint(2)));
    int _130 = int(_126) & 3;
    float _132 = (*spvDescriptorSet0.vp_c5)._m0[int(_128)][_130];
    int _134 = int(_126) + 1;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    int _138 = _134 & 3;
    float _140 = (*spvDescriptorSet0.vp_c5)._m0[int(_136)][_138];
    int _142 = _73 + 24;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    uint _146 = uint(int(uint(int(_144)) >> uint(2)));
    int _148 = int(_144) & 3;
    float _150 = (*spvDescriptorSet0.vp_c5)._m0[int(_146)][_148];
    int _152 = int(_144) + 1;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    int _156 = _152 & 3;
    float _158 = (*spvDescriptorSet0.vp_c5)._m0[int(_154)][_156];
    int _160 = _73 + 8;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    uint _164 = uint(int(uint(int(_162)) >> uint(2)));
    int _166 = int(_162) & 3;
    float _168 = (*spvDescriptorSet0.vp_c5)._m0[int(_164)][_166];
    int _170 = int(_162) + 1;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    int _174 = _170 & 3;
    float _176 = (*spvDescriptorSet0.vp_c5)._m0[int(_172)][_174];
    int _178 = _73 + 40;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    uint _182 = uint(int(uint(int(_180)) >> uint(2)));
    int _184 = int(_180) & 3;
    float _186 = (*spvDescriptorSet0.vp_c5)._m0[int(_182)][_184];
    int _188 = int(_180) + 1;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    int _192 = _188 & 3;
    float _194 = (*spvDescriptorSet0.vp_c5)._m0[int(_190)][_192];
    float _196 = _50 * _94;
    float _198 = fma(_48, _86, _196);
    float _200 = _50 * _110;
    float _202 = fma(_48, _102, _200);
    float _204 = _50 * _140;
    float _206 = fma(_48, _132, _204);
    float _208 = fma(_52, _150, _198);
    float _210 = _208 + _158;
    float _212 = fma(_52, _168, _202);
    float _214 = _210 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _216 = _210 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _218 = _212 + _176;
    float _220 = fma(_52, _186, _206);
    float _222 = _210 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _224 = fma(_218, (*spvDescriptorSet0.vp_c6)._m0[4].x, _214);
    float _226 = fma(_218, (*spvDescriptorSet0.vp_c6)._m0[5].x, _216);
    float _228 = _220 + _194;
    float _230 = fma(_218, (*spvDescriptorSet0.vp_c6)._m0[3].x, _222);
    float _232 = _218;
    if (!_122)
    {
        _232 = 1.0;
    }
    float _234 = _232;
    float _236 = fma(_228, (*spvDescriptorSet0.vp_c6)._m0[4].z, _224);
    float _238 = fma(_228, (*spvDescriptorSet0.vp_c6)._m0[3].z, _230);
    float _240 = fma(_228, (*spvDescriptorSet0.vp_c6)._m0[5].z, _226);
    float _242 = _236 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _244 = _238 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _246 = _240 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _248 = !_122;
    float _250 = _234;
    if (!_248)
    {
        bool _252 = _75 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _254 = isnan(_75);
        bool _256 = _252 || _254;
        bool _258 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _260 = _256 || _258;
        if (!_260)
        {
            float _262 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _264 = _75 + _262;
            float _266 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _268 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _266;
            float _270 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _272 = _270 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _274 = 1.0 / _268;
            float _276 = _264 * _274;
            float _278 = fma(_276, _272, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _250 = _278;
            _280 = true;
        }
        else
        {
            bool _282 = _75 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _284 = isnan(_75);
            bool _286 = _282 || _284;
            bool _288 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _290 = _286 || _288;
            if (!_290)
            {
                float _292 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _294 = _75 + _292;
                float _296 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _298 = _296 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _300 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _302 = _300 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _304 = 1.0 / _298;
                float _306 = _294 * _304;
                float _308 = fma(_306, _302, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _250 = _308;
                _280 = true;
            }
            else
            {
                _250 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _280 = false;
    float _310 = _250;
    float _312 = _310 + (-1.0);
    float _314 = _312 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _316 = _312 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _318 = _312 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _320 = fma(_242, _310, _314);
    float _322 = fma(_244, _310, _316);
    float _324 = fma(_246, _310, _318);
    float _326 = _320 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _328 = _320 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _330 = fma(_322, (*spvDescriptorSet0.vp_c6)._m0[1].x, _326);
    float _332 = _320 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _334 = fma(_322, (*spvDescriptorSet0.vp_c6)._m0[0].x, _328);
    float _336 = fma(_324, (*spvDescriptorSet0.vp_c6)._m0[1].z, _330);
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c6)._m0[2].x, _332);
    float _340 = fma(_324, (*spvDescriptorSet0.vp_c6)._m0[0].z, _334);
    float _342 = _336 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _344 = fma(_324, (*spvDescriptorSet0.vp_c6)._m0[2].z, _338);
    float _346 = _340 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _348 = _342 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _350 = _344 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _352 = _342 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _354 = _342 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[1].x, _348);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[0].x, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[2].x, _354);
    float _362 = fma(_350, (*spvDescriptorSet0.vp_c4)._m0[1].z, _356);
    float _364 = fma(_350, (*spvDescriptorSet0.vp_c4)._m0[0].z, _358);
    float _366 = fma(_350, (*spvDescriptorSet0.vp_c4)._m0[2].z, _360);
    float _368 = _362 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _370 = _364 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _372 = _366 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _374 = _368 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _376 = _368 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _378 = _368 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _380 = _368 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[7].x, _374);
    float _384 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[8].x, _376);
    float _386 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[9].x, _378);
    float _388 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[10].x, _380);
    float _390 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[7].z, _382);
    float _392 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[8].z, _384);
    float _394 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[9].z, _386);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[10].z, _388);
    float _398 = _390 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _400 = _392 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _402 = _394 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _404 = _396 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _398;
    out.gl_Position.y = _400;
    out.gl_Position.z = _402;
    out.gl_Position.w = _404;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _280 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = as_type<float>(in.m_29.x);
    float _48 = in.m_32.x;
    float _50 = in.m_32.y;
    float _52 = in.m_32.z;
    float _54 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _56 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _54;
    float _58 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _60 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _58;
    float _62 = _56 * _56;
    float _64 = fma(_60, _60, _62);
    float _66 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _68 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _66;
    float _70 = fma(_68, _68, _64);
    int _73 = as_type<int>(_46) * 48;
    float _75 = sqrt(_70);
    int _77 = _73 + 16;
    uint _80 = uint(int(uint(_77) >> uint(2)));
    uint _82 = uint(int(uint(int(_80)) >> uint(2)));
    int _84 = int(_80) & 3;
    float _86 = (*spvDescriptorSet0.vp_c5)._m0[int(_82)][_84];
    int _88 = int(_80) + 1;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    int _92 = _88 & 3;
    float _94 = (*spvDescriptorSet0.vp_c5)._m0[int(_90)][_92];
    uint _96 = uint(int(uint(_73) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.vp_c5)._m0[int(_98)][_100];
    int _104 = int(_96) + 1;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    int _108 = _104 & 3;
    float _110 = (*spvDescriptorSet0.vp_c5)._m0[int(_106)][_108];
    bool _114 = _75 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _116 = isnan(_75);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _122 = _118 || _120;
    int _124 = _73 + 32;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    uint _128 = uint(int(uint(int(_126)) >> uint(2)));
    int _130 = int(_126) & 3;
    float _132 = (*spvDescriptorSet0.vp_c5)._m0[int(_128)][_130];
    int _134 = int(_126) + 1;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    int _138 = _134 & 3;
    float _140 = (*spvDescriptorSet0.vp_c5)._m0[int(_136)][_138];
    int _142 = _73 + 24;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    uint _146 = uint(int(uint(int(_144)) >> uint(2)));
    int _148 = int(_144) & 3;
    float _150 = (*spvDescriptorSet0.vp_c5)._m0[int(_146)][_148];
    int _152 = int(_144) + 1;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    int _156 = _152 & 3;
    float _158 = (*spvDescriptorSet0.vp_c5)._m0[int(_154)][_156];
    int _160 = _73 + 8;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    uint _164 = uint(int(uint(int(_162)) >> uint(2)));
    int _166 = int(_162) & 3;
    float _168 = (*spvDescriptorSet0.vp_c5)._m0[int(_164)][_166];
    int _170 = int(_162) + 1;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    int _174 = _170 & 3;
    float _176 = (*spvDescriptorSet0.vp_c5)._m0[int(_172)][_174];
    int _178 = _73 + 40;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    uint _182 = uint(int(uint(int(_180)) >> uint(2)));
    int _184 = int(_180) & 3;
    float _186 = (*spvDescriptorSet0.vp_c5)._m0[int(_182)][_184];
    int _188 = int(_180) + 1;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    int _192 = _188 & 3;
    float _194 = (*spvDescriptorSet0.vp_c5)._m0[int(_190)][_192];
    float _196 = _50 * _94;
    float _198 = fma(_48, _86, _196);
    float _200 = _50 * _110;
    float _202 = fma(_48, _102, _200);
    float _204 = _50 * _140;
    float _206 = fma(_48, _132, _204);
    float _208 = fma(_52, _150, _198);
    float _210 = _208 + _158;
    float _212 = fma(_52, _168, _202);
    float _214 = _210 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _216 = _210 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _218 = _212 + _176;
    float _220 = fma(_52, _186, _206);
    float _222 = _210 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _224 = fma(_218, (*spvDescriptorSet0.vp_c6)._m0[4].x, _214);
    float _226 = fma(_218, (*spvDescriptorSet0.vp_c6)._m0[5].x, _216);
    float _228 = _220 + _194;
    float _230 = fma(_218, (*spvDescriptorSet0.vp_c6)._m0[3].x, _222);
    float _232 = _218;
    if (!_122)
    {
        _232 = 1.0;
    }
    float _234 = _232;
    float _236 = fma(_228, (*spvDescriptorSet0.vp_c6)._m0[4].z, _224);
    float _238 = fma(_228, (*spvDescriptorSet0.vp_c6)._m0[3].z, _230);
    float _240 = fma(_228, (*spvDescriptorSet0.vp_c6)._m0[5].z, _226);
    float _242 = _236 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _244 = _238 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _246 = _240 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _248 = !_122;
    float _250 = _234;
    if (!_248)
    {
        bool _252 = _75 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _254 = isnan(_75);
        bool _256 = _252 || _254;
        bool _258 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _260 = _256 || _258;
        if (!_260)
        {
            float _262 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _264 = _75 + _262;
            float _266 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _268 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _266;
            float _270 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _272 = _270 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _274 = 1.0 / _268;
            float _276 = _264 * _274;
            float _278 = fma(_276, _272, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _250 = _278;
            _280 = true;
        }
        else
        {
            bool _282 = _75 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _284 = isnan(_75);
            bool _286 = _282 || _284;
            bool _288 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _290 = _286 || _288;
            if (!_290)
            {
                float _292 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _294 = _75 + _292;
                float _296 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _298 = _296 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _300 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _302 = _300 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _304 = 1.0 / _298;
                float _306 = _294 * _304;
                float _308 = fma(_306, _302, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _250 = _308;
                _280 = true;
            }
            else
            {
                _250 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _280 = false;
    float _310 = _250;
    float _312 = _310 + (-1.0);
    float _314 = _312 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _316 = _312 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _318 = _312 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _320 = fma(_242, _310, _314);
    float _322 = fma(_244, _310, _316);
    float _324 = fma(_246, _310, _318);
    float _326 = _320 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _328 = _320 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _330 = fma(_322, (*spvDescriptorSet0.vp_c6)._m0[1].x, _326);
    float _332 = _320 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _334 = fma(_322, (*spvDescriptorSet0.vp_c6)._m0[0].x, _328);
    float _336 = fma(_324, (*spvDescriptorSet0.vp_c6)._m0[1].z, _330);
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c6)._m0[2].x, _332);
    float _340 = fma(_324, (*spvDescriptorSet0.vp_c6)._m0[0].z, _334);
    float _342 = _336 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _344 = fma(_324, (*spvDescriptorSet0.vp_c6)._m0[2].z, _338);
    float _346 = _340 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _348 = _342 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _350 = _344 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _352 = _342 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _354 = _342 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[1].x, _348);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[0].x, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[2].x, _354);
    float _362 = fma(_350, (*spvDescriptorSet0.vp_c4)._m0[1].z, _356);
    float _364 = fma(_350, (*spvDescriptorSet0.vp_c4)._m0[0].z, _358);
    float _366 = fma(_350, (*spvDescriptorSet0.vp_c4)._m0[2].z, _360);
    float _368 = _362 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _370 = _364 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _372 = _366 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _374 = _368 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _376 = _368 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _378 = _368 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _380 = _368 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[7].x, _374);
    float _384 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[8].x, _376);
    float _386 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[9].x, _378);
    float _388 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[10].x, _380);
    float _390 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[7].z, _382);
    float _392 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[8].z, _384);
    float _394 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[9].z, _386);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[10].z, _388);
    float _398 = _390 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _400 = _392 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _402 = _394 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _404 = _396 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _398;
    out.gl_Position.y = _400;
    out.gl_Position.z = _402;
    out.gl_Position.w = _404;
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
    bool _280 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _46 = as_type<float>(in.m_29.x);
    float _48 = in.m_32.x;
    float _50 = in.m_32.y;
    float _52 = in.m_32.z;
    float _54 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _56 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _54;
    float _58 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _60 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _58;
    float _62 = _56 * _56;
    float _64 = fma(_60, _60, _62);
    float _66 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _68 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _66;
    float _70 = fma(_68, _68, _64);
    int _73 = as_type<int>(_46) * 48;
    float _75 = sqrt(_70);
    int _77 = _73 + 16;
    uint _80 = uint(int(uint(_77) >> uint(2)));
    uint _82 = uint(int(uint(int(_80)) >> uint(2)));
    int _84 = int(_80) & 3;
    float _86 = (*spvDescriptorSet0.vp_c5)._m0[int(_82)][_84];
    int _88 = int(_80) + 1;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    int _92 = _88 & 3;
    float _94 = (*spvDescriptorSet0.vp_c5)._m0[int(_90)][_92];
    uint _96 = uint(int(uint(_73) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.vp_c5)._m0[int(_98)][_100];
    int _104 = int(_96) + 1;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    int _108 = _104 & 3;
    float _110 = (*spvDescriptorSet0.vp_c5)._m0[int(_106)][_108];
    bool _114 = _75 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _116 = isnan(_75);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _122 = _118 || _120;
    int _124 = _73 + 32;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    uint _128 = uint(int(uint(int(_126)) >> uint(2)));
    int _130 = int(_126) & 3;
    float _132 = (*spvDescriptorSet0.vp_c5)._m0[int(_128)][_130];
    int _134 = int(_126) + 1;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    int _138 = _134 & 3;
    float _140 = (*spvDescriptorSet0.vp_c5)._m0[int(_136)][_138];
    int _142 = _73 + 24;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    uint _146 = uint(int(uint(int(_144)) >> uint(2)));
    int _148 = int(_144) & 3;
    float _150 = (*spvDescriptorSet0.vp_c5)._m0[int(_146)][_148];
    int _152 = int(_144) + 1;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    int _156 = _152 & 3;
    float _158 = (*spvDescriptorSet0.vp_c5)._m0[int(_154)][_156];
    int _160 = _73 + 8;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    uint _164 = uint(int(uint(int(_162)) >> uint(2)));
    int _166 = int(_162) & 3;
    float _168 = (*spvDescriptorSet0.vp_c5)._m0[int(_164)][_166];
    int _170 = int(_162) + 1;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    int _174 = _170 & 3;
    float _176 = (*spvDescriptorSet0.vp_c5)._m0[int(_172)][_174];
    int _178 = _73 + 40;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    uint _182 = uint(int(uint(int(_180)) >> uint(2)));
    int _184 = int(_180) & 3;
    float _186 = (*spvDescriptorSet0.vp_c5)._m0[int(_182)][_184];
    int _188 = int(_180) + 1;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    int _192 = _188 & 3;
    float _194 = (*spvDescriptorSet0.vp_c5)._m0[int(_190)][_192];
    float _196 = _50 * _94;
    float _198 = fma(_48, _86, _196);
    float _200 = _50 * _110;
    float _202 = fma(_48, _102, _200);
    float _204 = _50 * _140;
    float _206 = fma(_48, _132, _204);
    float _208 = fma(_52, _150, _198);
    float _210 = _208 + _158;
    float _212 = fma(_52, _168, _202);
    float _214 = _210 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _216 = _210 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _218 = _212 + _176;
    float _220 = fma(_52, _186, _206);
    float _222 = _210 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _224 = fma(_218, (*spvDescriptorSet0.vp_c6)._m0[4].x, _214);
    float _226 = fma(_218, (*spvDescriptorSet0.vp_c6)._m0[5].x, _216);
    float _228 = _220 + _194;
    float _230 = fma(_218, (*spvDescriptorSet0.vp_c6)._m0[3].x, _222);
    float _232 = _218;
    if (!_122)
    {
        _232 = 1.0;
    }
    float _234 = _232;
    float _236 = fma(_228, (*spvDescriptorSet0.vp_c6)._m0[4].z, _224);
    float _238 = fma(_228, (*spvDescriptorSet0.vp_c6)._m0[3].z, _230);
    float _240 = fma(_228, (*spvDescriptorSet0.vp_c6)._m0[5].z, _226);
    float _242 = _236 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _244 = _238 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _246 = _240 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _248 = !_122;
    float _250 = _234;
    if (!_248)
    {
        bool _252 = _75 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _254 = isnan(_75);
        bool _256 = _252 || _254;
        bool _258 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _260 = _256 || _258;
        if (!_260)
        {
            float _262 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _264 = _75 + _262;
            float _266 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _268 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _266;
            float _270 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _272 = _270 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _274 = 1.0 / _268;
            float _276 = _264 * _274;
            float _278 = fma(_276, _272, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _250 = _278;
            _280 = true;
        }
        else
        {
            bool _282 = _75 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _284 = isnan(_75);
            bool _286 = _282 || _284;
            bool _288 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _290 = _286 || _288;
            if (!_290)
            {
                float _292 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _294 = _75 + _292;
                float _296 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _298 = _296 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _300 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _302 = _300 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _304 = 1.0 / _298;
                float _306 = _294 * _304;
                float _308 = fma(_306, _302, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _250 = _308;
                _280 = true;
            }
            else
            {
                _250 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _280 = false;
    float _310 = _250;
    float _312 = _310 + (-1.0);
    float _314 = _312 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _316 = _312 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _318 = _312 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _320 = fma(_242, _310, _314);
    float _322 = fma(_244, _310, _316);
    float _324 = fma(_246, _310, _318);
    float _326 = _320 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _328 = _320 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _330 = fma(_322, (*spvDescriptorSet0.vp_c6)._m0[1].x, _326);
    float _332 = _320 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _334 = fma(_322, (*spvDescriptorSet0.vp_c6)._m0[0].x, _328);
    float _336 = fma(_324, (*spvDescriptorSet0.vp_c6)._m0[1].z, _330);
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c6)._m0[2].x, _332);
    float _340 = fma(_324, (*spvDescriptorSet0.vp_c6)._m0[0].z, _334);
    float _342 = _336 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _344 = fma(_324, (*spvDescriptorSet0.vp_c6)._m0[2].z, _338);
    float _346 = _340 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _348 = _342 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _350 = _344 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _352 = _342 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _354 = _342 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[1].x, _348);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[0].x, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[2].x, _354);
    float _362 = fma(_350, (*spvDescriptorSet0.vp_c4)._m0[1].z, _356);
    float _364 = fma(_350, (*spvDescriptorSet0.vp_c4)._m0[0].z, _358);
    float _366 = fma(_350, (*spvDescriptorSet0.vp_c4)._m0[2].z, _360);
    float _368 = _362 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _370 = _364 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _372 = _366 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _374 = _368 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _376 = _368 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _378 = _368 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _380 = _368 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[7].x, _374);
    float _384 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[8].x, _376);
    float _386 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[9].x, _378);
    float _388 = fma(_370, (*spvDescriptorSet0.vp_c4)._m0[10].x, _380);
    float _390 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[7].z, _382);
    float _392 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[8].z, _384);
    float _394 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[9].z, _386);
    float _396 = fma(_372, (*spvDescriptorSet0.vp_c4)._m0[10].z, _388);
    float _398 = _390 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _400 = _392 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _402 = _394 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _404 = _396 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _398;
    out.gl_Position.y = _400;
    out.gl_Position.z = _402;
    out.gl_Position.w = _404;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

