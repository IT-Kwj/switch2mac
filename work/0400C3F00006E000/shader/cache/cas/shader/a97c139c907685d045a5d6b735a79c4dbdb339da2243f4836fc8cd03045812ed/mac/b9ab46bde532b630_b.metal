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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_35 [[color(0)]];
    float4 m_37 [[color(1)]];
};

struct main0_in
{
    float4 m_32 [[user(locn0)]];
    float4 m_28 [[user(locn1)]];
    float4 m_24 [[user(locn2), flat]];
    float4 m_30 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = in.m_24.x;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_28.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_30.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_32.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    int _67 = as_type<int>(_44) << 6;
    float _69 = 1.0 / _46;
    int _71 = as_type<int>(_44) << 6;
    int _73 = _71 + 6160;
    int _75 = _67 + 6144;
    uint _78 = uint(int(uint(_75) >> uint(2)));
    uint _80 = uint(int(uint(int(_78)) >> uint(2)));
    int _82 = int(_78) & 3;
    float _84 = (*spvDescriptorSet0.fp_c4)._m0[int(_80)][_82];
    int _86 = int(_78) + 1;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    int _90 = _86 & 3;
    float _92 = (*spvDescriptorSet0.fp_c4)._m0[int(_88)][_90];
    int _94 = _67 + 6152;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.fp_c4)._m0[int(_98)][_100];
    float _104 = _69 * _52;
    int _106 = _67 + 6200;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c4)._m0[int(_110)][_112];
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _118 = _92 + _116;
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _122 = _84 + _120;
    int _124 = _73 + (-4);
    uint _126 = uint(int(uint(_124) >> uint(2)));
    uint _128 = uint(int(uint(int(_126)) >> uint(2)));
    int _130 = int(_126) & 3;
    float _132 = (*spvDescriptorSet0.fp_c4)._m0[int(_128)][_130];
    float _134 = _118 * _118;
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _138 = _102 + _136;
    float _140 = fma(_122, _122, _134);
    int _142 = _73 + 24;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    uint _146 = uint(int(uint(int(_144)) >> uint(2)));
    int _148 = int(_144) & 3;
    float _150 = (*spvDescriptorSet0.fp_c4)._m0[int(_146)][_148];
    bool _154 = _104 >= _114;
    bool _156 = isnan(_104);
    bool _158 = _154 || _156;
    bool _160 = isnan(_114);
    bool _162 = _158 || _160;
    float _164 = fma(_138, _138, _140);
    int _166 = _73 + 16;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    uint _170 = uint(int(uint(int(_168)) >> uint(2)));
    int _172 = int(_168) & 3;
    float _174 = (*spvDescriptorSet0.fp_c4)._m0[int(_170)][_172];
    int _176 = int(_168) + 1;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    int _180 = _176 & 3;
    float _182 = (*spvDescriptorSet0.fp_c4)._m0[int(_178)][_180];
    float _184 = rsqrt(_164);
    int _186 = _73 + 8;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    uint _190 = uint(int(uint(int(_188)) >> uint(2)));
    int _192 = int(_188) & 3;
    float _194 = (*spvDescriptorSet0.fp_c4)._m0[int(_190)][_192];
    uint _196 = 0u;
    float _198 = _104;
    if (!_162)
    {
        int _200 = as_type<int>(_44) << 6;
        int _202 = _200 + 6204;
        _196 = uint(_202);
    }
    uint _204 = _196;
    float _206 = 0.0;
    if (!_162)
    {
        uint _208 = uint(int(uint(int(_204)) >> uint(2)));
        uint _210 = uint(int(uint(int(_208)) >> uint(2)));
        int _212 = int(_208) & 3;
        float _214 = (*spvDescriptorSet0.fp_c4)._m0[int(_210)][_212];
        _206 = _214;
    }
    float _216 = _206;
    float _218 = _122 * _184;
    float _220 = _118 * _184;
    float _222 = _138 * _184;
    int _224 = _73 + 32;
    uint _226 = uint(int(uint(_224) >> uint(2)));
    uint _228 = uint(int(uint(int(_226)) >> uint(2)));
    int _230 = int(_226) & 3;
    float _232 = (*spvDescriptorSet0.fp_c4)._m0[int(_228)][_230];
    int _234 = int(_226) + 1;
    uint _236 = uint(int(uint(_234) >> uint(2)));
    int _238 = _234 & 3;
    float _240 = (*spvDescriptorSet0.fp_c4)._m0[int(_236)][_238];
    float _242 = _218 * _174;
    float _244 = _69 * _58;
    float _246 = _132 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _69 * _64;
    float _252 = -_220;
    float _254 = -_242;
    float _256 = fma(_252, _182, _254);
    float _258 = _248 * _244;
    uint _260 = uint(int(uint(_73) >> uint(2)));
    uint _262 = uint(int(uint(int(_260)) >> uint(2)));
    int _264 = int(_260) & 3;
    float _266 = (*spvDescriptorSet0.fp_c4)._m0[int(_262)][_264];
    int _268 = int(_260) + 1;
    uint _270 = uint(int(uint(_268) >> uint(2)));
    int _272 = _268 & 3;
    float _274 = (*spvDescriptorSet0.fp_c4)._m0[int(_270)][_272];
    float _276 = -_222;
    float _278 = fma(_276, _150, _256);
    float _280 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _282 = _250 + _280;
    float _284 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _286 = _250 + _284;
    float _288 = _250;
    if (_162)
    {
        _288 = 1.0;
    }
    float _290 = _288;
    float _292 = _282 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = _286 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = _290;
    if (!_162)
    {
        float _302 = _104 * _216;
        _198 = _302;
    }
    float _304 = _198;
    float _306 = _294 * _258;
    float _308 = _298 * _258;
    if (!_162)
    {
        float _310 = _304 * _304;
        _300 = _310;
    }
    float _312 = _300;
    float _314 = -_232;
    float _316 = _278 + _314;
    float _318 = _306 * _312;
    float _320 = _308 * _312;
    float _322 = _316 * _240;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = _324 * _266;
    float _328 = _324 * _274;
    float _330 = _324 * _194;
    float _332 = _326 * _318;
    float _334 = _328 * _318;
    float _336 = _330 * _318;
    float _338 = _326 * _320;
    float _340 = _328 * _320;
    float _342 = _330 * _320;
    out.m_35.x = _332;
    out.m_35.y = _334;
    out.m_35.z = _336;
    out.m_35.w = 1.0;
    out.m_37.x = _338;
    out.m_37.y = _340;
    out.m_37.z = _342;
    out.m_37.w = 1.0;
    return out;
}

