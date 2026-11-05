#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
};

struct main0_in
{
    float4 m_28 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_32 [[user(locn3)]];
    float4 m_30 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _50 = gl_FragCoord.w;
    float _52 = in.m_28.w;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_30.w;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_32.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _50;
    float _72 = _70 * _56;
    float _74 = _70 * _62;
    float _76 = _70 * _68;
    float _78 = _72 * _74;
    float _80 = 0.0 + _78;
    float _82 = precise::clamp(_80, 0.0, 1.0);
    float _84 = _82 * _76;
    bool _88 = _84 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _90 = isnan(_84);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _96 = _92 || _94;
    float _98 = in.m_28.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_28.z;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_34.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_28.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_34.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_34.z;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_30.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    if (!_96)
    {
        discard_fragment();
    }
    float _140 = in.m_30.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_30.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _70 * _102;
    float _154 = _70 * _108;
    float _156 = _70 * _114;
    float _158 = _70 * _120;
    float _160 = _70 * _126;
    float _162 = _70 * _132;
    float _164 = _152 + _156;
    float _166 = _70 * _138;
    float _168 = _158 + _160;
    float _170 = _154 + _162;
    float _172 = _164 * _166;
    float _174 = _70 * _144;
    float _176 = _70 * _150;
    float _178 = _168 * _174;
    float _180 = _170 * _176;
    if (!_96)
    {
        out.m_37.x = _172;
        out.m_37.y = _178;
        out.m_37.z = _180;
        out.m_37.w = _78;
        return out;
    }
    float _182 = in.m_39.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = _70 * _186;
    bool _190 = _188 != 1.0;
    bool _192 = isnan(_188);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.0);
    bool _198 = _194 || _196;
    bool _200 = !_198;
    if (!_200)
    {
        float _202 = gl_FragCoord.x;
        float _204 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _206 = _202 / _204;
        float _208 = gl_FragCoord.y;
        float _210 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _212 = _208 / _210;
        float _214 = _188 * 256.0;
        float _216 = trunc(_214);
        int _219 = int(_216);
        uint _222 = uint(int(uint(_219) >> uint(7)));
        int _224 = int(_222) + _219;
        float _226 = trunc(_206);
        int _228 = int(_226);
        float _230 = trunc(_212);
        int _232 = int(_230);
        int _234 = _228 + 2;
        int _236 = _234 >> 1;
        uint _238 = uint(int(uint(_232) >> uint(1)));
        int _240 = _236 ^ int(_238);
        int _242 = _240 << 16;
        int _244 = _242 ^ _236;
        int _246 = 983055 & _244;
        int _248 = _246 << 6;
        int _250 = _248 + _246;
        int _252 = _250 & 13369548;
        uint _254 = uint(int(uint(_252) >> uint(3)));
        int _256 = _252 | int(_254);
        int _258 = _256 & 5570560;
        int _260 = _256 & 85;
        uint _262 = uint(int(uint(_258) >> uint(15)));
        int _264 = int(_262) + _260;
        bool _266 = uint(_224) > uint(_264);
        if (!_266)
        {
            discard_fragment();
        }
        if (!_266)
        {
            out.m_37.x = _172;
            out.m_37.y = _178;
            out.m_37.z = _180;
            out.m_37.w = _84;
            return out;
        }
    }
    float _268 = _178 * 0.715200006961822509765625;
    float _270 = in.m_41.w;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_41.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_41.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = fma(_172, 0.2125999927520751953125, _268);
    float _290 = in.m_41.y;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = fma(_180, 0.072200000286102294921875, _288);
    bool _298 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _300 = 1.0 / _296;
    float _302 = _300 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = fma(_304, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _308 = _70 * _274;
    float _310 = 0.0 + _84;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = _70 * _280;
    float _316 = _70 * _294;
    float _318 = _306 * _308;
    float _320 = _70 * _286;
    float _322 = fma(_180, _318, _314);
    float _324 = fma(_172, _318, _320);
    float _326 = fma(_178, _318, _316);
    float _328 = _314;
    if (!_298)
    {
        _328 = _312;
    }
    float _330 = _328;
    bool _332 = !_298;
    float _334 = _330;
    if (!_332)
    {
        float _336 = in.m_43.w;
        float _338 = gl_FragCoord.w;
        float _340 = _336 * _338;
        float _342 = in.m_43.z;
        float _344 = gl_FragCoord.w;
        float _346 = _342 * _344;
        float _348 = _70 * _340;
        float _350 = _70 * _346;
        float _352 = 1.0 / _348;
        float _354 = _350 * _352;
        float _356 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _358 = fma(_354, (*spvDescriptorSet0.fp_c8)._m0[30].w, _356);
        float _360 = 1.0 / _358;
        float _362 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _364 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _366 = fma(_360, _362, _364);
        float _368 = _366 * 8.0;
        float _370 = precise::clamp(_368, 0.0, 1.0);
        float _372 = _312 * _370;
        _334 = _372;
    }
    float _374 = _334;
    float _376 = 0.0 + _374;
    float _378 = precise::clamp(_376, 0.0, 1.0);
    out.m_37.x = _324;
    out.m_37.y = _326;
    out.m_37.z = _322;
    out.m_37.w = _378;
    return out;
}

