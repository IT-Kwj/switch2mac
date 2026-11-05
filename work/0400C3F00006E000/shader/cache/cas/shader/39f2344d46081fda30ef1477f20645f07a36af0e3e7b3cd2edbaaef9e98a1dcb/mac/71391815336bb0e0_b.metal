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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
};

struct main0_in
{
    float4 m_28 [[user(locn0)]];
    float4 m_30 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_26 [[user(locn4)]];
    float4 m_32 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_26.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_26.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_26.z;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_28.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_30.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_28.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_32.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_30.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_28.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_30.z;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_34.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = 1.0 / _48;
    float _118 = _116 * _54;
    float _120 = _116 * _60;
    float _122 = _116 * _66;
    float _124 = _118 * _118;
    float _126 = fma(_120, _120, _124);
    float _128 = fma(_122, _122, _126);
    float _130 = rsqrt(_128);
    float _132 = _118 * _130;
    float _134 = _120 * _130;
    float _136 = _122 * _130;
    float _138 = _132 * _132;
    float _140 = fma(_134, _134, _138);
    float _142 = fma(_136, _136, _140);
    float _144 = rsqrt(_142);
    float _146 = _132 * _144;
    float _148 = _134 * _144;
    float _150 = _136 * _144;
    float _152 = _146 * _146;
    float _154 = fma(_148, _148, _152);
    float _156 = _116 * _72;
    float _158 = fma(_150, _150, _154);
    float _160 = rsqrt(_158);
    float _162 = _146 * _160;
    float _164 = _116 * _78;
    float _166 = _150 * _160;
    float _168 = _162 * (-0.816474258899688720703125);
    float _170 = _156 + _164;
    float _172 = _116 * _84;
    float _174 = _116 * _90;
    float _176 = -_168;
    float _178 = fma(_166, 0.577381789684295654296875, _176);
    float _180 = _116 * _96;
    float _182 = _116 * _102;
    float _184 = _116 * _108;
    bool _188 = _174 != 1.0;
    bool _190 = isnan(_174);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.0);
    bool _196 = _192 || _194;
    float _198 = fma(_178, 0.5, 0.5);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _172 + _180;
    float _204 = _182 + _184;
    float _206 = fma(_200, 1.2000000476837158203125, 0.4000000059604644775390625);
    float _208 = _202 * _206;
    float _210 = _170 * _206;
    float _212 = _204 * _206;
    float _214 = _116 * _114;
    bool _216 = !_196;
    if (!_216)
    {
        float _218 = gl_FragCoord.x;
        float _220 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _222 = _218 / _220;
        float _224 = gl_FragCoord.y;
        float _226 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _228 = _224 / _226;
        float _230 = trunc(_222);
        int _233 = int(_230);
        float _235 = trunc(_228);
        int _237 = int(_235);
        int _239 = _233 + 2;
        int _241 = _239 >> 1;
        uint _244 = uint(int(uint(_237) >> uint(1)));
        int _246 = _241 ^ int(_244);
        int _248 = _246 << 16;
        int _250 = _248 ^ _241;
        int _252 = 983055 & _250;
        float _254 = _174 * 256.0;
        int _256 = _252 << 6;
        int _258 = _256 + _252;
        float _260 = trunc(_254);
        int _262 = int(_260);
        int _264 = _258 & 13369548;
        uint _266 = uint(int(uint(_264) >> uint(3)));
        int _268 = _264 | int(_266);
        int _270 = _268 & 5570560;
        int _272 = _268 & 85;
        uint _274 = uint(int(uint(_262) >> uint(7)));
        int _276 = int(_274) + _262;
        uint _278 = uint(int(uint(_270) >> uint(15)));
        int _280 = int(_278) + _272;
        bool _282 = uint(_276) > uint(_280);
        if (!_282)
        {
            discard_fragment();
        }
        if (!_282)
        {
            out.m_37.x = _210;
            out.m_37.y = _208;
            out.m_37.z = _212;
            out.m_37.w = _214;
            return out;
        }
    }
    float _284 = _208 * 0.715200006961822509765625;
    float _286 = in.m_39.w;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_39.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_39.y;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = fma(_210, 0.2125999927520751953125, _284);
    float _306 = in.m_39.z;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = fma(_212, 0.072200000286102294921875, _304);
    bool _314 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _316 = 0.0 + _214;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    float _320 = 1.0 / _312;
    float _322 = _320 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = fma(_324, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _328 = _116 * _290;
    float _330 = _116 * _296;
    float _332 = _326 * _328;
    float _334 = _116 * _302;
    float _336 = _116 * _310;
    float _338 = fma(_210, _332, _330);
    float _340 = fma(_208, _332, _334);
    float _342 = fma(_212, _332, _336);
    float _344 = _330;
    if (!_314)
    {
        _344 = _318;
    }
    float _346 = _344;
    bool _348 = !_314;
    float _350 = _346;
    if (!_348)
    {
        float _352 = in.m_41.w;
        float _354 = gl_FragCoord.w;
        float _356 = _352 * _354;
        float _358 = in.m_41.z;
        float _360 = gl_FragCoord.w;
        float _362 = _358 * _360;
        float _364 = _116 * _356;
        float _366 = _116 * _362;
        float _368 = 1.0 / _364;
        float _370 = _366 * _368;
        float _372 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _374 = fma(_370, (*spvDescriptorSet0.fp_c8)._m0[30].w, _372);
        float _376 = 1.0 / _374;
        float _378 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _380 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _382 = fma(_376, _378, _380);
        float _384 = _382 * 8.0;
        float _386 = precise::clamp(_384, 0.0, 1.0);
        float _388 = _318 * _386;
        _350 = _388;
    }
    float _390 = _350;
    float _392 = 0.0 + _390;
    float _394 = precise::clamp(_392, 0.0, 1.0);
    out.m_37.x = _338;
    out.m_37.y = _340;
    out.m_37.z = _342;
    out.m_37.w = _394;
    return out;
}

