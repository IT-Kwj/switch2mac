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
    float4 m_31 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_25 [[user(locn3)]];
    float4 m_29 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_27 [[user(locn7)]];
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _154 = false;
    bool _138 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_22.x;
    float _51 = in.m_22.y;
    bool _55 = _49 > 0.0;
    bool _57 = _51 > 0.0;
    bool _59 = _49 >= 0.0;
    bool _61 = isnan(_49);
    bool _63 = _59 || _61;
    bool _65 = isnan(0.0);
    bool _67 = _63 || _65;
    bool _69 = _51 >= 0.0;
    bool _71 = isnan(_51);
    bool _73 = _69 || _71;
    bool _75 = isnan(0.0);
    bool _77 = _73 || _75;
    int _80 = _67 ? 0 : 1;
    float _82 = _77 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _84 = ~_80;
    int _86 = _84 + 1;
    int _88 = _86 + 1;
    int _90 = ~as_type<int>(_82);
    int _92 = _90 + 1;
    int _94 = _92 + 1;
    int _96 = _88;
    int _98 = _94;
    int _100 = _80;
    float _102 = _82;
    if (!_55)
    {
        int _104 = ~_80;
        int _106 = _104 + 1;
        _96 = _106;
    }
    int _108 = _96;
    if (!_57)
    {
        int _110 = ~as_type<int>(_82);
        int _112 = _110 + 1;
        _98 = _112;
    }
    int _114 = _98;
    float _116 = float(_108);
    float _118 = float(_114);
    out.gl_Position.x = _116;
    out.gl_Position.y = _118;
    bool _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 3;
    bool _122 = !_120;
    float _124 = as_type<float>(_114);
    int _126 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y);
    float _140;
    float _142;
    float _144;
    int _146;
    int _148;
    float _150;
    float _152;
    if (!_122)
    {
        bool _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 4;
        bool _130 = !_128;
        if (!_130)
        {
            bool _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 5;
            bool _134 = !_132;
            if (!_134)
            {
                bool _136 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 5;
                _138 = _136;
                if (!_138)
                {
                    _140 = 0.0;
                    _142 = 1.0;
                    _144 = 0.0;
                    _146 = 0;
                    _148 = -1082130432;
                    _150 = 0.0;
                    _152 = -1.0;
                    _154 = true;
                }
            }
            else
            {
                _140 = 0.0;
                _142 = 1.0;
                _144 = 0.0;
                _146 = 0;
                _148 = 1065353216;
                _150 = 0.0;
                _152 = 1.0;
                _154 = true;
            }
        }
        else
        {
            _140 = 1.0;
            _142 = 0.0;
            _144 = -1.0;
            _146 = 0;
            _148 = 0;
            _150 = 0.0;
            _152 = 1.0;
            _154 = true;
        }
    }
    if ((!_154) || _138)
    {
        bool _156;
        if (!_138)
        {
            _156 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 2;
        }
        if ((!_156) || _138)
        {
            if (!_138)
            {
                bool _158 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 1;
                float _160 = 0.0;
                if (!_158)
                {
                    _160 = 1.0;
                }
                float _162 = _160;
                _150 = _162;
                if (!_158)
                {
                    _100 = 0;
                    _102 = 0.0;
                }
                int _164 = _100;
                float _166 = _102;
                float _168 = 0.0;
                _148 = _164;
                _152 = _166;
                if (!_158)
                {
                    _168 = 0.0;
                }
                float _170 = _168;
                float _172 = 0.0;
                _140 = _170;
                if (!_158)
                {
                    _172 = 1.0;
                }
                float _174 = _172;
                _142 = _174;
                if (!_158)
                {
                    _124 = 0.0;
                }
                float _176 = _124;
                _144 = _176;
                if (!_158)
                {
                    _126 = -1082130432;
                }
                int _178 = _126;
                bool _180 = !_158;
                _146 = _178;
                _154 = _180;
            }
            if ((!_154) || _138)
            {
                _138 = false;
                _140 = 0.0;
                _142 = 1.0;
                _144 = 0.0;
                _146 = 1065353216;
                _148 = 0;
                _150 = -1.0;
                _152 = 0.0;
                _154 = true;
            }
        }
        else
        {
            _140 = -1.0;
            _142 = 0.0;
            _144 = 1.0;
            _146 = 0;
            _148 = 0;
            _150 = 0.0;
            _152 = 1.0;
        }
    }
    _154 = false;
    float _182 = _140;
    float _184 = _142;
    float _186 = _144;
    int _188 = _146;
    int _190 = _148;
    float _192 = _150;
    float _194 = _152;
    float _196 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _198 = _118 * _182;
    float _200 = fma(_118, _184, _186);
    out.m_25.x = as_type<float>(_188);
    out.m_25.y = _186;
    out.m_25.z = as_type<float>(_190);
    float _202 = fma(_116, _192, _198);
    float _204 = _200 * _200;
    float _206 = _202 + as_type<float>(_190);
    float _208 = _196 * 1.57079637050628662109375;
    float _210 = _208 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _212 = _210 * 0.300000011920928955078125;
    float _214 = _210 * 1.07140004634857177734375;
    float _216 = _212 * 0.15915493667125701904296875;
    float _218 = _214 * 0.15915493667125701904296875;
    float _220 = _216 * 6.283185482025146484375;
    float _222 = cos(_220);
    float _224 = _216 * 6.283185482025146484375;
    float _226 = sin(_224);
    float _228 = _218 * 6.283185482025146484375;
    float _230 = cos(_228);
    float _232 = _222 * _222;
    float _234 = fma(_116, _194, as_type<float>(_188));
    float _236 = _218 * 6.283185482025146484375;
    float _238 = sin(_236);
    float _240 = fma(_226, _226, _232);
    float _242 = _230 * _230;
    float _244 = rsqrt(_240);
    float _246 = fma(_234, _234, _204);
    float _248 = fma(_206, _206, _246);
    float _250 = fma(_238, _238, _242);
    float _252 = rsqrt(_248);
    float _254 = _244 + _244;
    float _256 = rsqrt(_250);
    float _258 = _222 * _244;
    float _260 = _226 * _244;
    float _262 = _226 * _254;
    float _264 = _256 + _256;
    float _266 = _230 * _256;
    float _268 = _238 * _256;
    float _270 = _238 * _264;
    float _272 = -_260;
    float _274 = -_260;
    float _276 = _272 + _274;
    float _278 = -_268;
    float _280 = -_268;
    float _282 = _278 + _280;
    float _284 = _260 * _260;
    float _286 = _268 * _268;
    float _288 = _258 * _276;
    float _290 = _266 * _282;
    float _292 = -_284;
    float _294 = fma(_258, _258, _292);
    float _296 = _258 * _262;
    float _298 = -_286;
    float _300 = fma(_266, _266, _298);
    float _302 = _266 * _270;
    float _304 = _288 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _306 = _290 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _308 = _296 * (*spvDescriptorSet0.vp_c3)._m0[2].z;
    float _310 = _302 * (*spvDescriptorSet0.vp_c3)._m0[2].z;
    float _312 = _304 * _182;
    float _314 = -_182;
    float _316 = _304 * _314;
    float _318 = _306 * _182;
    float _320 = -_182;
    float _322 = _306 * _320;
    float _324 = fma(_308, _192, _312);
    float _326 = _294 * as_type<float>(_188);
    float _328 = fma(_310, _192, _318);
    float _330 = -_310;
    float _332 = fma(_330, _192, _322);
    float _334 = _234 * _252;
    float _336 = _300 * as_type<float>(_188);
    float _338 = _294 * _186;
    float _340 = -_308;
    float _342 = fma(_340, _192, _316);
    float _344 = _300 * _186;
    float _346 = _200 * _252;
    float _348 = fma(_308, _194, _326);
    float _350 = -_308;
    float _352 = fma(_350, _194, _326);
    float _354 = fma(_310, _194, _336);
    float _356 = _206 * _252;
    float _358 = -_310;
    float _360 = fma(_358, _194, _336);
    float _362 = fma(_304, _184, _338);
    float _364 = -_304;
    float _366 = fma(_364, _184, _338);
    float _368 = fma(_306, _184, _344);
    float _370 = -_306;
    float _372 = fma(_370, _184, _344);
    float _374 = fma(_294, as_type<float>(_190), _324);
    float _376 = fma(_294, as_type<float>(_190), _342);
    float _378 = fma(_300, as_type<float>(_190), _328);
    float _380 = fma(_300, as_type<float>(_190), _332);
    out.m_27.x = _334;
    out.m_27.y = _346;
    out.m_27.z = _356;
    out.m_29.x = _348;
    out.m_29.y = _362;
    out.m_29.z = _374;
    out.m_31.x = _352;
    out.m_31.y = _366;
    out.m_31.z = _376;
    out.m_33.x = _354;
    out.m_33.y = _368;
    out.m_33.z = _378;
    out.m_35.x = _360;
    out.m_35.y = _372;
    out.m_35.z = _380;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _154 = false;
    bool _138 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_22.x;
    float _51 = in.m_22.y;
    bool _55 = _49 > 0.0;
    bool _57 = _51 > 0.0;
    bool _59 = _49 >= 0.0;
    bool _61 = isnan(_49);
    bool _63 = _59 || _61;
    bool _65 = isnan(0.0);
    bool _67 = _63 || _65;
    bool _69 = _51 >= 0.0;
    bool _71 = isnan(_51);
    bool _73 = _69 || _71;
    bool _75 = isnan(0.0);
    bool _77 = _73 || _75;
    int _80 = _67 ? 0 : 1;
    float _82 = _77 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _84 = ~_80;
    int _86 = _84 + 1;
    int _88 = _86 + 1;
    int _90 = ~as_type<int>(_82);
    int _92 = _90 + 1;
    int _94 = _92 + 1;
    int _96 = _88;
    int _98 = _94;
    int _100 = _80;
    float _102 = _82;
    if (!_55)
    {
        int _104 = ~_80;
        int _106 = _104 + 1;
        _96 = _106;
    }
    int _108 = _96;
    if (!_57)
    {
        int _110 = ~as_type<int>(_82);
        int _112 = _110 + 1;
        _98 = _112;
    }
    int _114 = _98;
    float _116 = float(_108);
    float _118 = float(_114);
    out.gl_Position.x = _116;
    out.gl_Position.y = _118;
    bool _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 3;
    bool _122 = !_120;
    float _124 = as_type<float>(_114);
    int _126 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y);
    float _140;
    float _142;
    float _144;
    int _146;
    int _148;
    float _150;
    float _152;
    if (!_122)
    {
        bool _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 4;
        bool _130 = !_128;
        if (!_130)
        {
            bool _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 5;
            bool _134 = !_132;
            if (!_134)
            {
                bool _136 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 5;
                _138 = _136;
                if (!_138)
                {
                    _140 = 0.0;
                    _142 = 1.0;
                    _144 = 0.0;
                    _146 = 0;
                    _148 = -1082130432;
                    _150 = 0.0;
                    _152 = -1.0;
                    _154 = true;
                }
            }
            else
            {
                _140 = 0.0;
                _142 = 1.0;
                _144 = 0.0;
                _146 = 0;
                _148 = 1065353216;
                _150 = 0.0;
                _152 = 1.0;
                _154 = true;
            }
        }
        else
        {
            _140 = 1.0;
            _142 = 0.0;
            _144 = -1.0;
            _146 = 0;
            _148 = 0;
            _150 = 0.0;
            _152 = 1.0;
            _154 = true;
        }
    }
    if ((!_154) || _138)
    {
        bool _156;
        if (!_138)
        {
            _156 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 2;
        }
        if ((!_156) || _138)
        {
            if (!_138)
            {
                bool _158 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 1;
                float _160 = 0.0;
                if (!_158)
                {
                    _160 = 1.0;
                }
                float _162 = _160;
                _150 = _162;
                if (!_158)
                {
                    _100 = 0;
                    _102 = 0.0;
                }
                int _164 = _100;
                float _166 = _102;
                float _168 = 0.0;
                _148 = _164;
                _152 = _166;
                if (!_158)
                {
                    _168 = 0.0;
                }
                float _170 = _168;
                float _172 = 0.0;
                _140 = _170;
                if (!_158)
                {
                    _172 = 1.0;
                }
                float _174 = _172;
                _142 = _174;
                if (!_158)
                {
                    _124 = 0.0;
                }
                float _176 = _124;
                _144 = _176;
                if (!_158)
                {
                    _126 = -1082130432;
                }
                int _178 = _126;
                bool _180 = !_158;
                _146 = _178;
                _154 = _180;
            }
            if ((!_154) || _138)
            {
                _138 = false;
                _140 = 0.0;
                _142 = 1.0;
                _144 = 0.0;
                _146 = 1065353216;
                _148 = 0;
                _150 = -1.0;
                _152 = 0.0;
                _154 = true;
            }
        }
        else
        {
            _140 = -1.0;
            _142 = 0.0;
            _144 = 1.0;
            _146 = 0;
            _148 = 0;
            _150 = 0.0;
            _152 = 1.0;
        }
    }
    _154 = false;
    float _182 = _140;
    float _184 = _142;
    float _186 = _144;
    int _188 = _146;
    int _190 = _148;
    float _192 = _150;
    float _194 = _152;
    float _196 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _198 = _118 * _182;
    float _200 = fma(_118, _184, _186);
    out.m_25.x = as_type<float>(_188);
    out.m_25.y = _186;
    out.m_25.z = as_type<float>(_190);
    float _202 = fma(_116, _192, _198);
    float _204 = _200 * _200;
    float _206 = _202 + as_type<float>(_190);
    float _208 = _196 * 1.57079637050628662109375;
    float _210 = _208 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _212 = _210 * 0.300000011920928955078125;
    float _214 = _210 * 1.07140004634857177734375;
    float _216 = _212 * 0.15915493667125701904296875;
    float _218 = _214 * 0.15915493667125701904296875;
    float _220 = _216 * 6.283185482025146484375;
    float _222 = cos(_220);
    float _224 = _216 * 6.283185482025146484375;
    float _226 = sin(_224);
    float _228 = _218 * 6.283185482025146484375;
    float _230 = cos(_228);
    float _232 = _222 * _222;
    float _234 = fma(_116, _194, as_type<float>(_188));
    float _236 = _218 * 6.283185482025146484375;
    float _238 = sin(_236);
    float _240 = fma(_226, _226, _232);
    float _242 = _230 * _230;
    float _244 = rsqrt(_240);
    float _246 = fma(_234, _234, _204);
    float _248 = fma(_206, _206, _246);
    float _250 = fma(_238, _238, _242);
    float _252 = rsqrt(_248);
    float _254 = _244 + _244;
    float _256 = rsqrt(_250);
    float _258 = _222 * _244;
    float _260 = _226 * _244;
    float _262 = _226 * _254;
    float _264 = _256 + _256;
    float _266 = _230 * _256;
    float _268 = _238 * _256;
    float _270 = _238 * _264;
    float _272 = -_260;
    float _274 = -_260;
    float _276 = _272 + _274;
    float _278 = -_268;
    float _280 = -_268;
    float _282 = _278 + _280;
    float _284 = _260 * _260;
    float _286 = _268 * _268;
    float _288 = _258 * _276;
    float _290 = _266 * _282;
    float _292 = -_284;
    float _294 = fma(_258, _258, _292);
    float _296 = _258 * _262;
    float _298 = -_286;
    float _300 = fma(_266, _266, _298);
    float _302 = _266 * _270;
    float _304 = _288 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _306 = _290 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _308 = _296 * (*spvDescriptorSet0.vp_c3)._m0[2].z;
    float _310 = _302 * (*spvDescriptorSet0.vp_c3)._m0[2].z;
    float _312 = _304 * _182;
    float _314 = -_182;
    float _316 = _304 * _314;
    float _318 = _306 * _182;
    float _320 = -_182;
    float _322 = _306 * _320;
    float _324 = fma(_308, _192, _312);
    float _326 = _294 * as_type<float>(_188);
    float _328 = fma(_310, _192, _318);
    float _330 = -_310;
    float _332 = fma(_330, _192, _322);
    float _334 = _234 * _252;
    float _336 = _300 * as_type<float>(_188);
    float _338 = _294 * _186;
    float _340 = -_308;
    float _342 = fma(_340, _192, _316);
    float _344 = _300 * _186;
    float _346 = _200 * _252;
    float _348 = fma(_308, _194, _326);
    float _350 = -_308;
    float _352 = fma(_350, _194, _326);
    float _354 = fma(_310, _194, _336);
    float _356 = _206 * _252;
    float _358 = -_310;
    float _360 = fma(_358, _194, _336);
    float _362 = fma(_304, _184, _338);
    float _364 = -_304;
    float _366 = fma(_364, _184, _338);
    float _368 = fma(_306, _184, _344);
    float _370 = -_306;
    float _372 = fma(_370, _184, _344);
    float _374 = fma(_294, as_type<float>(_190), _324);
    float _376 = fma(_294, as_type<float>(_190), _342);
    float _378 = fma(_300, as_type<float>(_190), _328);
    float _380 = fma(_300, as_type<float>(_190), _332);
    out.m_27.x = _334;
    out.m_27.y = _346;
    out.m_27.z = _356;
    out.m_29.x = _348;
    out.m_29.y = _362;
    out.m_29.z = _374;
    out.m_31.x = _352;
    out.m_31.y = _366;
    out.m_31.z = _376;
    out.m_33.x = _354;
    out.m_33.y = _368;
    out.m_33.z = _378;
    out.m_35.x = _360;
    out.m_35.y = _372;
    out.m_35.z = _380;
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _154 = false;
    bool _138 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_22.x;
    float _51 = in.m_22.y;
    bool _55 = _49 > 0.0;
    bool _57 = _51 > 0.0;
    bool _59 = _49 >= 0.0;
    bool _61 = isnan(_49);
    bool _63 = _59 || _61;
    bool _65 = isnan(0.0);
    bool _67 = _63 || _65;
    bool _69 = _51 >= 0.0;
    bool _71 = isnan(_51);
    bool _73 = _69 || _71;
    bool _75 = isnan(0.0);
    bool _77 = _73 || _75;
    int _80 = _67 ? 0 : 1;
    float _82 = _77 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _84 = ~_80;
    int _86 = _84 + 1;
    int _88 = _86 + 1;
    int _90 = ~as_type<int>(_82);
    int _92 = _90 + 1;
    int _94 = _92 + 1;
    int _96 = _88;
    int _98 = _94;
    int _100 = _80;
    float _102 = _82;
    if (!_55)
    {
        int _104 = ~_80;
        int _106 = _104 + 1;
        _96 = _106;
    }
    int _108 = _96;
    if (!_57)
    {
        int _110 = ~as_type<int>(_82);
        int _112 = _110 + 1;
        _98 = _112;
    }
    int _114 = _98;
    float _116 = float(_108);
    float _118 = float(_114);
    out.gl_Position.x = _116;
    out.gl_Position.y = _118;
    bool _120 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 3;
    bool _122 = !_120;
    float _124 = as_type<float>(_114);
    int _126 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y);
    float _140;
    float _142;
    float _144;
    int _146;
    int _148;
    float _150;
    float _152;
    if (!_122)
    {
        bool _128 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 4;
        bool _130 = !_128;
        if (!_130)
        {
            bool _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 5;
            bool _134 = !_132;
            if (!_134)
            {
                bool _136 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 5;
                _138 = _136;
                if (!_138)
                {
                    _140 = 0.0;
                    _142 = 1.0;
                    _144 = 0.0;
                    _146 = 0;
                    _148 = -1082130432;
                    _150 = 0.0;
                    _152 = -1.0;
                    _154 = true;
                }
            }
            else
            {
                _140 = 0.0;
                _142 = 1.0;
                _144 = 0.0;
                _146 = 0;
                _148 = 1065353216;
                _150 = 0.0;
                _152 = 1.0;
                _154 = true;
            }
        }
        else
        {
            _140 = 1.0;
            _142 = 0.0;
            _144 = -1.0;
            _146 = 0;
            _148 = 0;
            _150 = 0.0;
            _152 = 1.0;
            _154 = true;
        }
    }
    if ((!_154) || _138)
    {
        bool _156;
        if (!_138)
        {
            _156 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) >= 2;
        }
        if ((!_156) || _138)
        {
            if (!_138)
            {
                bool _158 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[0].y) != 1;
                float _160 = 0.0;
                if (!_158)
                {
                    _160 = 1.0;
                }
                float _162 = _160;
                _150 = _162;
                if (!_158)
                {
                    _100 = 0;
                    _102 = 0.0;
                }
                int _164 = _100;
                float _166 = _102;
                float _168 = 0.0;
                _148 = _164;
                _152 = _166;
                if (!_158)
                {
                    _168 = 0.0;
                }
                float _170 = _168;
                float _172 = 0.0;
                _140 = _170;
                if (!_158)
                {
                    _172 = 1.0;
                }
                float _174 = _172;
                _142 = _174;
                if (!_158)
                {
                    _124 = 0.0;
                }
                float _176 = _124;
                _144 = _176;
                if (!_158)
                {
                    _126 = -1082130432;
                }
                int _178 = _126;
                bool _180 = !_158;
                _146 = _178;
                _154 = _180;
            }
            if ((!_154) || _138)
            {
                _138 = false;
                _140 = 0.0;
                _142 = 1.0;
                _144 = 0.0;
                _146 = 1065353216;
                _148 = 0;
                _150 = -1.0;
                _152 = 0.0;
                _154 = true;
            }
        }
        else
        {
            _140 = -1.0;
            _142 = 0.0;
            _144 = 1.0;
            _146 = 0;
            _148 = 0;
            _150 = 0.0;
            _152 = 1.0;
        }
    }
    _154 = false;
    float _182 = _140;
    float _184 = _142;
    float _186 = _144;
    int _188 = _146;
    int _190 = _148;
    float _192 = _150;
    float _194 = _152;
    float _196 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _198 = _118 * _182;
    float _200 = fma(_118, _184, _186);
    out.m_25.x = as_type<float>(_188);
    out.m_25.y = _186;
    out.m_25.z = as_type<float>(_190);
    float _202 = fma(_116, _192, _198);
    float _204 = _200 * _200;
    float _206 = _202 + as_type<float>(_190);
    float _208 = _196 * 1.57079637050628662109375;
    float _210 = _208 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _212 = _210 * 0.300000011920928955078125;
    float _214 = _210 * 1.07140004634857177734375;
    float _216 = _212 * 0.15915493667125701904296875;
    float _218 = _214 * 0.15915493667125701904296875;
    float _220 = _216 * 6.283185482025146484375;
    float _222 = cos(_220);
    float _224 = _216 * 6.283185482025146484375;
    float _226 = sin(_224);
    float _228 = _218 * 6.283185482025146484375;
    float _230 = cos(_228);
    float _232 = _222 * _222;
    float _234 = fma(_116, _194, as_type<float>(_188));
    float _236 = _218 * 6.283185482025146484375;
    float _238 = sin(_236);
    float _240 = fma(_226, _226, _232);
    float _242 = _230 * _230;
    float _244 = rsqrt(_240);
    float _246 = fma(_234, _234, _204);
    float _248 = fma(_206, _206, _246);
    float _250 = fma(_238, _238, _242);
    float _252 = rsqrt(_248);
    float _254 = _244 + _244;
    float _256 = rsqrt(_250);
    float _258 = _222 * _244;
    float _260 = _226 * _244;
    float _262 = _226 * _254;
    float _264 = _256 + _256;
    float _266 = _230 * _256;
    float _268 = _238 * _256;
    float _270 = _238 * _264;
    float _272 = -_260;
    float _274 = -_260;
    float _276 = _272 + _274;
    float _278 = -_268;
    float _280 = -_268;
    float _282 = _278 + _280;
    float _284 = _260 * _260;
    float _286 = _268 * _268;
    float _288 = _258 * _276;
    float _290 = _266 * _282;
    float _292 = -_284;
    float _294 = fma(_258, _258, _292);
    float _296 = _258 * _262;
    float _298 = -_286;
    float _300 = fma(_266, _266, _298);
    float _302 = _266 * _270;
    float _304 = _288 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _306 = _290 * (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _308 = _296 * (*spvDescriptorSet0.vp_c3)._m0[2].z;
    float _310 = _302 * (*spvDescriptorSet0.vp_c3)._m0[2].z;
    float _312 = _304 * _182;
    float _314 = -_182;
    float _316 = _304 * _314;
    float _318 = _306 * _182;
    float _320 = -_182;
    float _322 = _306 * _320;
    float _324 = fma(_308, _192, _312);
    float _326 = _294 * as_type<float>(_188);
    float _328 = fma(_310, _192, _318);
    float _330 = -_310;
    float _332 = fma(_330, _192, _322);
    float _334 = _234 * _252;
    float _336 = _300 * as_type<float>(_188);
    float _338 = _294 * _186;
    float _340 = -_308;
    float _342 = fma(_340, _192, _316);
    float _344 = _300 * _186;
    float _346 = _200 * _252;
    float _348 = fma(_308, _194, _326);
    float _350 = -_308;
    float _352 = fma(_350, _194, _326);
    float _354 = fma(_310, _194, _336);
    float _356 = _206 * _252;
    float _358 = -_310;
    float _360 = fma(_358, _194, _336);
    float _362 = fma(_304, _184, _338);
    float _364 = -_304;
    float _366 = fma(_364, _184, _338);
    float _368 = fma(_306, _184, _344);
    float _370 = -_306;
    float _372 = fma(_370, _184, _344);
    float _374 = fma(_294, as_type<float>(_190), _324);
    float _376 = fma(_294, as_type<float>(_190), _342);
    float _378 = fma(_300, as_type<float>(_190), _328);
    float _380 = fma(_300, as_type<float>(_190), _332);
    out.m_27.x = _334;
    out.m_27.y = _346;
    out.m_27.z = _356;
    out.m_29.x = _348;
    out.m_29.y = _362;
    out.m_29.z = _374;
    out.m_31.x = _352;
    out.m_31.y = _366;
    out.m_31.z = _376;
    out.m_33.x = _354;
    out.m_33.y = _368;
    out.m_33.z = _378;
    out.m_35.x = _360;
    out.m_35.y = _372;
    out.m_35.z = _380;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

