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
};

struct main0_out
{
    float4 m_33 [[color(0)]];
};

struct main0_in
{
    float4 m_26 [[user(locn0)]];
    float4 m_30 [[user(locn2)]];
    float4 m_28 [[user(locn3)]];
    float4 m_24 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_24.w;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_26.w;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_28.w;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_26.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_28.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_26.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_28.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_26.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_28.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_30.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = 1.0 / _42;
    float _106 = _104 * _48;
    float _108 = _104 * _54;
    float _110 = _104 * _60;
    float _112 = _104 * _72;
    float _114 = _104 * _96;
    bool _118 = _106 != 1.0;
    bool _120 = isnan(_106);
    bool _122 = _118 || _120;
    bool _124 = isnan(1.0);
    bool _126 = _122 || _124;
    float _128 = _108 * _110;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = _104 * _66;
    float _134 = _104 * _78;
    float _136 = _104 * _84;
    float _138 = _104 * _90;
    float _140 = _104 * _102;
    float _142 = _132 * _112;
    float _144 = _134 * _136;
    float _146 = _138 * _114;
    float _148 = _130 * _140;
    bool _150 = !_126;
    if (!_150)
    {
        float _152 = gl_FragCoord.x;
        float _154 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _156 = _152 / _154;
        float _158 = gl_FragCoord.y;
        float _160 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _162 = _158 / _160;
        float _164 = trunc(_156);
        int _167 = int(_164);
        float _169 = trunc(_162);
        int _171 = int(_169);
        int _173 = _167 + 2;
        int _175 = _173 >> 1;
        uint _178 = uint(int(uint(_171) >> uint(1)));
        int _180 = _175 ^ int(_178);
        int _182 = _180 << 16;
        int _184 = _182 ^ _175;
        int _186 = 983055 & _184;
        float _188 = _106 * 256.0;
        int _190 = _186 << 6;
        int _192 = _190 + _186;
        float _194 = trunc(_188);
        int _196 = int(_194);
        int _198 = _192 & 13369548;
        uint _200 = uint(int(uint(_198) >> uint(3)));
        int _202 = _198 | int(_200);
        int _204 = _202 & 5570560;
        int _206 = _202 & 85;
        uint _208 = uint(int(uint(_196) >> uint(7)));
        int _210 = int(_208) + _196;
        uint _212 = uint(int(uint(_204) >> uint(15)));
        int _214 = int(_212) + _206;
        bool _216 = uint(_210) > uint(_214);
        if (!_216)
        {
            discard_fragment();
        }
        if (!_216)
        {
            out.m_33.x = _142;
            out.m_33.y = _144;
            out.m_33.z = _146;
            out.m_33.w = _148;
            return out;
        }
    }
    float _218 = _144 * 0.715200006961822509765625;
    float _220 = in.m_35.w;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_35.x;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_35.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = fma(_142, 0.2125999927520751953125, _218);
    float _240 = in.m_35.z;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = 0.0 + _148;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = fma(_146, 0.072200000286102294921875, _238);
    float _252 = 1.0 / _250;
    float _254 = _252 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _104 * _224;
    float _260 = fma(_256, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _262 = _260 * _258;
    float _264 = _104 * _230;
    float _266 = _104 * _236;
    float _268 = _104 * _244;
    float _270 = fma(_142, _262, _264);
    float _272 = fma(_144, _262, _266);
    float _274 = fma(_146, _262, _268);
    out.m_33.x = _270;
    out.m_33.y = _272;
    out.m_33.z = _274;
    out.m_33.w = _248;
    return out;
}

