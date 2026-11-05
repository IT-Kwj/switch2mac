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
    constant _16* fp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_25 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _36 = gl_FragCoord.x;
    float _38 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _40 = _36 / _38;
    float _42 = trunc(_34);
    int _45 = int(_42);
    float _47 = float(uint(_45));
    float _49 = trunc(_40);
    int _51 = int(_49);
    int _53 = -_45;
    float _55 = 1.0 / _47;
    float _57 = float(uint(_51));
    int _59 = as_type<int>(_55) + (-2);
    float _61 = as_type<float>(_59) * _57;
    float _63 = trunc(_61);
    float _65 = precise::max(_63, 0.0);
    uint _68 = uint(_65);
    int _70 = _53 * int(_68);
    int _72 = _70 + _51;
    float _74 = float(uint(_72));
    int _76 = -_45;
    float _78 = as_type<float>(_59) * _74;
    float _80 = trunc(_78);
    float _82 = precise::max(_80, 0.0);
    uint _84 = uint(_82);
    int _86 = int(_68) + int(_84);
    int _88 = _76 * _86;
    int _90 = _88 + _51;
    bool _94 = uint(_90) >= uint(_45);
    bool _96 = !_94;
    int _98 = _96 ? 0 : (-1);
    bool _100 = _45 == 0;
    int _102 = -_86;
    int _104 = _98 + _102;
    float _106 = gl_FragCoord.y;
    float _108 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _110 = _106 / _108;
    int _112 = _45 * _104;
    int _114 = _112 + _51;
    float _116 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _118 = !_100;
    int _120 = _118 ? _114 : (-1);
    bool _122 = _120 != 0;
    float _124 = trunc(_116);
    int _126 = int(_124);
    bool _128 = _100;
    int _130 = _45;
    bool _132 = _122;
    if (!_122)
    {
        _128 = false;
    }
    bool _134 = _128;
    bool _136 = !_122;
    bool _138 = _134;
    if (!_136)
    {
        float _140 = float(uint(_126));
        float _142 = trunc(_110);
        int _144 = int(_142);
        int _146 = -_126;
        float _148 = 1.0 / _140;
        float _150 = float(uint(_144));
        int _152 = as_type<int>(_148) + (-2);
        float _154 = as_type<float>(_152) * _150;
        float _156 = trunc(_154);
        float _158 = precise::max(_156, 0.0);
        uint _160 = uint(_158);
        int _162 = _146 * int(_160);
        int _164 = _162 + _144;
        float _166 = float(uint(_164));
        int _168 = -_126;
        float _170 = as_type<float>(_152) * _166;
        float _172 = trunc(_170);
        float _174 = precise::max(_172, 0.0);
        uint _176 = uint(_174);
        int _178 = int(_160) + int(_176);
        int _180 = _168 * _178;
        int _182 = _180 + _144;
        bool _184 = uint(_182) >= uint(_126);
        bool _186 = !_184;
        int _188 = _186 ? 0 : (-1);
        bool _190 = _126 == 0;
        int _192 = -_178;
        int _194 = _188 + _192;
        int _196 = _126 * _194;
        int _198 = _196 + _144;
        bool _200 = !_190;
        int _202 = _200 ? _198 : (-1);
        bool _204 = _202 != 0;
        _138 = _204;
    }
    bool _206 = _138;
    if (_206)
    {
        int _208 = _45 + (-1);
        _130 = _208;
    }
    int _210 = _130;
    bool _212 = _120 != _210;
    bool _214 = _212 && _206;
    if (!_214)
    {
        _132 = false;
    }
    bool _216 = _132;
    bool _218 = !_214;
    bool _220 = _216;
    if (!_218)
    {
        float _222 = float(uint(_126));
        float _224 = trunc(_110);
        int _226 = int(_224);
        int _228 = -_126;
        float _230 = 1.0 / _222;
        float _232 = float(uint(_226));
        int _234 = as_type<int>(_230) + (-2);
        int _236 = -_126;
        float _238 = as_type<float>(_234) * _232;
        float _240 = trunc(_238);
        float _242 = precise::max(_240, 0.0);
        uint _244 = uint(_242);
        int _246 = _228 * int(_244);
        int _248 = _246 + _226;
        float _250 = float(uint(_248));
        float _252 = as_type<float>(_234) * _250;
        float _254 = trunc(_252);
        float _256 = precise::max(_254, 0.0);
        uint _258 = uint(_256);
        int _260 = int(_244) + int(_258);
        int _262 = _236 * _260;
        int _264 = _262 + _226;
        bool _266 = uint(_264) >= uint(_126);
        bool _268 = !_266;
        int _270 = _268 ? 0 : (-1);
        bool _272 = _126 == 0;
        int _274 = -_260;
        int _276 = _270 + _274;
        int _278 = _126 * _276;
        int _280 = _278 + _226;
        int _282 = _126 + (-1);
        bool _284 = !_272;
        int _286 = _284 ? _280 : (-1);
        bool _288 = _286 != _282;
        _220 = _288;
    }
    bool _290 = _220;
    if (_290)
    {
        discard_fragment();
    }
    if (_290)
    {
        out.m_25.x = 0.0;
        out.m_25.y = 0.0;
        out.m_25.z = 0.0;
        out.m_25.w = 0.0;
        return out;
    }
    float _292 = gl_FragCoord.w;
    float _294 = in.m_27.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_27.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_27.z;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_27.w;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = 1.0 / _292;
    float _320 = _318 * _298;
    float _322 = _318 * _304;
    float _324 = _318 * _310;
    float _326 = _318 * _316;
    out.m_25.x = _320;
    out.m_25.y = _322;
    out.m_25.z = _324;
    out.m_25.w = _326;
    return out;
}

